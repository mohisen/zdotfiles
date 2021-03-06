import os

def read_file(name):
  print 'printing contents of file ' + name
  f = None
  #We use try...finally to ensure that the file is closed even if there
  #is a problem while processing it
  try:
    f = file(name, 'r')
    line = f.readline()
    while(len(line) != 0):
      print line, #notice the , to prevent printing a newline character
      line = f.readline()
  finally:
    if f != None:
      f.close()

def dir_list(dir_name, subdir, *args):
    '''Return a list of file names in directory 'dir_name'
    If 'subdir' is True, recursively access subdirectories under 'dir_name'.
    Additional arguments, if any, are file extensions to add to the list.
    Example usage: fileList = dir_list(r'H:\TEMP', False, 'txt', 'py', 'dat', 'log', 'jpg')
    '''
    fileList = []
    for file in os.listdir(dir_name):
        dirfile = os.path.join(dir_name, file)
        if os.path.isfile(dirfile):
            if len(args) == 0:
                fileList.append(dirfile)
            else:
                if os.path.splitext(dirfile)[1][1:] in args:
                    fileList.append(dirfile)

        # recursively access file names in subdirectories
        elif os.path.isdir(dirfile) and subdir:
            # print "Accessing directory:", dirfile
            fileList += dir_list(dirfile, subdir, *args)
    return fileList

def combine_files(fileList, fn):
    f = open(fn, 'w')
    for file in fileList:
        print 'Writing file %s' % file
        f.write(open(file).read())
    f.close()
    print 'Done '

if __name__ == '__main__':
    fn = "/home/ahmed/alltxt/WWW.txt"
    fileList = dir_list(r'/home/ahmed/alltxt/', True, 'txt' )
    combine_files(fileList, fn)

