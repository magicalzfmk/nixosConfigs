#!/bin/bash

pkill waybar

sleep 1

hyprctl dispatch exec waybar &
