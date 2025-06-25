#!/bin/bash

flameshot full -p ~/Pictures/Lockscreen.png
magick ~/Pictures/Lockscreen.png -blur "8x3" ~/Pictures/Lockscreen.png
i3lock -i ~/Pictures/Lockscreen.png
sleep 1