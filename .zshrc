
# Fix an annoying warning on macOS.
ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
export ZSH="/Users/ddetone/.oh-my-zsh"

#source ~/.dotfiles/zsh-git-prompt/zshrc.sh
# an example prompt
#PROMPT='%B%m%~%b$(git_super_status) %# '

# Theme.
ZSH_THEME="risto2"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="example"
#ZSH_THEME="jpro-minimal"
#ZSH_THEME="risto2"
#ZSH_THEME="candy"
#ZSH_THEME="agnoster"

# 6) git config
git config --global user.name "ddetone"
git config --global user.email "ddetone@magicleap.com"
git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto
git config --global pager.branch false # Prevents git from opening less for certain commands

alias c="clear"
alias ez="vi $HOME/.zshrc"
alias sz="source $HOME/.zshrc"
alias pyserver="python -m SimpleHTTPServer"




# Plugins.
plugins=(git git-prompt)

source $ZSH/oh-my-zsh.sh

# Default virtualenv
source $HOME/code/virtualenvs/venv3/bin/activate
