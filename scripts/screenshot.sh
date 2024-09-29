#!/bin/bash

FILENAME="screenshot_$(date +%Y%m%d_%H%M%S)"

flameshot screen -p ~/Pictures/Screenshots/"$FILENAME"

sleep 1

pkill flameshot
