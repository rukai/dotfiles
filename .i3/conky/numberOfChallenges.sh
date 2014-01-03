#!/bin/sh
#finds the number of challenges in project euler based on how many weeks have passed
echo "436 + ( ( `date +%s` - `date -d 'Sep 16 00:00:00' +%s` ) / 604800 )" | bc
