
# Get Dotfiles directory (for Symlinks)
CURRENT_PATH=$(pwd) # Store current location
REL_DOTFILES_PATH=$(dirname $0) # Relative dotfiles path
ABS_DOTFILES_PATH=$(cd $REL_DOTFILES_PATH && pwd) # Absolute dotfiles path
cd $CURRENT_PATH # return to previous location


####################
# Install dotfiles #
####################

# ZSH
ln -sfn $ABS_DOTFILES_PATH/zsh/.zshrc ~/.zshrc

# Nano (https://github.com/serialhex/nano-highlight)
ln -sfn $ABS_DOTFILES_PATH/.nanorc ~/.nanorc
ln -sfn $ABS_DOTFILES_PATH/.nano ~/.nano

# Git config
ln -sfn $CURRENT_PATH/.gitconfig ~/.gitconfig

# Git hooks
ln -sfn $CURRENT_PATH/.github/pre-commit $CURRENT_PATH/.git/hooks/pre-commit 
ln -sfn $CURRENT_PATH/.github/pre-push $CURRENT_PATH/.git/hooks/pre-push 