# Aliases in this file are bash and zsh compatible

# Don't change. The following determines where dots is installed.
dots=$HOME/dots

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

#expand following word when using sudo
alias sudo='sudo '

alias pkS="packer-color -S"
alias pks="packer-color -Ss"
alias pk="packer-color"
alias diff="colordiff"

alias ydl="youtube-dl"
alias ydl3="youtube-dl -x"
alias ydlg="youtube-dl -citw"

alias diff="colordiff"
alias tv="livestreamer --player mpv"
alias ydl="youtube-dl"
alias ydl3="youtube-dl -x"
alias ydlg="youtube-dl -citw"
alias scm="rlwrap scheme"
alias t="task"
alias calc='orpie'
alias stamp='date "+%Y-%m-%d"'
alias trans='transmission-remote-cli'
alias transd='transmission-daemon'

# dots support
alias yav='dots vim-add-plugin'
alias ydv='dots vim-delete-plugin'
alias ylv='dots vim-list-plugin'
alias yup='dots update-plugins'
alias yip='dots init-plugins'

# PS
alias psa="ps aux"
alias psg="ps aux | grep "
alias psr='ps aux | grep ruby'

# Moving around
alias cdb='cd -'

# Show human friendly numbers and colors
alias df='df -h'
alias ls='ls++'
alias ll='ls -alGh'
alias du='du -h -d 2'

# show me files matching "ls grep"
alias lsg='ll | grep'

# Alias Editing
alias ae='vim $dots/zsh/aliases.zsh' #alias edit
alias ar='source $dots/zsh/aliases.zsh'  #alias reload

# vimrc editing
alias ve='vim ~/.vimrc'

# zsh profile editing
alias ze='vim ~/.zshrc'
alias zr='source ~/.zshrc'

# Git Aliases
alias gs='git status'
alias gstsh='git stash'
alias gst='git stash'
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gsh='git show'
alias gshw='git show'
alias gshow='git show'
alias gi='vim .gitignore'
alias gcm='git ci -m'
alias gcim='git ci -m'
alias gci='git ci'
alias gco='git co'
alias gcp='git cp'
alias ga='git add -A'
alias guns='git unstage'
alias gunc='git uncommit'
alias gm='git merge'
alias gms='git merge --squash'
alias gam='git amend --reset-author'
alias grv='git remote -v'
alias grr='git remote rm'
alias grad='git remote add'
alias gr='git rebase'
alias gra='git rebase --abort'
alias ggrc='git rebase --continue'
alias gbi='git rebase --interactive'
alias gl='git l'
alias glg='git l'
alias glog='git log'
alias co='git co'
alias gf='git fetch'
alias gfch='git fetch'
alias gd='git diff'
alias gb='git b'
alias gbd='git b -D -w'
alias gcd='git diff --cached -w'
alias gpub='grb publish'
alias gtr='grb track'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpsh='git push'
alias gnb='git nb' # new branch aka checkout -b
alias grs='git reset'
alias grsh='git reset --hard'
alias gcln='git clean'
alias gclndf='git clean -df'
alias gclndfx='git clean -dfx'
alias gsm='git submodule'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gt='git t'
alias gbg='git bisect good'
alias gbb='git bisect bad'

# Common shell functions
alias less='less -R'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'

# Zippin
alias gz='tar -zcvf'

# Ruby
alias c='rails c' # Rails 3
alias co='script/console --irb=pry' # Rails 2
alias ts='thin start'
alias ms='mongrel_rails start'
alias tfdl='tail -f log/development.log'
alias tftl='tail -f log/test.log'

alias ka9='killall -9'
alias k9='kill -9'

# Gem install
alias sgi='sudo gem install --no-ri --no-rdoc'

# Forward port 80 to 3000
alias portforward='sudo ipfw add 1000 forward 127.0.0.1,3000 ip from any to any 80 in'

alias rdm='rake db:migrate'
alias rdmr='rake db:migrate:redo'

# Zeus
alias zs='zeus server'
alias zc='zeus console'

# Rspec
alias rs='rspec spec'
alias sr='spring rspec'
alias srgm='spring rails g migration'
alias srdm='spring rake db:migrate'
alias srdt='spring rake db:migrate'
alias srdmt='spring rake db:migrate db:test:prepare'

# Sprintly - https://github.com/nextbigsoundinc/Sprintly-GitHub
alias sp='sprintly'
# spb = sprintly branch - create a branch automatically based on the bug you're working on
alias spb="git checkout -b \`sp | tail -2 | grep '#' | sed 's/^ //' | sed 's/[^A-Za-z0-9 ]//g' | sed 's/ /-/g' | cut -d"-" -f1,2,3,4,5\`"
