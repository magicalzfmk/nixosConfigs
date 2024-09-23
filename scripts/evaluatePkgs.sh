#!/bin/bash

# Error Control
error_exit() {
    echo "Error: $1"
    zenity --info --text="Error$1" --title="Command Output" --no-wrap
    exit 1
}

# Prompt the user for input using a zenity entry dialog
input=$(zenity --entry --title="Input Required" --text="Please enter the package name (e.g., bibata-cursors):")

# Check if the user provided input or canceled the dialog
if [ $? -eq 0 ]; then

    # Execute Commands
    cd ~/temporaryFiles || error_exit "No directory temporaryFiles in ~/"
    nix build nixpkgs#$input || error_exit "error fetching pkg(not found?)"
    cd result || error_exit "no result directory found after building"
    output=$(nix run nixpkgs#eza -- --tree --level 3 2>&1) || error_exit "Error creating tree structure"
    cd .. || error_exit "how did this happen?"
    rm result

    zenity --info --text="$output" --title="Command Output" --no-wrap || error_exit "zenity error"

else
    echo "Input was canceled."
fi
