#! /bin/bash

set -ex
cd $HOME

ln -sf .dotfiles/.zshrc .
ln -sf .dotfiles/.tmux.conf .
ln -sf .dotfiles/.vimrc .
ln -sf .dotfiles/.vim .
ln -sf .dotfiles/ddetone.zsh-theme .oh-my-zsh/custom/themes/
