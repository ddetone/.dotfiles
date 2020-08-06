# /bin/bash

# After running this script, there is a manual step:
# 1.) Open iTerm2 and update profile.
# 2.) Add One Dark and One Light color presents (use cmd-shift-dot to unhide dotfile directories)
# 3.) Select MesloLGS NF Regular 13 (for mac)

# Download oh-my-zsh.
echo "==> Installing oh-my-zsh"
OMZ=$HOME/.oh-my-zsh
if [ -d $OMZ ]
then
    echo "Directory $OMZ exists, skipping"
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Download powerlevel10k
echo "\n==> Installing powerlevel10k custom theme for oh-my-zsh"
P10=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
if [ -d $P10 ]
then
    echo "Directory $P10 exists, skipping"
else
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $P10
fi

## Download powerline fonts and install them.
#echo "\n==> Installing powerline fonts"
#FONTS="$PWD/fonts/"
#if [ -d $FONTS ]
#then
#    echo "Directory $FONTS exists, skipping"
#else
#    git clone https://github.com/powerline/fonts.git --depth=1
#    ./fonts/install.sh
#fi

# Download oh-my-tmux.
echo "\n==> Installing oh-my-tmux"
TMUX="$PWD/.tmux"
if [ -d $TMUX ]
then
    echo "Directory $TMUX exists, skipping"
else
    git clone https://github.com/gpakosz/.tmux.git
    ln -s -f .tmux/.tmux.conf
    #cp .tmux/.tmux.conf.local .
fi

# Download PlugVim (after downloaded, run :PlugInstall from vim)
echo "\n==> Installing PlugVim package manager for vim"
PVIM="$PWD/.vim/autoload"
if [ -d $PVIM ]
then
    echo "Directory $PVIM exists, skipping"
else
    curl -fLo ~/.dotfiles/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Add symlinks to home directory.
echo "\n==> Adding symlinks to my home directory"
set -ex
cd $HOME
ln -sf .dotfiles/.zshrc .
ln -sf .dotfiles/.zshrc.local .
ln -sf .dotfiles/.tmux.conf .
ln -sf .dotfiles/.tmux.conf.local .
ln -sf .dotfiles/.vimrc .
ln -sf .dotfiles/.vim .
ln -sf .dotfiles/.p10k.zsh .
ln -sf .dotfiles/.fonts .
#ln -sf .dotfiles/ddetone.zsh-theme .oh-my-zsh/custom/themes/
