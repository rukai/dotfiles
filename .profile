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

#Custom modifications

#capslock magic
./Scripts/config/escCapslockSwitch.sh

#Set ranger terminal information
export TERMINAL=urxvtc
export SHELL=/usr/bin/fish
export TERMCMD=urxvtc
export PAGER=less

#gitdoge

alias such=git
alias much=git
alias many=git
alias very=git
alias so=git
alias wow='git status'
