##!/bin/bash

rm -rf $HOME/.i3
rm -rf $HOME/.config/i3
rm -rf $HOME/.config/polybar
rm -rf $HOME/.config/config
rm -rf $HOME/.config/rofi
rm -rf $HOME/.config/alacritty
#rm -rf $HOME/.config/termite
ln -s $(pwd)/i3 $HOME/.config/i3
ln -s $(pwd)/polybar $HOME/.config/polybar
ln -s $(pwd)/rofi $HOME/.config/rofi
#ln -s $(pwd)/termite $HOME/.config/termite
ln -s $(pwd)/picom $HOME/.config/picom
ln -s $(pwd)/alacritty $HOME/.config/alacritty

echo "source $HOME/dotfiles/.profile-extra" >> $HOME/.profile
echo "source $HOME/dotfiles/zshrc.sh" >> $HOME/.zshrc
