#! /bin/bash

# Download oh-my-zsh.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# Download oh-my-tmux.
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
#cp .tmux/.tmux.conf.local .


# Download PlugVim (after downloaded, run :PlugInstall from vim)
curl -fLo ~/.dotfiles/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


