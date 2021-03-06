
"""
rencode -- Web safe object pickling/unpickling. Python 3k version

The rencode module is a modified version of bencode from the
BitTorrent project.  For complex, heterogeneous data structures with
many small elements, r-encodings take up significantly less space than
b-encodings:

 >>> len(rencode.dumps({'a':0, 'b':[1,2], 'c':99}))
 13
 >>> len(bencode.bencode({'a':0, 'b':[1,2], 'c':99}))
 26

The rencode format is not standardized, and may change with different
rencode module versions, so you should check that you are using the
same rencode version throughout your project.
"""

__version__ = '1.0.0-ntk'
__all__ = ['dumps', 'loads', 'serializable']

from base64 import b64encode, b64decode

##TODO
# - Why the hell it encodes both tuples and lists to tuple?
#   Try loads(dumps([1,(2,3)]))
#   Grr
#
# - extend it! Support other basic types, f.e. Set()
#
##

# Original bencode module by Petru Paler, et al.
#
# Modifications by Joseph Parker:
# - Conversion to Python 3.x
#
# Modifications by Daniele Tricoli:
#
#  - Added support for instances
#    Only registered instances can be serialized. An instance to be serialized
#    must provide a '_pack` method.
#    E.g.
#
#    class X(object):
#
#        def __init__(self, x):
#            self.x = x
#
#        def _pack(self)
#           return (self.x,) # a tuple
#
#  - Lists are decoded again as list
#
# Modifications by Connelly Barnes:
#
#  - Added support for floats (sent as 32-bit or 64-bit in network
#    order), bools, None.
#  - Allowed dict keys to be of any serializable type.
#  - Lists/tuples are always decoded as tuples (thus, tuples can be
#    used as dict keys).
#  - Embedded extra information in the 'typecodes' to save some space.
#  - Added a restriction on integer length, so that malicious hosts
#    cannot pass us large integers which take a long time to decode.
#
# Licensed by Bram Cohen under the "MIT license":
#
#  "Copyright (C) 2001-2002 Bram Cohen
#
#  Permission is hereby granted, free of charge, to any person
#  obtaining a copy of this software and associated documentation files
#  (the "Software"), to deal in the Software without restriction,
#  including without limitation the rights to use, copy, modify, merge,
#  publish, distribute, sublicense, and/or sell copies of the Software,
#  and to permit persons to whom the Software is furnished to do so,
#  subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be
#  included in all copies or substantial portions of the Software.
#
#  The Software is provided "AS IS", without warranty of any kind,
#  express or implied, including but not limited to the warranties of
#  merchantability,  fitness for a particular purpose and
#  noninfringement. In no event shall the  authors or copyright holders
#  be liable for any claim, damages or other liability, whether in an
#  action of contract, tort or otherwise, arising from, out of or in
#  connection with the Software or the use or other dealings in the
#  Software."
#
# (The rencode module is licensed under the above license as well).
#

import inspect
import struct

from threading import Lock
import types


class AlreadyRegistered(Exception): pass

class NotRegistered(Exception):

        def __init__(self, class_):
                self.class_ = class_

        def __str__(self):
                return 'Class %s is not registered' % self.class_

class NotSerializable(Exception): pass

def add_class_name(func):

        if inspect.ismethod(func):
                def decorate(*args, **kargs):
                        result = func(*args, **kargs)
                        result = (str(func.im_class.__name__),) + result
                        return result

                return decorate

class _SerializableRegistry(object):

        def __init__(self):
                self._registry = {}

        def __contains__(self, item):
                return item in self._registry

        def __getitem__(self, key):
                return self._registry[key]

        def register(self, cls):
                '''   '''
                if inspect.isclass(cls):

                        if cls.__name__ in self._registry:
                                msg = 'Class %s is already registered' % cls.__name__
                                raise AlreadyRegistered(msg)

                        try:
                                if inspect.ismethod(cls._pack):
                                        cls._pack = add_class_name(cls._pack)
                                        self._registry[cls.__name__] = cls
                        except AttributeError as err:
                                raise NotSerializable(err)

        def unregister(self, cls):
                '''   '''
                if inspect.isclass(cls):

                        if cls in self._registry:
                                del self._registry[cls.__name__]
                        else: 
                                raise NotRegistered(cls.__name__)

serializable = _SerializableRegistry()

