# Path to your oh-my-zsh installation.
ZSH=~/.oh-my-zsh

# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

#wd
plugins=(git wd)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
export GOPATH=~/go
export PATH="$PATH:$GOPATH/bin"
export TERM=rxvt-unicode-256color

#thefuck
eval $(thefuck --alias)

source $HOME/.aliases

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

wd() {
  . /home/jobe/bin/wd/wd.sh
}

transfer() {
    /home/jobe/bin/transfer.sh $@
}

jn() {
    jupyter notebook $@
}

rb() {
    sudo reboot
}

pm() {
    sudo pacman $@
}

y() {
    yaourt $@ --noconfirm
}

nw(){
    $@ 2>/dev/null &
}

cwd(){
    pwd | xclip -selection clipboard
}

nemid(){
    python /home/jobe/bin/nemid.py $@
}
export ALTERNATE_EDITOR=""
export EDITOR=emacsclient

alias emax="emacsclient -c"                      # used to be "emacs -nw"
alias semac="sudo emacsclient -t"                # used to be "sudo emacs -nw"
alias emacsc="emacsclient -c -a emacs"           # new - opens the GUI with alternate non-daemon


#ssh-agent multiple shells https://github.com/wwalker/ssh-find-agent
. /home/jobe/bin/ssh-find-agent.sh

ssh-find-agent -a || eval $(ssh-agent) > /dev/null
if [ -z "$SSH_AUTH_SOCK" ]
then
    eval $(ssh-agent) > /dev/null
    ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
fi

#lockscreen

lock (){
    xscreensaver-command --lock
}

export PATH="/home/jobe/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
