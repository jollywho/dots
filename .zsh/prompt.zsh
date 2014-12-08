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

# prompt
function prompt_git_dirty() {
    gitstat=$(git status 2>/dev/null | grep '\(# Untracked\|# Changes\|# Changed but not updated:\)')
    
    if [[ $(echo ${gitstat} | grep -c "^# Changes to be committed:$") > 0 ]]; then
        echo -n $PR_LIGHT_YELLOW
    elif [[ $(echo ${gitstat} | grep -c "^\(# Untracked files:\|# Changed but not updated:\)$") > 0 ]]; then
        echo -n $PR_LIGHT_RED
    else
        echo -n $PR_LIGHT_MAGENTA
    fi
}

function prompt_current_branch() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return 1
    echo ${ref#refs/heads/}
}

function prompt_hostname()
{
    case "`hostname`" in
        "Arch")
            echo -n "${PR_LIGHT_YELLOW}Arch${PR_NO_COLOR}";;    
    esac
}

function precmd() # Uses: setting user/root PROMPT1 variable and rehashing commands list
{
    # Last command status
    cmdstatus=$?
    sadface=`[ "$cmdstatus" != "0" ] && echo "${PR_RED}:(${PR_NO_COLOR} "`

    # Colours
    usercolour=`[ $UID != 0 ]   && echo $PR_BLUE      || echo $PR_RED`
    usercolour2=`[ $UID != 0 ]  && echo $WHITE || echo $PR_RED`
    dircolour=`[ -w "\`pwd\`" ] && echo $PR_YELLOW       || echo $PR_RED`

    # Git branch
    git="[branch: `prompt_git_dirty``prompt_current_branch`${blue}]"

export PROMPT="
%{$fg[red]%}┌─[%{$reset_color%}%{$fg[cyan]%}%n%{$reset_color%}%{$fg[yellow]%}知識%{$reset_color%}%{$fg[red]%}]─────────────────────────%{$reset_color%}%{$fg[blue]%}[%~]%{$reset_color%}%{$fg[green]%}`prompt_current_branch &>/dev/null && echo -n $git`%{$reset_color%}
%{$fg[red]%}└─(%{$reset_color%}%T%{$fg[red]%})(%{$reset_color%}%l%{$fg[red]%})─╼ %{$reset_color%}"
}