# Number of bits for serialized floats, either 32 or 64.
FLOAT_BITS = 32

# Maximum length of integer when written as base 10 string.
MAX_INT_LENGTH = 64

# The bencode 'typecodes' such as i, d, etc have been extended and
# relocated on the base-256 character set.
# Can't be used chr(48) to chr(57) because they are manually set
CHR_INSTANCE = b'/'
CHR_TUPLE = b':'
CHR_LIST = b';'
CHR_DICT = b'<'
CHR_INT = b'='
CHR_INT1 = b'>'
CHR_INT2 = b'?'
CHR_INT4 = b'@'
CHR_INT8 = b'A'
CHR_FLOAT = b'B'
CHR_TRUE = b'C'
CHR_FALSE = b'D'
CHR_NONE = b'E' 
CHR_TERM = b'\x7f'

# Positive integers with value embedded in typecode.
INT_POS_FIXED_START = 0
INT_POS_FIXED_COUNT = 32

# Dictionaries with length embedded in typecode.
DICT_FIXED_START = 102
DICT_FIXED_COUNT = 25

# Negative integers with value embedded in typecode.
INT_NEG_FIXED_START = 70
INT_NEG_FIXED_COUNT = 32

# Strings with length embedded in typecode.
STR_FIXED_START = 128
STR_FIXED_COUNT = 64

# Lists with length embedded in typecode.
LIST_FIXED_START = STR_FIXED_START + STR_FIXED_COUNT
LIST_FIXED_COUNT = 32

# Tuples with length embedded in typecode.
TUPLE_FIXED_START = LIST_FIXED_START + LIST_FIXED_COUNT
TUPLE_FIXED_COUNT = 32

def decode_int(x, f):

        f += 1
        newf = x.index(CHR_TERM, f)
        if newf - f >= MAX_INT_LENGTH:
                raise ValueError('overflow')
        try:
                n = int(x[f:newf])
        except (OverflowError, ValueError):
                n = long(x[f:newf])
        if x[f] == '-':
                if x[f + 1] == '0':
                        raise ValueError
        elif x[f] == '0' and newf != f+1:
                raise ValueError
        
        return (n, newf+1)

def decode_intb(x, f):
        f += 1
        return (struct.unpack('!b', x[f:f+1])[0], f+1)

def decode_inth(x, f):
        f += 1
        return (struct.unpack('!h', x[f:f+2])[0], f+2)

def decode_intl(x, f):
        f += 1
        return (struct.unpack('!l', x[f:f+4])[0], f+4)

def decode_intq(x, f):
        f += 1
        return (struct.unpack('!q', x[f:f+8])[0], f+8)

def decode_float(x, f):
        f += 1
        if FLOAT_BITS == 32:
                n = struct.unpack('!f', x[f:f+4])[0]
                return (n, f+4)
        elif FLOAT_BITS == 64:
                n = struct.unpack('!d', x[f:f+8])[0]
                return (n, f+8)
        else:
                raise ValueError

def decode_string(x, f):
        colon = x.index(b':', f)
        try:
                n = int(x[f:colon])
        except (OverflowError, ValueError):
                n = long(x[f:colon])
        if x[f] == '0' and colon != f+1:
                raise ValueError
        colon += 1
        return (x[colon:colon+n].decode(), colon+n)

def decode_list(x, f):
        r, f = [], f+1
        while x[f:f+1] != CHR_TERM:
                l = determine_flag_len(x, f)
                v, f = decode_func[x[f:f+l]](x, f)
                r.append(v)
        return (r, f + 1)

def decode_tuple(x, f):
        r, f = [], f+1
        while x[f:f+1] != CHR_TERM:
                l = determine_flag_len(x, f)
                v, f = decode_func[x[f:f+l]](x, f)
                r.append(v)
        return (tuple(r), f + 1)

def decode_dict(x, f):
        r, f = {}, f+1
        
        while x[f:f+1] != CHR_TERM:
                l = determine_flag_len(x, f)
                k, f = decode_func[x[f:f+l]](x, f)
                l = determine_flag_len(x, f)
                r[k], f = decode_func[x[f:f+l]](x, f)
        return (r, f + 1)

def decode_true(x, f):
  return (True, f+1)

def decode_false(x, f):
  return (False, f+1)

def decode_none(x, f):
  return (None, f+1)

