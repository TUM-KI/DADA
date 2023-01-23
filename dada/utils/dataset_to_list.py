from os import listdir, path
from os.path import isfile, join, expanduser
import json

path  = "./data/Carla/Depth"
out = "./dada/dataset/carla_list/all.txt"

files = [f for f in listdir(path) if isfile(join(path, f))]

# with open(expanduser(out), 'w') as filehandle:
#     json.dump(files, filehandle)

with open(out, "w") as file:
    for line in files:
        file.write(line + "\n")