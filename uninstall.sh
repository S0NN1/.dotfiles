
# Get Dotfiles directory (for Symlinks)
CURRENT_PATH=$(pwd) # Store current location
REL_DOTFILES_PATH=$(dirname $0) # Relative dotfiles path
ABS_DOTFILES_PATH=$(cd $REL_DOTFILES_PATH && pwd) # Absolute dotfiles path
cd $CURRENT_PATH # return to previous location


######################
# Uninstall dotfiles #
######################

# ZSH & Starship prompt
unlink ~/.zshrc