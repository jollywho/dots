setopt prompt_subst
autoload -U vcs_info

zstyle ':vcs_info:*'              enable        git cvs svn
zstyle ':vcs_info:*'              actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*'              formats       '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat  '%b%F{1}:%F{3}%r'

# set vimode to current editing mode
function zle-line-init zle-keymap-select {
  vimode="${${KEYMAP/vicmd/C}/(main|viins)/I}"
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

function vcs_info_wrapper {
  vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && echo " %{$fg[grey]%}${vcs_info_msg_0_/ /}%{$reset_color%}"
}

## Functions
function ssh_state {
    if [ -n "$SSh_CONNECTION" ]; then
        echo "%{$fg[red]%}<%{$fg[white]%}SSH%{$fg[red]%}> "
    fi
}

function collapse_pwd {
    if [[ $(pwd) == $HOME ]]; then
        echo $(pwd)
    else    
        echo $(pwd | sed -e "s,^$HOME,~,")
    fi
}

function error_code {
    if [[ $? == 0 ]]; then
        echo ""
    else
        echo "%{$fg[white]%}<%{$fg[red]%}%?%{$fg[white]%}>%{$reset_color%}"
fi
}

last_command='%(?.>>.<<)'


## Prompts
PROMPT='
  %{$fg[red]%}<%{$fg[white]%}$(collapse_pwd)%{$fg[red]%}> $(ssh_state)
%{$fg[white]%}$last_command%{$reset_color%} '

RPROMPT='$(error_code)%{$reset_color%}'
