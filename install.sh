#!/bin/bash
rm -rf $HOME/.i3
rm -rf $HOME/.config/polybar
rm -rf $HOME/.config/rofi
rm -rf $HOME/.config/wal
rm -rf $HOME/.config/termite
rm -rf $HOME/.config/compton.conf
ln -s $(pwd)/i3 $HOME/.config/i3
ln -s $(pwd)/polybar $HOME/.config/polybar
ln -s $(pwd)/rofi $HOME/.config/rofi
ln -s $(pwd)/termite $HOME/.config/termite
ln -s $(pwd)/wal $HOME/.config/wal
ln -s $(pwd)/compton.conf $HOME/.config/compton.conf
