#!/usr/bin/env bash
swww-daemon &

swww img ~/Wallpapers/current.png &

nm-applet --indicator &

pidof waybar || waybar &

mako &

hypridle