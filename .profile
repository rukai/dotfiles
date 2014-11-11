# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/Bin" ] ; then
    PATH="$HOME/Bin:$PATH"
fi

PATH="$(ruby -rubygems -e "puts Gem.user_dir")/bin:$PATH"
export PYTHONPATH=/usr/lib/python2.7/site-packages

#arch only
if [[ $(lsb_release -i) == "Distributor ID:	Arch" ]]
then
    [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
fi

#New defaults
alias ls='ls --color=auto'
alias youtube-dl="youtube-dl -o '%(title)s.%(ext)s'"
alias iftop="iftop -B"
alias bitcoin="bitcoin-cli"

#New tools
alias alert="printf '\a'"
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"

#Homemade scripts
alias sleepmusic=~/Scripts/audio/sleepMusic.sh
alias st=~/Scripts/noteKeeping/stackTodo.py
alias md=~/Scripts/documents/markdownCSS.sh
alias dotwrap=~/Scripts/documents/dotWrapWrapper.sh
alias h4ck5=~/Scripts/rice/2spookey.lua
alias push2laptop=~/Scripts/Sync/pull.sh
alias pull2desktop=~/Scripts/Sync/push.sh
alias wakebackup=~/Scripts/backup/wakeServer.sh
alias backup=~/Scripts/backup/runBackup.sh
alias esc=~/Scripts/config/escCapslockSwitch.sh

#Environment variables
export TERMINAL=urxvt
export TERMCMD=urxvt
export SHELL=/bin/bash
export TERMCMD=urxvt
export EDITOR=vim
