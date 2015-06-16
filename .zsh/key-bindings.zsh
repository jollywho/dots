# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets

bindkey -v                                          # Use vi key bindings
bindkey '^r' history-incremental-search-backward    # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.

# emacs style
bindkey '^s' beginning-of-line
bindkey '^f' end-of-line
bindkey '^e' forward-word
bindkey '^b' vi-backward-word
bindkey '^n' down-history
bindkey '^p' up-history
bindkey '^u' kill-whole-line
bindkey '^w' vi-backward-kill-word
bindkey '^[[Z' reverse-menu-complete
