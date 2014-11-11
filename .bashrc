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
