#!/bin/bash

case "$*" in
    Layout_*.sh)
        ~/Scripts/Screenlayout/$*
        ~/.config/polybar/launch.sh > /dev/null
        ;;
    *)
        ls ~/Scripts/Screenlayout
        ;;
esac
