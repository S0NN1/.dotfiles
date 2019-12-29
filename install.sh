
# SymLink config files
# ln -sfn should update symlinks if an existing duplicate file is found

# Dotfiles directory (for Symlinks)
DOTFILES_PATH=$(dirname $0)

# ZSH and Prezto
ln -sfn $DOTFILES_PATH/zsh/.zlogin ~/.zlogin
ln -sfn $DOTFILES_PATH/zsh/.zlogout ~/.zlogout
ln -sfn $DOTFILES_PATH/zsh/.zpreztorc ~/.zpreztorc
ln -sfn $DOTFILES_PATH/zsh/.zprofile ~/.zprofile
ln -sfn $DOTFILES_PATH/zsh/.zshenv ~/.zshenv
ln -sfn $DOTFILES_PATH/zsh/.zshrc ~/.zshrc

# Git
if [ -f $DOTFILES_PATH/private/.gitconfig ]; then
    ln -sfn $DOTFILES_PATH/private/.gitconfig ~/.gitconfig
fi