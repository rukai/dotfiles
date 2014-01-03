#!/bin/sh

#does leave 2 second window underwhich lock is missing

#get access to tudu
lockfile=~/.tudu.xml_lock
locked=false
cd ~/.i3/conky
if [ -f $lockfile ] ; then
    locked=true
    rm $lockfile
fi

#output percentage
name=getTudu
output=tuduOutput.txt
tmux new-session -d -s $name "tudu"
sleep 1s #give tudu time to set itself up
tmux capture-pane
tmux save-buffer "${PWD}/${output}"
cat $output | grep -o '( .*?\?\%)' | tr -cd [:digit:]
echo
tmux send-keys "Q" "y"
sleep 1s #give tudu time to kill itself
#tidy up
if $locked ; then
    touch $lockfile
fi
