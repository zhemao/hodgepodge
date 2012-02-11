import os
import sys
import random
import shutil

if __name__ == "__main__":
    files = sys.argv[1:]
    random.shuffle(files)

    for i, fname in enumerate(files):
        _, ext = os.path.splitext(fname)
        newname = str(i+1) + ext
        print(fname + " is now " + newname)
        shutil.copy(fname, newname)
