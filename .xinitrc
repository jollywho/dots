#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xrdb .Xresources

xset r rate 250 60
xrandr --output DisplayPort1 --off --output DVI-0 --mode 1280x1024 --pos 1920x0 --rotate left --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal
unclutter -idle 1 &
xset s off
xset -dpms

feh --bg-scale ~/.config/bg.jpg  ~/.config/ngnl.jpg

systemctl start smbd

export GTK_IM_MODULE='uim'
export QT_IM_MODULE='uim'
uim-xim &
export XMODIFIERS='@im=uim'

#exec awesome
exec i3
