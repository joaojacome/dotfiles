#!/bin/bash

killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

if type "xrandr"; then
  MONITORS=$(xrandr --listmonitors | grep -vi 'Monitors:' | cut -d" " -f3 | sed "s/+//")
  for m in $MONITORS; do
    MONITOR=$m polybar --reload main &
  done
else
  polybar --reload example &
fi