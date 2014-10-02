#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


if [ $(hostname) == "ARCHBOX" ]
then
    source /usr/share/doc/pkgfile/command-not-found.bash
    export PAGER=vimpager
    alias less=$PAGER
fi

PS1='\u@\h \W\$ '

#New defaults
alias ls='ls --color=auto'
alias youtube-dl="youtube-dl -o '%(title)s.%(ext)s'"
alias iftop="iftop -B"
alias bitcoin="bitcoin-cli"

#New tools
alias alert="printf '\a'"
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"

#Homemade scripts
alias sleepmusic=Scripts/audio/waitMusic.sh
alias st=Scripts/noteKeeping/stackTodo.py
alias md=Scripts/documents/markdownCSS.sh
alias dotwrap=Scripts/documents/dotWrapWrapper.sh
alias h4ck5=Scripts/rice/2spookey.lua
alias push2laptop=Scripts/Sync/pull.sh
alias pull2desktop=Scripts/Sync/push.sh
alias wakebackup=Scripts/backup/wakeServer.sh
alias backup=Scripts/backup/runBackup.sh
alias esc=Scripts/config/escCapslockSwitch.sh

#Environment variables
export TERMINAL=urxvt
export SHELL=/bin/bash
export TERMCMD=urxvt
export EDITOR=vim
