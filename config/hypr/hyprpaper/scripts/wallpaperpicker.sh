#! /bin/bash
wallpaper=$(find ~/.config/hypr/hyprpaper/wallpapers/ -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.jxl" -o -name "*.webp" \) | rofi -dmenu -preview "cat {}" -preview-window "image:40%")

echo "$wallpaper"
