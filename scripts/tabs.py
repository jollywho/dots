#!/usr/bin/python2
import os
import glob
import json

file = "~/.mozilla/firefox/*.default/sessionstore-backups/recovery.js"
file = glob.glob(os.path.expanduser(file))[0]

f = open(file, "r")
jdata = json.loads(f.read())
f.close()
for win in jdata.get("windows"):
  for tab in win.get("tabs"):
    i = tab.get("index") - 1
    print tab.get("entries")[i].get("url")
