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

if [ `hostname` == "letopanyu" ]; then
  pulseaudio --start
else
  systemctl start smbd
  xsetroot -solid "#000000"
  feh --bg-scale ~/.config/bgg.png
fi


#uim
#export GTK_IM_MODULE='uim'
#export QT_IM_MODULE='uim'
#uim-xim &
#export XMODIFIERS='@im=uim'

exec i3

# Clipboard sync
/usr/bin/autocutsel -selection CLIPBOARD -fork
/usr/bin/autocutsel -selection PRIMARY -fork
