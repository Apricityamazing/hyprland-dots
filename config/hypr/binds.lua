-- Imports global default program variables from defaults.lua
require("defaults")

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Launching Default programs
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(Browser))
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(Terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(FileManager))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(Menu))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd(MailClient))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(Terminal .. " " .. SystemMonitor))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(MessagingClient))
-- Miscellaneous programs + scripts
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("hyprpicker - a"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("hyprshutdown"))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m region -o ~/Screenshots")) -- Screenshot region of screen
hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m output -o ~/Screenshots")) -- Screenshot entire screen
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("~/.config/waybar/scripts/killwaybar.sh")) -- Kill waybar
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("~/.config/waybar/scripts/startwaybar.sh")) -- Restart waybar
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("~/.config/wallust/scripts/wallust-sync.sh")) -- Temporary (setup to change whenever wallpaper changes)

-- Window managing
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.kill())
hl.bind(mainMod .. " + SHIFT + space", hl.dsp.window.float({ action = "float"}))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
-- Fullscreen_state valid internal / client values Current = -1 | None = 0 | Maximize = 1 | Fullscreen | 2 | Maximize and Fullscreen = 3
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 2, action = "toggle" }))

-- Drag windows by holding mainMod
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())

-- Move focus with mainMod with vim bindings
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move windows with mainMod + shift with vim bindings
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Resize windows with mainMod + ctrl with vim bindings
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.resize({ x = 0, y = 10, relative = true }))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.resize({ x = 0, y = -10, relative = true }))

-- While holding down mainMod + D sets the opacity to 60% - BROKEN 
hl.bind(mainMod .. " + D", hl.dsp.window.set_prop({ prop = "opacity", value = "0.6 0.6 0.6" }), { repeating = true })
hl.bind(mainMod .. " + D", hl.dsp.window.set_prop({ prop = "opacity", value = "1" }), { release = true })

for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  -- Switch workspaces with mainMod + [0-9]
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i}))
  -- Move active window to a workspace with mainMod + SHIFT + [0-9]
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false}))
end

-- Brightness and Volume controls
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl -- set-sink-volume 0 -5%"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl -- set-sink-volume 0 +5%"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl -- set-sink-mute 0 toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl -- set-source-mute 0 toggle"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"))
hl.bind(mainMod .. " + XF86MonBrightnessDown", hl.dsp.exec_cmd("hyprctl hyprsunset temperature -300")) -- Increase temperature
hl.bind(mainMod .. " + XF86MonBrightnessUp", hl.dsp.exec_cmd("hyprctl hyprsunset temperature +300")) -- Decrease temperature
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("hyprctl hyprsunset temperature 2500")) -- Turn blue-light filter
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("hyprctl hyprsunset identity")) -- Turn off blue-light filter
