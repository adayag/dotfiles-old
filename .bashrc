# ~/.bashrc
# vim:set ft=sh sw=2 sts=2:

source "$HOME/.sharedrc"

# Store 10,000 history entries
export HISTSIZE=10000
# Don't store duplicates
export HISTCONTROL=erasedups
# Append to history file
shopt -s histappend

VISUAL=vim
EDITOR="$VISUAL"
LESS="FRX"
RI="--format ansi -T"
PSQL_EDITOR='vim -c"setf sql"'
CLICOLOR=1
LSCOLORS=gxgxcxdxbxegedabagacad

export VISUAL EDITOR LESS RI PSQL_EDITOR CLICOLOR LSCOLORS

if [ -t 1 ]; then
bind 'set bind-tty-special-chars off'
bind '"\ep": history-search-backward'
bind '"\en": history-search-forward'
bind '"\C-w": backward-kill-word'
bind '"\C-q": "%-\n"'
fi

export HISTIGNORE="%*"

[ -z "$PS1" ] || stty -ixon

[ -z "$PS1" ] || export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$(git_prompt_info '(%s)')$ "

if [ -f '/usr/local/etc/bash_completion.d/git-completion.bash' ]; then
  source '/usr/local/etc/bash_completion.d/git-completion.bash'
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[ ! -f "$HOME/.bashrc.local" ] || . "$HOME/.bashrc.local"

# docker-osx-dev
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/allendayag/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# added by travis gem
[ -f /Users/allendayag/.travis/travis.sh ] && source /Users/allendayag/.travis/travis.sh
