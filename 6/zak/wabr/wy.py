# Enter script code
abbrfile = "/home/tazjel/Dropbox/myfile.txt" 
sep = '=' 
folder = engine.get_folder("wabr") 

f = open(abbrfile, 'r') 
for line in f: 
    abbr, contents = line.split(sep) 
    if len(contents) > 20: 
        title = contents[0:17] + "..." 
    else: 
        title = contents
    engine.create_abbreviation(folder,title,abbr,contents)