#!/usr/bin/bash
# Workaround for ranger to use
# a single mpv instance
pkill -x mpv
mpv -fs -- "$@"
