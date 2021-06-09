#!/bin/sh

if [ -d ~/.config/autostart ]; then
  mv ~/.config/autostart ~/.config/.autostart-bkp
  ln -s /dev/null ~/.config/autostart
fi