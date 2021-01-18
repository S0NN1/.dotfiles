
# Load zprof and zmv (modules included with zsh)
zmodload zsh/zprof
autoload zmv
autoload -Uz compinit && compinit


# Case insensitive autocompletion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'


# Preferred cli editors
export EDITOR='nano'
export VISUAL='nano'


# Colors (https://geoff.greer.fm/lscolors/)
# macOS / FreeBSD 
export LSCOLORS="ExFxcxdxbxegedabagacad" 
# WSL / GNU Linux
export LS_COLORS="di=1;34:ln=1;35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"


# Folder containing chunks of configs
PARTIALS_PATH="${ZDOTDIR:-$HOME}/.dotfiles/zsh/partials"
PRIVATE_PARTIALS_PATH="${ZDOTDIR:-$HOME}/.dotfiles/private/zsh/partials"

# Variables & OS Customs
source "$PARTIALS_PATH/variables.zsh"
# Aliases
source "$PARTIALS_PATH/aliases.zsh"
# Load private aliases
if [[ -s ${PRIVATE_PARTIALS_PATH}/aliases.sh ]]; then
  source "${PRIVATE_PARTIALS_PATH}/aliases.sh"
fi
# Functions
source "$PARTIALS_PATH/functions.zsh"
# TrueNAS utils
source "$PARTIALS_PATH/truenas.zsh"
# History and Substring search
source "$PARTIALS_PATH/history.zsh"
# Git (https://laptrinhx.com/a-fast-customizable-pure-shell-asynchronous-git-prompt-for-zsh-3656470288/)
source "$PARTIALS_PATH/git-prompt.zsh/git-prompt.zsh"
source "$PARTIALS_PATH/git-prompt-theme.zsh"
# Node.js
source "$PARTIALS_PATH/node.zsh"
# Python
source "$PARTIALS_PATH/python.zsh"
# Time
source "$PARTIALS_PATH/time.zsh"
# Prompt definition
source "$PARTIALS_PATH/prompt.zsh"