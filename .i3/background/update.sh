#!/bin/sh
cd /home/rubic/.i3/background
#grab hue to change to based on hours into the day
hue=$(echo "scale=5 ; `date +%H` * 8.3222" | bc | cut -d"." -f1)
echo $hue
#modify background
convert baseAbstract.png -modulate 100,100,${hue} abstract.png
#repaint background
feh --bg-scale /home/rubic/.i3/background/abstract.png
