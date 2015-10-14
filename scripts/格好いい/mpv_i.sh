#!/usr/bin/bash
# Workaround for ranger to use
# a single mpv instance

pkill -x mpv

# use compton because fail drivers
compton --config /dev/null --backend glx

mpv -fs -- "$@"
