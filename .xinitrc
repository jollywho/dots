#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xrdb .Xresources

xset r rate 230 80
setxkbmap -option caps:ctrl_modifier

unclutter -idle 1 &
xset s off
xset -dpms

if [ `hostname` == "letopanyu" ]; then
  pulseaudio --start
  feh --bg-scale ~/.config/wall.jpg
else
  xrandr --output DisplayPort1 --off --output DVI-0 --mode 1280x1024 --pos 1920x0 --rotate left --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal
  systemctl start smbd
  feh --bg-scale ~/.config/bg.jpg  ~/.config/ngnl.jpg
fi


#uim
export GTK_IM_MODULE='uim'
export QT_IM_MODULE='uim'
uim-xim &
export XMODIFIERS='@im=uim'

#exec awesome
exec i3

# Clipboard sync
/usr/bin/autocutsel -selection CLIPBOARD -fork
/usr/bin/autocutsel -selection PRIMARY -fork
