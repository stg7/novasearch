#!/usr/bin/env python3
"""
    Copyright 2016-today
    Project Nova Search

    Author: Steve Göring
"""
"""
    novasearch build meta files based on acm web html download

    This file is part of novasearch.

    novasearch is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    novasearch is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with novasearch.  If not, see <http://www.gnu.org/licenses/>.
"""

import os
import sys
import json
import re
import string
from multiprocessing import Pool
import multiprocessing


def cleanhtml(raw_html):
    """
    remove all html related tags in a string to plain text
    """
    cleanr = re.compile('<.*?>')
    cleantext = re.sub(cleanr, '', raw_html)
    from html import unescape

    tmp = unescape(cleantext.replace("\n", " "))

    filtered_string = ""
    for x in tmp:
        if x in string.printable:
            filtered_string += x

    return filtered_string.strip()


def extract_meta(x):
    """
    extract meta inforamtions of html file x (acm html download)
    """
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
    f.write(json.dumps(meta, indent=4, sort_keys=True))
    f.close()
    print(title)


def main(params):
    os.system("mkdir -p meta")  # TODO(stg7) change it to a better style without os.system
    os.system("find -L html -name '*.html' > infiles")
    infiles = [x.strip() for x in open("infiles", "r").readlines()]

    cpu_count = multiprocessing.cpu_count()
    pool = Pool(processes=cpu_count)

    pool.map(extract_meta, infiles)


if __name__ == "__main__":
    main(sys.argv[1:])
