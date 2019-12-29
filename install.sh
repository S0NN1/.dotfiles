
# Get Dotfiles directory (for Symlinks)
CURRENT_PATH=$(pwd) # Store current location
REL_DOTFILES_PATH=$(dirname $0) # Relative dotfiles path
ABS_DOTFILES_PATH=$(cd $REL_DOTFILES_PATH && pwd) # Absolute dotfiles path
cd $CURRENT_PATH # return to previous location


####################
# Install dotfiles #
####################

# ZSH and Prezto
ln -sfn $ABS_DOTFILES_PATH/zsh/.zlogin ~/.zlogin
ln -sfn $ABS_DOTFILES_PATH/zsh/.zlogout ~/.zlogout
ln -sfn $ABS_DOTFILES_PATH/zsh/.zpreztorc ~/.zpreztorc
ln -sfn $ABS_DOTFILES_PATH/zsh/.zprofile ~/.zprofile
ln -sfn $ABS_DOTFILES_PATH/zsh/.zshenv ~/.zshenv
ln -sfn $ABS_DOTFILES_PATH/zsh/.zshrc ~/.zshrc

# Nano (https://github.com/serialhex/nano-highlight)
ln -sfn $ABS_DOTFILES_PATH/.nanorc ~/.nanorc
ln -sfn $ABS_DOTFILES_PATH/.nano ~/.nano


############################
# Install Private dotfiles #
############################

# Check if private folder exists and is not empty
if [ -d "$ABS_DOTFILES_PATH/private" ] && [ -n "$(ls -A $ABS_DOTFILES_PATH/private)" ]; then
    $ABS_DOTFILES_PATH/private/install.sh
fi