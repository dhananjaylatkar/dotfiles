#!/usr/bin/python3
import os

FULL_PATH = os.getcwd()

find_cmd = 'find ' + FULL_PATH +' -path "' + FULL_PATH + '/.git" -prune -o -name "*" -print -type f > /tmp/files'
os.system(find_cmd)

f = open('/tmp/files', 'r')
find_out = f.readlines()
f.close()

files = []
for fl in find_out:
    fl = fl.strip()
    if os.path.isdir(fl):
        continue
    files.append(fl)

os.chdir(os.path.expanduser("~"))

CURR_PATH = os.getcwd()

for file in files:
    dot_path = file.split(FULL_PATH + '/')[1]
    if dot_path == 'create_symlinks.py' or 'emacs' in dot_path:
        continue
    cmd = 'ln -s -F ' + file + ' ' + dot_path
    try:
        os.makedirs(os.path.dirname(os.path.abspath(dot_path)))
    except FileExistsError:
        pass
    print(cmd)
    os.system(cmd)
