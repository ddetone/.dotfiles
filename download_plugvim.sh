#! /bin/bash
curl -fLo ~/.dotfiles/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# After downloaded, run :PlugInstall from vim
