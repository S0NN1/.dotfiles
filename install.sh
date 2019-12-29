
# SymLink config files
# ln -sfn should update symlinks if an existing duplicate file is found

# Current directory (for Symlinks)
DOTFILES="$(pwd)"

# ZSH and Prezto
ln -sfn $DOTFILES/zsh/.zlogin ~/.zlogin
ln -sfn $DOTFILES/zsh/.zlogout ~/.zlogout
ln -sfn $DOTFILES/zsh/.zpreztorc ~/.zpreztorc
ln -sfn $DOTFILES/zsh/.zprofile ~/.zprofile
ln -sfn $DOTFILES/zsh/.zshenv ~/.zshenv
ln -sfn $DOTFILES/zsh/.zshrc ~/.zshrc

# Other
ln -sfn $DOTFILES/private/.gitconfig ~/.gitconfig