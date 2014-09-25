#!/bin/zsh

fpath=($fpath /usr/share/doc/task/scripts/zsh)
PATH="`ruby -rubygems -e 'puts Gem.user_dir'`/bin:$PATH"

autoload -U colors && colors
autoload -U compinit && compinit

# smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# changing directories
setopt auto_cd \
  auto_pushd \
  cdable_vars \
  chase_links \
  pushd_ignore_dups \
  pushd_silent \
  pushd_to_home

# completion
setopt always_to_end \
  auto_menu \
  auto_name_dirs \
  auto_param_keys \
  auto_param_slash \
  auto_remove_slash \
  complete_aliases \
  complete_in_word \
  list_ambiguous \
  list_packed
unsetopt menu_complete

# expansion and globbing
setopt brace_ccl \
  extended_glob \
  long_list_jobs \
  multios \
  prompt_subst

# input/output
setopt correct \
  interactive_comments \
  rc_quotes \
  short_loops
unsetopt clobber \
  flowcontrol

# job control
setopt bg_nice

# zle
unsetopt beep

autoload -U select-word-style
select-word-style bash

bindkey '^[[Z' reverse-menu-complete

[[ $TASK == show ]] && task long

for snippets ($HOME/.zsh/*.zsh(N))
  source $snippets
