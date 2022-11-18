# !/usr/bin/env bash

polybar-msg cmd quit

if  type "xrandr"; then
		for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload mybar &
	done
else
	polybar --reload mybar &
fi