def decode_instance(x, f):
        f += 1
        while x[f] != CHR_TERM:
                v, f = decode_func[x[f]](x, f)
        if v[0] in serializable:
                r = serializable[v[0]](*v[1:])
        else:
                raise NotRegistered(v[0])
        return (r, f+1)

decode_func = {}
decode_func[b'0'] = decode_string
decode_func[b'1'] = decode_string
decode_func[b'2'] = decode_string
decode_func[b'3'] = decode_string
decode_func[b'4'] = decode_string
decode_func[b'5'] = decode_string
decode_func[b'6'] = decode_string
decode_func[b'7'] = decode_string
decode_func[b'8'] = decode_string
decode_func[b'9'] = decode_string
decode_func[CHR_LIST ] = decode_list
decode_func[CHR_TUPLE] = decode_tuple
decode_func[CHR_DICT ] = decode_dict
decode_func[CHR_INT  ] = decode_int
decode_func[CHR_INT1 ] = decode_intb
decode_func[CHR_INT2 ] = decode_inth
decode_func[CHR_INT4 ] = decode_intl
decode_func[CHR_INT8 ] = decode_intq
decode_func[CHR_FLOAT] = decode_float
decode_func[CHR_TRUE ] = decode_true
decode_func[CHR_FALSE] = decode_false
decode_func[CHR_NONE ] = decode_none
decode_func[CHR_INSTANCE] = decode_instance

def make_fixed_length_string_decoders():
        def make_decoder(slen):
                def f_fixed_string(x, f):
                        l = determine_flag_len(x, f)
                        return (x[f+l:f+l+slen].decode(), f+l+slen)
                return f_fixed_string
        for i in range(STR_FIXED_COUNT):
                #print(chr(STR_FIXED_START+i).encode())
                decode_func[chr(STR_FIXED_START+i).encode()] = make_decoder(i)

make_fixed_length_string_decoders()

## switch for type identifier, is it 1 or 2 bytes?
def determine_flag_len(x, f): #data, index
        l = 1 #length
        if x[f:f+1] in (b'\xc2', b'\xc3'): #have to slice to preserve b'bytes'
                l = 2
        return l


def make_fixed_length_list_decoders():
        def make_decoder(slen):
                def f_fixed_list(x, f):
                        l = determine_flag_len(x, f)
                        r, f = [], f+l
                        
                        for i in range(slen):
                                l = determine_flag_len(x, f)
                                v, f = decode_func[x[f:f+l]](x, f)
                                r.append(v)
                        return (r, f)
                return f_fixed_list
        for i in range(LIST_FIXED_COUNT):
                decode_func[chr(LIST_FIXED_START+i).encode()] = make_decoder(i)

make_fixed_length_list_decoders()

def make_fixed_length_tuple_decoders():
        def make_decoder(slen):
                def f_fixed_tuple(x, f):
                        l = determine_flag_len(x, f)
                        r, f = [], f+l
                        for i in range(slen):
                                l = determine_flag_len(x, f)
                                v, f = decode_func[x[f:f+l]](x, f)
                                r.append(v)
                        return (tuple(r), f)
                return f_fixed_tuple
        for i in range(TUPLE_FIXED_COUNT):
                decode_func[chr(TUPLE_FIXED_START+i).encode()] = make_decoder(i)

make_fixed_length_tuple_decoders()

def make_fixed_length_int_decoders():
        def make_decoder(j):
                def f(x, f):
                        return (j, f+1)
                return f
        for i in range(INT_POS_FIXED_COUNT):
                decode_func[chr(INT_POS_FIXED_START+i).encode()] = make_decoder(i)
        for i in range(INT_NEG_FIXED_COUNT):
                decode_func[chr(INT_NEG_FIXED_START+i).encode()] = make_decoder(-1-i)

make_fixed_length_int_decoders()

def make_fixed_length_dict_decoders():
        def make_decoder(slen):
                def f(x, f):
                        l = determine_flag_len(x, f)
                        r, f = {}, f+l
                        
                        for j in range(slen):
                                
                                l = determine_flag_len(x, f)
                                k, f = decode_func[x[f:f+l]](x, f)
                                
                                l = determine_flag_len(x, f)
                                r[k], f = decode_func[x[f:f+l]](x, f)
                                
                                
                        return (r, f)
                        
                return f
        for i in range(DICT_FIXED_COUNT):
                decode_func[chr(DICT_FIXED_START+i).encode()] = make_decoder(i)

