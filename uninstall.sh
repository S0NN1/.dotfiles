
# Get Dotfiles directory (for Symlinks)
CURRENT_PATH=$(pwd) # Store current location
REL_DOTFILES_PATH=$(dirname $0) # Relative dotfiles path
ABS_DOTFILES_PATH=$(cd $REL_DOTFILES_PATH && pwd) # Absolute dotfiles path
cd $CURRENT_PATH # return to previous location


######################
# Uninstall dotfiles #
######################

# ZSH and Prezto
unlink ~/.zlogin
unlink ~/.zlogout
unlink ~/.zpreztorc
unlink ~/.zprofile
unlink ~/.zshenv
unlink ~/.zshrc


##############################
# Uninstall Private dotfiles #
##############################

# Check if private folder exists and is not empty
if [ -d "$ABS_DOTFILES_PATH/private" ] && [ -n "$(ls -A $ABS_DOTFILES_PATH/private)" ]; then
    $ABS_DOTFILES_PATH/private/uninstall.sh
fi