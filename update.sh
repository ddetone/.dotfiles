#! /bin/bash

set -ex
cd $HOME
#if [ -d .dotfiles/ ]; then
#  rm -rf .dotfiles.old
#  mv .dotfiles .dotfiles.old
#fi

ln -sf .dotfiles/.bash_profile .
ln -sf .dotfiles/.bashrc .
ln -sf .dotfiles/.tmux.conf .
ln -sf .dotfiles/.vimrc .
ln -sf .dotfiles/.vim .
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
