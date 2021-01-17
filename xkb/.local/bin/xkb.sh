#!/bin/sh
xkbcomp $HOME/.Xkeymap $DISPLAY
xcape -e "Hyper_L=space"
