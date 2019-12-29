
# SymLink config files
# ln -sfn should update symlinks if an existing duplicate file is found


# Get Dotfiles directory (for Symlinks)
CURRENT_PATH=$(pwd) # Store current location
REL_DOTFILES_PATH=$(dirname $0) # Relative dotfiles path
ABS_DOTFILES_PATH=$(cd $REL_DOTFILES_PATH && pwd) # Absolute dotfiles path
cd $CURRENT_PATH # return to previous location


# ZSH and Prezto
ln -sfn $ABS_DOTFILES_PATH/zsh/.zlogin ~/.zlogin
ln -sfn $ABS_DOTFILES_PATH/zsh/.zlogout ~/.zlogout
ln -sfn $ABS_DOTFILES_PATH/zsh/.zpreztorc ~/.zpreztorc
ln -sfn $ABS_DOTFILES_PATH/zsh/.zprofile ~/.zprofile
ln -sfn $ABS_DOTFILES_PATH/zsh/.zshenv ~/.zshenv
ln -sfn $ABS_DOTFILES_PATH/zsh/.zshrc ~/.zshrc


# Git
if [ -f $ABS_DOTFILES_PATH/private/.gitconfig ]; then
    ln -sfn $ABS_DOTFILES_PATH/private/.gitconfig ~/.gitconfig
fi