#!/usr/bin/env python3
import os
import sys
import json
import re
import string
from multiprocessing import Pool
import multiprocessing


def cleanhtml(raw_html):
    cleanr = re.compile('<.*?>')
    cleantext = re.sub(cleanr,'', raw_html)
    from html import unescape

    tmp = unescape(cleantext.replace("\n", " "))

    filtered_string = ""
    for x in tmp:
        if x in string.printable:
            filtered_string += x

    return filtered_string.strip()


def extract_meta(x):
    f = open(x, "r", errors='ignore')
    title = ""
    abstract = ""
    abstract_start = False
    for l in f:
        if "<title>" in l:
            title = l.replace("<title>", "").replace("</title>", "").strip()
        if abstract_start and "AUTHORS</SPAN>" in l:
            abstract_start = False
        if abstract_start:
            abstract += l
        if "ABSTRACT</A>" in l:
            abstract_start = True

    f.close()
    newfile = x.replace("html/", "meta/").replace(".html", ".json")
    newpath = newfile.replace(os.path.basename(newfile), "")
    os.system("mkdir -p {p}".format(p=newpath))
    f = open(newfile, "w")
    meta = {"title": title, "abstract": cleanhtml(abstract)}
    f.write(json.dumps(meta,indent=4, sort_keys=True))
    f.close()
    print(title)


def main(params):
    os.system("mkdir -p meta")
    os.system("find -L html -name '*.html' > infiles")
    infiles = [x.strip() for x in open("infiles", "r").readlines()]

    cpu_count = multiprocessing.cpu_count()
    pool = Pool(processes=cpu_count)

    pool.map(extract_meta, infiles)


if __name__ == "__main__":
    main(sys.argv[1:])