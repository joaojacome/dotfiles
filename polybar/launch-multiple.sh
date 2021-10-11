#!/bin/bash

killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

if type "xrandr"; then
  MONITORS=$(xrandr --listmonitors | grep -vi 'Monitors:' | cut -d" " -f3 | sed "s/+\*//")
  #for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
  for m in $MONITORS; do
    polybar --reload $m &
  done
  # polybar --reload tray &
fi