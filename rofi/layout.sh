#!/bin/bash

case "$*" in
    "Layout 1")
        ~/Scripts/Screenlayout/Layout_1.sh
        ;;
    "Layout 2")
        ~/Scripts/Screenlayout/Layout_2.sh
        ;;
    "")
        echo Layout 1
        echo Layout 2
        ;;
esac
