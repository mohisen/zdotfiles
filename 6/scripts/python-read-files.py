#!/bin/python

while True:
    reply = raw_input('Enter text, [tpye "stop" to quit]: ')
    print reply.lower()
    if reply == 'stop':
        break


#
# The built-in function `open` opens a file and returns a file object.

# Read mode opens a file for reading only.
try:
    f = open("file.txt", "r")
    try:
        # Read the entire contents of a file at once.
        string = f.read()
        # OR read one line at a time.
        line = f.readline()
        # OR read all the lines into a list.
        lines = f.readlines()
    finally:
        f.close()
except IOError:
    pass


# Write mode creates a new file or overwrites the existing content of the file.
# Write mode will _always_ destroy the existing contents of a file.
try:
    # This will create a new file or **overwrite an existing file**.
    f = open("file.txt", "w")
    try:
        f.write('blah') # Write a string to a file
        f.writelines(lines) # Write a sequence of strings to a file
    finally:
        f.close()
except IOError:
    pass

# Append mode adds to the existing content, e.g. for keeping a log file. Append
# mode will _never_ harm the existing contents of a file.
try:
    # This tries to open an existing file but creates a new file if necessary.
    logfile = open("log.txt", "a")
    try:
        logfile.write('log log log')
    finally:
        logfile.close()
except IOError:
    pass

# There is also r+ (read and write) mode.
#
##Moving up/down dir structure
print os.listdir('.') # current level
print os.listdir('..') # one level up
print os.listdir('../..') # two levels up



# more complex example:
# This will walk the file system beginning in the directory the script is run from. It
# deletes the empty directories at each level

for root, dirs, files in os.walk(os.getcwd()):
    for name in dirs:
        try:
            os.rmdir(os.path.join(root, name))
        except WindowsError:
            print 'Skipping', os.path.join(root, name)
#
#####################################################
##
##  Prints a dir structure to a text file
##
##  Usage : python printdir.py [path ala z:/mypath or /mypath/foo
##
####################################################

import os, sys

dir = sys.argv[1]
outName = 'dirpaths.txt'
f = open(outName,'w')

# write initial dir for reference
f.write (dir + '\n')

count = 0

for item in os.walk(dir):
    count = count + 1
    item = item[0].replace('\\','/')
    curPath = item.split('/')
    if count == 1:
        curPath = item
    else:
        curPath = '\t' * (len(curPath)-1) + curPath[len(curPath)-1]

    f.write(curPath + '\n')
    print curPath


f.close
if os.path.exists(outName) :
    print 'File saved to: %s' % (outName)
