#! /bin/bash

# Gets list of the clipboard, pipes it to rofi and sets selected variable toselected string
selected=$(cliphist list | rofi -dmenu -p "Clipboard" -i) 

# Actually copies the selected string to the clipboard
echo "$selected" | cliphist decode | wl-copy

