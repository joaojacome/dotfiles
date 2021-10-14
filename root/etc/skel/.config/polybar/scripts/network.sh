#!/bin/sh
ETHERNET=$(nmcli -t -f name,type connection show --active | grep eth | head -1 | cut -d ':' -f 1)
WIRELESS=$(nmcli -t -f name,type connection show --active | grep wirel | head -1 | cut -d ':' -f 1)
if [ -n "$ETHERNET" ]; then
	echo " Wired connection"
else
	if [ -n "$WIRELESS" ]; then
		echo " $WIRELESS"
	else
		echo " NO network connection"
	fi
fi
