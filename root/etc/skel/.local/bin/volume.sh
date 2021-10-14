#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function get_volume {
    amixer get Master -D pulse | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
    amixer get Master -D pulse | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

function send_notification {
    volume=`get_volume`
    if [ $volume -gt 75 ]; then
        icon="audio-volume-high"
    elif  [ $volume -gt 30 ]; then
        icon="audio-volume-medium"
    elif  [ $volume -gt 0 ]; then
        icon="audio-volume-low"
    else
        icon="audio-volume-muted"
    fi
    dunstify -i $icon -r 2593 -u normal -h int:value:$volume "Volume"
}

case $1 in
    up)
	# Set the volume on (if it was muted)
	amixer -D pulse set Master on > /dev/null
	# Up the volume (+ 5%)
	amixer -D pulse sset Master 5%+ > /dev/null
	send_notification
	;;
    down)
	amixer -D pulse set Master on > /dev/null
	amixer -D pulse sset Master 5%- > /dev/null
	send_notification
	;;
    mute)
    	# Toggle mute
	amixer -D pulse set Master 1+ toggle > /dev/null
	if is_mute ; then
	    dunstify -i audio-volume-muted-blocking -r 2593 -u normal "Mute"
	else
	    send_notification
	fi
	;;
esac