hl.on("hyprland.start", function()
  -- Hyprland idle management daemon
  hl.exec_cmd("hypridle")
  -- Notification daemon
  hl.exec_cmd("dunst")
  -- Automatically mounts storage devices
  hl.exec_cmd("udiskie")
  -- Start the bar
  hl.exec_cmd("waybar")
  -- Start the background clock
  hl.exec_cmd("waybar -c ~/.config/waybar-clock/config.jsonc -s ~/.config/waybar-clock/style.css")
  -- Hyprpaper
  hl.exec_cmd("hyprpaper")
  -- Hyprsunset
  hl.exec_cmd("hyprsunset")
  -- Cliphist
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image -- watch cliphist store")
end)
