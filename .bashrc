#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


if [[ $(lsb_release -i) == "Distributor ID:	Arch" ]]
then
    source /usr/share/doc/pkgfile/command-not-found.bash
    source /usr/share/git/completion/git-completion.bash
    source /etc/profile.d/jre.sh
    export PAGER=vimpager
    alias less=$PAGER
fi

PS1='\u@\h \W\$ '

[[ $TERM == "screen" ]] && TERM="screen-256color"

#New defaults
alias ls='ls --color=auto'
alias ydl="youtube-dl -o '%(title)s.%(ext)s' -f best"
alias yaudio="youtube-dl -o '%(title)s.%(ext)s' -x -f bestaudio"
alias iftop="iftop -B"
alias bitcoin="bitcoin-cli"
alias pacman="pacmatic"
alias mame="sdlmame -rompath \$PWD "
alias wget="wget -c"

#makes aliases sudo'able
alias sudo="sudo "

#New tools
alias alert="printf '\a'"
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias serve="python3 -m http.server"

#Homemade scripts
alias sleepmusic=~/Scripts/audio/sleepMusic.sh
alias st=~/Scripts/noteKeeping/stackTodo.py
alias md=~/Scripts/documents/markdownCSS.sh
alias dotwrap=~/Scripts/documents/dotWrapWrapper.sh
alias pushlaptop=~/Scripts/sync/push.sh
alias pulllaptop=~/Scripts/sync/pull.sh
alias wakebackup=~/Scripts/backup/wakeServer.sh
alias backup=~/Scripts/backup/runBackup.sh
alias esc=~/Scripts/config/escCapslockSwitch.sh

#ls colors
eval $(dircolors ~/.dircolors)
