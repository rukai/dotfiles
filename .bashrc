#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s autocd

source /usr/share/doc/pkgfile/command-not-found.bash
PS1='\u@\h \W\$ '
alias ls='ls --color=auto'
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias youtube-dl="youtube-dl -o '%(title)s.%(ext)s'"
