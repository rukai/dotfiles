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

set -o emacs
PS1='\u@\h \W\$ '

alias ls='ls --color=auto'
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias youtube-dl="youtube-dl -o '%(title)s.%(ext)s'"
alias iftop="iftop -B"
alias bitcoin="bitcoin-cli"
alias alert="printf '\a'"

export TERMINAL=urxvt
export SHELL=/bin/bash
export TERMCMD=urxvt
export EDITOR=vim
