#!/usr/bin/env python3
import os
import sys
import json
from multiprocessing import Pool
import multiprocessing


def do_it(x):
    f = open(x, "r", errors='ignore')
    title = ""
    for l in f:
        if "<title>" in l:
            title = l.replace("<title>", "").replace("</title>", "").strip()
    f.close()
    newfile = x.replace("html/", "meta/").replace(".html", ".json")
    newpath = newfile.replace(os.path.basename(newfile), "")
    os.system("mkdir -p {p}".format(p=newpath))
    f = open(newfile, "w")
    meta = {"title": title}
    f.write(json.dumps(meta))
    f.close()
    print(title)

def main(params):
    os.system("mkdir -p meta")
    os.system("find html -name '*.html' > infiles")
    infiles = [x.strip() for x in open("infiles", "r").readlines()]

    cpu_count = multiprocessing.cpu_count()
    pool = Pool(processes=cpu_count)

    pool.map(do_it, infiles)


if __name__ == "__main__":
    main(sys.argv[1:])