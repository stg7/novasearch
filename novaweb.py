#!/usr/bin/env python3
"""
    Copyright 2015-today
    Project Solr Search

    Author: Steve Göring
"""
import sys
import os
import argparse
import shelve
import json
import urllib.request
import re

# load libs from lib directory
import loader
from log import *
from system import *

from bottle import Bottle
from bottle import auth_basic
from bottle import route
from bottle import run
from bottle import template
from bottle import request
from bottle import redirect
from bottle import response
from bottle import error
from bottle import static_file


config = {}


def check_user(user, pw):
    return user == "stg7" and pw == "42"


def get_meta(id):
    filename = id.replace("./pdf/", config["meta_base_dir"]).replace(".pdf", ".json")
    print(filename)
    if not os.path.isfile(filename):
        return {"title": "", "abstract": ""}
    f = open(filename)
    j = json.load(f)
    f.close()

    return {"title": j["title"], "abstract": j.get("abstract", "")}


@route('/pdf/<sf>/<fn>')
@auth_basic(check_user)
def pdf(sf, fn):
    return static_file(sf + "/" + fn, root=config["pdf_base_dir"])

@route('/search')
@route('/search/<page>')
def search(page=1):
    response.headers['Content-Type'] = 'application/json'
    response.headers['Cache-Control'] = 'no-cache'
    url = config["solar_base_url"] #"http://localhost:8983/solr/acm-pdfs/select?"

    params = {
                "q": request.query.q,
                "indent" : "on",
                "wt": "json",
                "start": max((int(page) - 1) * 30, 0),
                "rows": "30"
             }
            # json.wrf=callback&

    url_params = urllib.parse.urlencode(params)

    req = urllib.request.Request(url + url_params)
    handle = urllib.request.urlopen(req, timeout=120)
    encoding = handle.headers.get_content_charset()
    content = str(handle.read().decode(encoding, errors='ignore'))
    tmp = json.loads(content)

    for d in tmp["response"]["docs"]:
        d["id"] = "./pdf" + d["id"].split("../pdf")[1]
        meta = get_meta(d["id"])
        d["title"] = meta["title"]
        d["abstract"] = meta["abstract"]

    return tmp


@route('/about')
def about():
    return template("templates/about.tpl", title="nova search")


@route('/')
def index():
    return template("templates/index.tpl", title="nova search")


@error(404)
def error404(error):
    return index()


@route("/favicon.ico")
def favicon():
    return server_static("favicon.ico")


@route('/static/<filename>')
def server_static(filename):
    return static_file(filename, root='templates/static')


def main(args):
    lInfo("start web interface for nova search")

    global config
    with open(os.path.dirname(os.path.realpath(__file__)) + "/config.json") as f:
        config = json.load(f)
        lInfo("config loaded")

    lInfo("server starting.")
    run(host=config["server_address"], port=config["server_port"], debug=True, reloader=True)
    lInfo("server stopped.")


if __name__ == "__main__":
    main(sys.argv[1:])
