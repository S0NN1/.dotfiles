#!/bin/zsh

# Utility
alias .u="update-dotfiles"
alias la="ls -lah"
alias l="ls -1ah"
alias ls="ls -G"

# Platform specific aliases
case "$OSTYPE" in

  # ~ macOS ~
  darwin*)
    
  ;;

  # ~ WSL (Bash on Windows 10) ~
  linux-gnu)
    alias la="ls -lah --color=auto"
    alias l="ls -1ah --color=auto"
    alias ls="ls -G --color=auto"
  ;;
  
esac

# Git
alias gl="git pull"
alias glog='git log --topo-order --pretty=format:"${_git_log_medium_format}"'
alias gitgud="git add . ; git commit -m'(ノಠ益ಠ)ノ彡┻━┻' ; git push"
