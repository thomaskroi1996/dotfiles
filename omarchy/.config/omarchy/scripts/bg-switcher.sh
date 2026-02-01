#!/bin/bash

THEME_NAME="gruvbox" # change this to your active theme
INTERVAL=6                 # time in seconds
BG_DIR="$HOME/.config/omarchy/backgrounds/$THEME_NAME"

if [ ! -d "$BG_DIR" ]; then
    echo "Directory $BG_DIR does not exist."
    exit 1
fi

while true; do
    # get a random picture
    BG=$(find "$BG_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)

    # using hyprpaper for setting the background
    hyprctl hyprpaper unload "$BG"
    hyprctl hyprpaper preload "$BG"
    hyprctl hyprpaper wallpaper " ,$BG"

    sleep "$INTERVAL"

    hyprctl hyprpaper unload "$BG"
done
