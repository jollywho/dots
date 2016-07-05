#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx

xrdb .Xresources

xset r rate 230 80
setxkbmap -option caps:ctrl_modifier

unclutter -idle 1 &
xset s off
xset -dpms


exec i3

# Clipboard sync
/usr/bin/autocutsel -selection CLIPBOARD -fork
/usr/bin/autocutsel -selection PRIMARY -fork
