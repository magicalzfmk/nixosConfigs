#!/bin/bash

# Kill all running instances of Waybar
pkill waybar

# Wait a moment to ensure Waybar has stopped
sleep 1

# Relaunch a single instance of Waybar
hyprctl dispatch exec waybar &
