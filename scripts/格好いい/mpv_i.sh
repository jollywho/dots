#!/usr/bin/bash
# Workaround for ranger to use
# a single mpv instance

# use compton because fail drivers
function cleanup {
  pkill -xo compton
  pkill -xo mpv
}

ids=$(pgrep -x mpv_i)

echo self: $$
for proc in $ids
do
  if [ "$proc" -ne "$$" ]; then
    echo "killing..."
    echo $proc
    kill $proc
  fi
done

trap cleanup EXIT

compton --config /dev/null --backend glx --vsync opengl & disown
mpv -fs -- "$@"
