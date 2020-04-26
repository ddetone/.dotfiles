#! /bin/bash

set -ex
cd $HOME

ln -sf .dotfiles/.zshrc .
ln -sf .dotfiles/.tmux.conf .
ln -sf .dotfiles/.tmux.conf.local .
ln -sf .dotfiles/.vimrc .
ln -sf .dotfiles/.vim .
# my powershell10k config file
ln -sf .dotfiles/.p10k.zsh .
#ln -sf .dotfiles/ddetone.zsh-theme .oh-my-zsh/custom/themes/
