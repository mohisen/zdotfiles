keyboard.send_keys("<ctrl>+c")

import time
time.sleep(0.25)
# The sleep seems to be necessary to avoid lockups
contents = clipboard.get_selection()
if len(contents) > 20:
    title = contents[0:17] + "..."
else:
    title = contents
folder = engine.get_folder("cinbox")
engine.create_phrase(folder, title, contents)