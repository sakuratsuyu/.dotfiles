#!/bin/bash

case "$*" in
    "polybar")
        polybar-msg cmd toggle > /dev/null
        ;;
    "picom")
        if [[ $(ps -aux | grep picom | wc -l) -lt 4 ]]; then
            picom -b --config ~/.config/picom.conf
        else
            killall picom
        fi
        ;;
    "")
        echo picom
        echo polybar
        ;;
esac
