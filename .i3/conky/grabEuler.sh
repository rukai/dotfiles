#!/bin/sh
#which user to find
USER=rubic

cd ~/.i3/conky

#get new file if available
if [ "`ping projecteuler.net -w 1 | grep '0% packet loss'`" ] ; then
    rm ${USER}.png 
    wget -q http://projecteuler.net/profile/${USER}.png
    convert ${USER}.png -crop 100x8+45+44 result.pnm
fi
#extract number to text
gocr result.pnm
