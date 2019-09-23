#!/bin/bash

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

(cat ~/.cache/wal/sequences &)
eval "$(thefuck --alias)"

export TERM=xterm
