#!/usr/bin/env bash

swww init &

swww img ~/Wallpapers/current.png &

nm-applet --indicator &

hyprctl dispatch exec waybar &

mako