make_fixed_length_dict_decoders()

def loads(x):
        flagl = determine_flag_len(x, 0)
        try:
                r, l = decode_func[x[0:flagl]](x, 0)
        except (IndexError, KeyError):
                raise 
        if l != len(x):
                print(r, l, len(x))
                print("ValueError")
                #raise ValueError
        return r

def encode_int(x, r):
        if 0 <= x < INT_POS_FIXED_COUNT:
                r.append(chr(INT_POS_FIXED_START+x).encode())
                
        elif -INT_NEG_FIXED_COUNT <= x < 0:
                r.append(chr(INT_NEG_FIXED_START-1-x).encode())
        elif -128 <= x < 128:
                r += [CHR_INT1, struct.pack('!b', x)]
                
        elif -32768 <= x < 32768:
                r += [CHR_INT2, struct.pack('!h', x)]
                
        elif -2147483648 <= x < 2147483648:
                r += [CHR_INT4, struct.pack('!l', x)]
        elif -9223372036854775808 <= x < 9223372036854775808:
                
                r += [CHR_INT8, struct.pack('!q', x)]
        else:
                s = str(x).encode()
                if len(s) >= MAX_INT_LENGTH:
                        raise ValueError('overflow')
                r += [CHR_INT, s, CHR_TERM]

def encode_float(x, r):

        if FLOAT_BITS == 32:

                r += [CHR_FLOAT, struct.pack('!f', x)]
        elif FLOAT_BITS == 64:

                r += [CHR_FLOAT, struct.pack('!d', x)]
        else:
                raise ValueError

def encode_bool(x, r):

        r += [{False: CHR_FALSE, True: CHR_TRUE}[bool(x)] ]

def encode_none(x, r):
        r.append(CHR_NONE)

def encode_string(x, r):
        x = x.encode()
        if len(x) < STR_FIXED_COUNT:
                r += [chr(STR_FIXED_START + len(x)).encode(), x]
        else:
                r += [str(len(x)).encode(), b':', x]

def encode_list(x, r):
        if len(x) < LIST_FIXED_COUNT:
                r += [chr(LIST_FIXED_START + len(x)).encode()]
                for i in x:
                        encode_func.get(type(i), encode_instance)(i, r)
        else:
                r.append(CHR_LIST)
                for i in x:
                        encode_func.get(type(i), encode_instance)(i, r)
                r.append(CHR_TERM)


def encode_tuple(x, r):
        if len(x) < TUPLE_FIXED_COUNT:
                r += [chr(TUPLE_FIXED_START + len(x)).encode() ]
                for i in x:
                        encode_func.get(type(i), encode_instance)(i, r)
        else:
                r.append(CHR_TUPLE)
                for i in x:
                        encode_func.get(type(i), encode_instance)(i, r)
                r.append(CHR_TERM)

def encode_dict(x,r):
        if len(x) < DICT_FIXED_COUNT:
                r.append(chr(DICT_FIXED_START + len(x)).encode() )
                for k, v in x.items():
                        encode_func[type(k)](k, r)
                        encode_func[type(v)](v, r)
        else:
                r.append(CHR_DICT) 
                for k, v in x.items():
                        encode_func[type(k)](k, r)
                        encode_func[type(v)](v, r)
                r.append(CHR_TERM) 
        

encode_func = {}
encode_func[int] = encode_int
encode_func[int] = encode_int
encode_func[float] = encode_float
encode_func[str] = encode_string
encode_func[list] = encode_list
encode_func[tuple] = encode_tuple
encode_func[dict] = encode_dict
encode_func[type(None)] = encode_none
encode_func[type(True)] = encode_bool


def encode_instance(x, r):
        if hasattr(x, '_pack'):
                if x.__class__.__name__ in serializable:
                        # Calling the class of instance `x' passing it to the
                        # unbound method
                        result = serializable[x.__class__.__name__]._pack(x)
                        r.append(CHR_INSTANCE.encode())
                        encode_func[type(result)](result, r)
                        r.append(CHR_TERM.encode())
                else:
                        raise NotRegistered(x.__class__.__name__)

lock = Lock()

def dumps(x):
        lock.acquire()
        r = []
        encode_func.get(type(x), encode_instance)(x, r)
        lock.release()
        for entry in r:
                if type(entry) != bytes:
                        print("!!!!!!!!!", entry)
        return b''.join(r)
