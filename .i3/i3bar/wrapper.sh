i3status --config ~/.i3status.conf | while :
do
        read line
        playing=$(ncmpcpp --now-playing)
        echo "$playing | $line" || exit 1
done
