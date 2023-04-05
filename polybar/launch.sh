# !/usr/bin/env bash

polybar-msg cmd quit

MONITOR=eDP-1 polybar --reload primary &
MONITOR=DP-1 polybar --reload primary &
MONITOR=HDMI-1 polybar --reload secondary &
