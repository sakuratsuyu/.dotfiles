#!/bin/bash

case "$*" in
    "polybar")
        polybar-msg cmd toggle > /dev/null
        ;;
    "xflux")
        if [[ $(ps -aux | grep xflux | wc -l) -lt 4 ]]; then
		    xflux -g 120 -l 30 -k 4000 > /dev/null
        else
            killall xflux
        fi
        ;;
    "picom")
        if [[ $(ps -aux | grep picom | wc -l) -lt 4 ]]; then
            picom -b --config ~/.config/picom.conf
        else
            killall picom
        fi
        ;;
    *)
        echo xflux
        echo polybar
        echo picom
        ;;
esac
