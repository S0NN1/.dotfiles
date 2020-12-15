
# Load zprof and zmv (modules included with zsh)
zmodload zsh/zprof
autoload zmv
autoload -Uz compinit && compinit

# Case insensitive autocompletion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'


# History settings
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt EXTENDED_HISTORY
setopt inc_append_history
setopt share_history
setopt HIST_FIND_NO_DUPS


# Preferred cli editors
export EDITOR='nano'
export VISUAL='nano'


# Load personal functions/aliases
source "${ZDOTDIR:-$HOME}/.dotfiles/zsh/functions.sh"
source "${ZDOTDIR:-$HOME}/.dotfiles/zsh/aliases.sh"
# Load private aliases
if [[ -s ${ZDOTDIR:-$HOME}/.dotfiles/private/zsh/aliases.sh ]]; then
  source "${ZDOTDIR:-$HOME}/.dotfiles/private/zsh/aliases.sh"
fi


# Node Version Manager (https://github.com/nvm-sh/nvm#usage)
init_nvm () {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
}


# Arrows for history-substring-search
HSS_UP_ARROW="^[[A"
HSS_DOWN_ARROW="^[[B"


# Config based on platform
case "$OSTYPE" in

  # ~ macOS ~
  darwin*)
    # macOS iTerm 2 intergration
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
    # Init NVM on macOs
    init_nvm
    export PATH="$PATH:/Users/simone/Documents/flutter/bin"
  ;;

  # ~ WSL (Linux on Windows 10) ~
  linux-gnu)
    # Init NVM on WSL
    # init_nvm
    # Arrows for history-substring-search (for WSL)
    HSS_UP_ARROW="$terminfo[kcuu1]"
    HSS_DOWN_ARROW="$terminfo[kcud1]"
  ;;
esac


# Fix WSL weird folder colors
LS_COLORS="ow=01;36;40" && export LS_COLORS


# Init history-substring-search
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey $HSS_UP_ARROW history-substring-search-up
bindkey $HSS_DOWN_ARROW history-substring-search-down


# Init Starship prompt
export STARSHIP_CONFIG=~/.starship.toml
eval "$(starship init zsh)"
