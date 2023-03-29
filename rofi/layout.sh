#!/bin/bash

case "$*" in
    "Layout 1")
        ~/Scripts/Screenlayout/Layout_1.sh
        ;;
    "Layout 2")
        ~/Scripts/Screenlayout/Layout_2.sh
        ;;
    "Layout 3")
        ~/Scripts/Screenlayout/Layout_3.sh
        ;;
    "")
        echo Layout 1
        echo Layout 2
        echo Layout 3
        ;;
esac
