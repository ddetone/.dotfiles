# .bashrc file

# 0) Mac vs ubuntu config
if [ "$(uname)" == "Darwin" ]; then
  alias ll='ls -FGlAhp'
  alias ls='ls -FGhp'
  alias f='open -a Finder ./'
  export TERM=xterm-256color
  #export LSCOLORS="exfxcxdxcxegedabagacad"
  alias envtf='source ~/code/tf/bin/activate'
  export PYTHONPATH=~/code/caffe/python
  export PYTHONPATH=$PYTHONPATH:~/code/colla
  #export PYTHONPATH=$PYTHONPATH:~/code/dhslam
  #export PYTHONPATH=$PYTHONPATH:~/code/ProjectiveBA
  export PYTHONPATH=$PYTHONPATH:/usr/local/python
  #export PYTHONPATH=$PYTHONPATH:~/code/SuperPointRelease
  #export PYTHONPATH=$PYTHONPATH:~/code/SuperPointRelease/pretrained
  #if [ -f `brew --prefix`/etc/bash_completion ]; then
  #  . `brew --prefix`/etc/bash_completion
  #fi
  source ~/.dotfiles/git-completion.bash
  export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/Users/ddetone/code/g2o/lib
  #alias python='python3'
  #alias pip='pip3'

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  export TERM=screen-256color
  #export LS_COLORS="di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.deb=90"
  alias ll="ls -alrtF --color"
  alias ls="ls --color"
  if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
  fi
  export LD_LIBRARY_PATH=/usr/local/cuda/lib64/
  export CUDA_HOME=/usr/local/cuda
  export PATH="$PATH:$HOME/code/bazel/output"
  export CAFFE_HOME=~/code/caffe
  export PYTHONPATH=${CAFFE_HOME}/python
fi

# 1) Safety
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
set -o noclobber

export ML="10.15.50.139"

# 2) Listing, directories, and motion
alias la="ls -A"
alias l="ls"
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias md='mkdir'
alias cl='clear'
alias duh='du -ch --max-depth=1'
alias dus='du -hs * | sort -h'
alias tre='tree -A -C -L 2'
alias ack='ack-grep'
alias gitls='git log --oneline -10'
alias pyf='python -m SimpleHTTPServer 9999'
alias d0='DISPLAY=:0'
alias d1='DISPLAY=:1'
alias d2='DISPLAY=:2'
alias d3='DISPLAY=:3'
alias tb='python ../../../tf/tensorflow/tensorboard/tensorboard.py --logdir=${PWD} --port 6006'
alias sve='source venv/bin/activate'
#alias ml='ssh -L 9191:localhost:9191 10.30.145.192'
alias ml='ssh -L 9191:localhost:9191 -L 9192:localhost:9192 10.15.50.139'
#alias ml='ssh -L 9191:localhost:9191 10.15.50.139'
alias pa3='ssh pa-compute-003'
alias bh0='ssh -p 2291 c1-n047-05'
alias bh1='ssh -p 2299 c1-n048-17'
alias bh2='ssh -p 2255 c1-n049-13'
#alias pys='python -m SimpleHTTPServer'
alias pys='python -m http.server'
#alias sp='ssh -p 2252 c1-n048-05'
alias sg='ssh -p 2281 c1-n048-21'
alias sp='ssh -p 2239 c1-s049-37'
#alias cvpr0='ssh -p 2227 c1-n049-01'
#alias cvpr1='ssh -p 2299 c1-n048-05'
#alias cvpr2='ssh -p 2248 c1-n049-21'
#alias cvpr3='ssh -p 2239 c1-n048-05'
#alias cvpr4='ssh -p 2297 c1-n048-25'
#alias cvpr5='ssh -p 2285 c1-n049-05'
#alias cvpr6='ssh -p 2240 c1-n049-29'
#alias cvpr7='ssh -p 2291 c1-n047-01'
#alias cvpr8='ssh -p 2225 c1-n049-05'
#alias cvpr9='ssh -p 2236 c1-n048-01'
#alias cvpr10='ssh -p 2290 c1-n048-17'
#alias cvpr11='ssh -p 2293 c1-n048-17'
#alias cvpr12='ssh -p 2253 c1-n048-21'
#alias cvpr8='ssh -p 2240 c1-n049-29'
#alias rsshl='ssh -t eventhorizon01 \"run-ssh-job-nfs -l\"'

# 3) Text and editor commands
export EDITOR='vim'
export VISUAL='vim'

# 4) grep options
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;31' # green for matches

# 5) sort options
# Ensures cross-platform sorting behavior of GNU sort.
# http://www.gnu.org/software/coreutils/faq/coreutils-faq.html#Sort-does-not-sort-in-normal-order_0021
unset LANG
export LC_ALL=POSIX

# 6) git config
git config --global user.name "ddetone"
git config --global user.email "ddetone@magicleap.com"
git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto

# 7) color options
if [ -f ~/.dotfiles/.git-prompt.sh ]; then
   source ~/.dotfiles/.git-prompt.sh
fi
if [ -f ~/.dotfiles/.bash_colordefs ]; then
   source ~/.dotfiles/.bash_colordefs
fi
export PS1='[\u@\h$(\
if [ $(__git_ps1)x != "x" ]; then \
  echo "$(echo `git status` | egrep "nothing( added)* to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$Green'"$(__git_ps1 " (%s)"); \
  else \
    # @5 - Changes to working tree
    echo "'$IRed'"$(__git_ps1 " {%s}"); \
  fi) '$BYellow$PathShort$Color_Off']\$ "; \
else \
  # @2 - Prompt when not in GIT repo
  echo " '$Yellow$PathShort$Color_Off']\$ "; \
fi)'

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad


#sudo mount c1-n051-00.magicleap.ds:/stc/thirdeye-nfs /thirdeye-nfs
function checkMounted() {
    OUTPUT="$(mount | grep "on $1" > /dev/null && echo is mounted. || echo $1 is not mounted.)"
    echo $OUTPUT
}
function checkConnected() {
    OUTPUT="$(ping -c 1 $1 &> /dev/null && echo is connected. || echo $1 is not connected.)"
    echo $OUTPUT
}
function magicleap() {
        # Connect to Magic Leap network tools
        TECONNECTED="$(checkConnected c1-n051-00.magicleap.ds)"
        TEMOUNTED="$(checkMounted /thirdeye-nfs)"
        if [[ ${TECONNECTED} == "is connected." ]]; then
            if [[ ${TEMOUNTED} != "is mounted." ]]; then
                sudo echo "Mounting thirdeye-nfs"
                sudo mount -w -v -t nfs c1-n051-00.magicleap.ds:/stc/thirdeye-nfs /thirdeye-nfs
            fi
        else
            echo -e "thirdeye-nfs ${TECONNECTED}"
        fi
    }
