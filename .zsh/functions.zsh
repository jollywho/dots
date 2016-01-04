sippy() { curl -o- $(xclip -o) | sicp }

manswitch () { man $1 | less -p "^ +$2"; }

date2stamp () {
    date --utc --date "$1" +%s
}

stamp2date (){
    date --utc --date "1970-01-01 $1 sec" "+%Y-%m-%d %T"
}

tiny(){
  if [[ -n "$1" ]]; then
    url="$1"
    res=$(curl -s "http://is.gd/api.php?longurl=${url}")
    echo $res
  fi
}

dateDiff (){
    case $1 in
        -s)   sec=1;      shift;;
        -m)   sec=60;     shift;;
        -h)   sec=3600;   shift;;
        -d)   sec=86400;  shift;;
        *)    sec=86400;;
    esac
    dte1=$(date2stamp $1)
    dte2=$(date2stamp $2)
    diffSec=$((dte2-dte1))
    if ((diffSec < 0)); then abs=-1; else abs=1; fi
    echo $((diffSec/sec*abs))
}

webmc () {
  tdiff=$(dateDiff -s $2 $3)
  has_subs=$(ffprobe $1 2>&1 | grep "Stream.*: Sub")
  if [[ -n ${has_subs} ]]
  then
    ffmpeg -i "$1" out.ssa
    ffmpeg -i "$1" -vf subtitles=out.ssa -t $tdiff -ss $2 -cpu-used 0 -threads 4 -codec:v libx264 -crf 23 -preset medium -strict -2 "$1".avi
  else
    ffmpeg -i "$1" -t $tdiff -ss $2 -cpu-used 0 -threads 4 -codec:v libx264 -crf 23 -preset medium -strict -2 "$1".avi
  fi
  ffmpeg -i "$1".avi -cpu-used 0 -threads 4 -c:v libvpx -b:v 3M -c:a libvorbis "$1".webm
  rm out.ssa
  rm "$1".avi
}

sdcv_lookup()
{
  m=$(sdcv -n --color --data-dir $1 $2)
  if [[ -n "$3" ]]; then
    if [[ "$3" -eq 0 ]]; then
      m=$(echo $m | tail -1)
    else
      m=$(echo $m | grep -m 1 "^ *$3")
    fi
    echo $m | xclip
  fi
  echo -e $m | sed "s,^ *[0-9]\+[^.],$(tput setaf 3)&$(tput sgr0)," | less
}

dic() { sdcv_lookup "/usr/share/stardict/dic" $@ | fmt }

whichd()
{
  cd $(which $1 | xargs dirname)
}
