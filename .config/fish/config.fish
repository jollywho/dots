set fish_greeting
set PATH /usr/local/bin $PATH
export EDITOR=/bin/nvim

set -x LESS_TERMCAP_mb (printf "\033[01;34m")  
set -x LESS_TERMCAP_md (printf "\033[35m")  
set -x LESS_TERMCAP_me (printf "\033[0m")  
set -x LESS_TERMCAP_se (printf "\033[0m")  
set -x LESS_TERMCAP_so (printf "\033[03;31;33m")  
set -x LESS_TERMCAP_ue (printf "\033[0m")  
set -x LESS_TERMCAP_us (printf "\033[34m")

set fish_color_command red

function fish_prompt
  printf '%s' (set_color blue) (whoami) (set_color normal)
  printf '%s' @(set_color yellow)(hostname | cut -d . -f1) (set_color normal)
  printf '%s' [(set_color $fish_color_cwd)(prompt_pwd) (set_color normal)]
  printf ' '
end

alias muttf="mutt -F ~/.mutt/mutt_f"
alias p='pass'

alias vim="nvim"
alias nv="nvim"
alias sudo="sudo "
alias tt="task calendar"
alias pki="packer-color -Si"
alias pks="packer-color -Ss"
alias pkS="packer-color -S"
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
alias t="task"
alias calc='orpie'
alias stamp='date "+%Y-%m-%d"'
alias trans='transmission-remote-cli'
alias transd='transmission-daemon'

# PS
alias psa="ps aux"
alias psg="ps aux | grep "

# Show human friendly numbers and colors
alias df='df -h'
alias ll='ls -alGh'
alias la='ls -a'
alias du='du -h -d 2'

# show me files matching "ls grep"
alias lsg='ll | grep'

# vimrc editing
alias ve='eval $EDITOR ~/.vimrc'

# fish editing
alias fi='eval $EDITOR ~/.config/fish/config.fish'

alias gi='eval $EDITOR .gitignore'

alias mi='eval $EDITOR ~/.mpv/config'

# Git Aliases
alias g='git'

# Branch (b)
alias gb='git branch'
alias gbc='git checkout -b'
alias gbl='git branch -v'
alias gbL='git branch -av'
alias gbx='git branch -d'
alias gbX='git branch -D'
alias gbm='git branch -m'
alias gbM='git branch -M'
alias gbs='git show-branch'
alias gbS='git show-branch -a'

# Commit (c)
alias gc='git commit --verbose'
alias gca='git commit --verbose --all'
alias gcm='git commit --message'
alias gco='git checkout'
alias gcO='git checkout --patch'
alias gcf='git commit --amend --reuse-message HEAD'
alias gcF='git commit --verbose --amend'
alias gcp='git cherry-pick --ff'
alias gcP='git cherry-pick --no-commit'
alias gcr='git revert'
alias gcR='git reset "HEAD^"'
alias gcs='git show'
alias gcl='git-commit-lost'
#
# Index (i)
alias ga='git add .'
alias gia='git add $argv'
alias giA='git add --patch'
alias giu='git add --update'
alias gid='git diff --no-ext-diff --cached'
alias giD='git diff --no-ext-diff --cached --word-diff'
alias gir='git reset'

alias gs='git status'
alias gst='git stash'
alias gsp='git stash pop'
alias gsa='git stash apply'

alias gsh='git show'
alias gshw='git show'
alias gshow='git show'
alias gcm='git ci -m'
alias gcim='git ci -m'
alias gci='git ci'
alias gco='git co'
alias gcp='git cp'
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

alias gp='git push'

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

# Zippin
alias gz='tar -zcvf'

alias ka9='killall -9'
alias k9='kill -9'

# Forward port 80 to 3000
alias portforward='sudo ipfw add 1000 forward 127.0.0.1,3000 ip from any to any 80 in'

alias rdm='rake db:migrate'
alias rdmr='rake db:migrate:redo'

function o
  nvim build/a
end

function v
  make; valgrind --leak-check=full --log-file=build/a ./build/nav -d $argv
end

function sippy
  curl -o- (xclip -o) | sicp
end

function manswitch
  man $1 | less -p "^ +$2"
end

function date2stamp
  date --utc --date $varg +%s
end

function stamp2date
  date --utc --date "1970-01-01 $varg sec" "+%Y-%m-%d %T"
end

function dateDiff
  switch $argv[1]
    case -s   sec=1;
    case -m   sec=60;
    case -h   sec=3600;
    case -d   sec=86400;
    case *    sec=86400;;
  end

  let dte1=(date2stamp $argv[1])
  let dte2=(date2stamp $argv[2])
  let diffSec=(dte2-dte1)

  if math diffSec < 0
    abs=-1
  else
    abs=1
  end

  echo (math diffSec/sec*abs)
end

function webmc
  let tdiff=(dateDiff -s $argv[2] $argv[3])
  let has_subs=(ffprobe $argv[1] 2>&1 | grep "Stream.*: Sub")
  if test -n $has_subs
    ffmpeg -i "$argv[1]" out.ssa
    ffmpeg -i "$argv[1]" -vf subtitles=out.ssa -t $tdiff -ss $argv[2] -cpu-used 0 -threads 4 -codec:v libx264 -crf 23 -preset medium -strict -2 "$argv[1]".avi
  else
    ffmpeg -i "$argv[1]" -t $tdiff -ss $argv[2] -cpu-used 0 -threads 4 -codec:v libx264 -crf 23 -preset medium -strict -2 "$argv[1]".avi
  end
  ffmpeg -i "$argv[1]".avi -cpu-used 0 -threads 4 -c:v libvpx -b:v 3M -c:a libvorbis $argv[1].webm
  rm out.ssa
  rm "$argv[1]".avi
end

#sdcv_lookup()
#{
#  m=$(sdcv -n --color --data-dir $1 $2)
#  if [[ -n "$3" ]]; then
#    if [[ "$3" -eq 0 ]]; then
#      m=$(echo $m | tail -1)
#    else
#      m=$(echo $m | grep -m 1 "^ *$3")
#    fi
#    echo $m | xclip
#  fi
#  echo -e $m | sed "s,^ *[0-9]\+[^.],$(tput setaf 3)&$(tput sgr0)," | less
#}

function dic
  sdcv_lookup "/usr/share/stardict/dic" $argv | fmt
end

function whichd
  cd (which $1 | xargs dirname)
end

function fish_user_key_bindings
  bind $argv \cy yank
  bind $argv \cs beginning-of-line
  bind $argv \ce forward-word
  bind $argv \cb backward-word
  bind $argv \cf end-of-line
  bind $argv \cu 'commandline ""'
end

function sudo --description 'Run command using sudo (use !! for last command)'
  if test (count $argv) -gt 0
    switch $argv[1]
      case '!!'
        if test (count $argv) -gt 1
          set cmd "command sudo $history[1] $argv[2..-1]"
        else
          set cmd "command sudo $history[1]"
        end
      case '*'
        set cmd "command sudo $argv"
    end
  else
    set cmd "command sudo fish"
  end
  eval $cmd
end
