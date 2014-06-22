#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xrdb .Xresources

xrandr --output DVI-0 --auto --right-of HDMI-0

#exec awesome
exec i3
