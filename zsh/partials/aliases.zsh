#!/bin/zsh

# Utility
alias .u="update-dotfiles"

# LS aliases
alias l='ls -1ah'
alias la='ls -lah'
alias ls='ls -G'

# Git
alias gl="git pull"
alias glog='git log --topo-order --pretty=format:"${_git_log_medium_format}"'
alias gitgud="git add . ; git commit -m'(ノಠ益ಠ)ノ彡┻━┻' ; git push"


# Aliases based on OS Type
case "$OSTYPE" in

  # ~ macOS ~
  darwin*)
   
  ;;
  

  # ~ WSL (Linux on Windows 10) ~
  linux-gnu)
    # LS aliases
    alias l='ls -1ah --color=auto'
    alias la='ls -lah --color=auto'
    alias ls='ls -G --color=auto'
  ;;
  
  
  # ~ FreeBSD (TrueNAS) ~
  freebsd*)
    unalias .u
    alias .u="update-dotfiles && update-jails"
  ;;


  # ~ Alpine Linux (iSH iOS) ~
  linux-musl*)
    # LS aliases
    alias l='ls -1ah'
    alias la='ls -lah'
    unalias ls
  ;;


  # ~ Alpine Linux? (Termux Android) ~
  linux-android*)
   
  ;;
esac
