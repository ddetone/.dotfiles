# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Fix an annoying warning on macOS.
ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme.
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="simple"
#ZSH_THEME="cordial"
#ZSH_THEME="agnoster"

# git config
git config --global user.name "ddetone"
git config --global user.email "ddetone@magicleap.com"
git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto
git config --global pager.branch false # Prevents git from opening less for certain commands

# My aliases.
alias ez="vi $HOME/.zshrc"
alias sz="source $HOME/.zshrc"
alias pyserver="python3 -m http.server"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
set -o noclobber
alias duh='du -ch -d=1'
alias dus='du -hs * | sort -h'
alias tre='tree -A -C -L 2'

# Plugins.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Default virtualenv
source $HOME/code/virtualenvs/venv3/bin/activate

# Local machine specific config.
source ~/.zshrc.local

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
