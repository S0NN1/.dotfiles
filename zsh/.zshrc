
#
# Executes commands at the start of an interactive session.
#


# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


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
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}


# Spaceship Customizations
# SPACESHIP_CHAR_SYMBOL=🍙
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_VENV_GENERIC_NAMES=()
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_PROMPT_ORDER=(
  # https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md#order
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  node          # Node.js section
  venv          # virtualenv section
  pyenv         # Pyenv section
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)


# Config based on platform
case "$OSTYPE" in

  # ~ macOS ~
  darwin*)
    # macOS iTerm 2 intergration
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
    # Init NVM only on macOs
    init_nvm
  ;;

  # ~ WSL (Bash on Windows 10) ~
  linux-gnu)
    init_nvm
    # ~ Spaceship Customizations ~
    # SPACESHIP_CHAR_SYMBOL=🍙 // Buggy on Windows
    SPACESHIP_PACKAGE_SHOW=false
    SPACESHIP_VENV_GENERIC_NAMES=()
    SPACESHIP_DIR_TRUNC_REPO=false
    SPACESHIP_PROMPT_ORDER=(
      # https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md#order
      time          # Time stamps section
      user          # Username section
      dir           # Current directory section
      host          # Hostname section
      # git         # Git section # Commented out because slow as f*ck
      node          # Node.js section
      venv          # virtualenv section
      pyenv         # Pyenv section
      line_sep      # Line break
      jobs          # Background jobs indicator
      exit_code     # Exit code section
      char          # Prompt character
    )

  ;;
esac


# Fix WSL weird folder colors
LS_COLORS="ow=01;36;40" && export LS_COLORS


# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
fpath=($fpath "/home/simone/.zfunctions")
fpath=($fpath "/home/simone/.zfunctions")
fpath=($fpath "/home/simone/.zfunctions")
