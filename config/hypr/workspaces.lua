-- Imports global default program variables from defaults.lua
require("defaults")

-- See https://wiki.hypr.land/Configuring/Window-Rules/ for more
-- See https://wiki.hypr.land/Configuring/Workspace-Rules/ for workspace rules
--
hl.window_rule({
  -- Ignore maximize requests from apps
  name = "suppress-maximize-events",
  match = { class = ".*" },
  suppress_event = "maximize",
})

hl.window_rule({
  -- Fix some dragging issues with XWayland
  name = "fix-xwayland-drags",
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },

  no_focus = true,
})

hl.window_rule({
  -- Opens MailClient in a special workspace
  name = "email-workspace",
  match = { title = ".*(?i)(" .. MailClient .. ").*" },
  workspace = "special:mail",
  float = true,
  size = { "(monitor_w*0.8)", "(monitor_h*0.8)" },
  center = true,
  opacity = "0.92 0.92 1"
})

hl.window_rule({
  -- Opens SystemMonitor in a special workspace
  name = "system-monitor-workspace",
  match = { initial_class = "^(system-monitor)$" },
  workspace = "special:sysmon",
  float = true,
  size = { "(monitor_w*0.8)", "(monitor_h*0.8)" },
  center = true,
  opacity = "0.9 0.9 1"
})

hl.window_rule({
  name = "messaging-client-workspace",
  match = { initial_class = ".*(?i)(MessagingClient).*" },
  workspace = "special:messaging",
  float = true,
  size = { "(monitor_w*0.8)", "(monitor_h*0.8)" },
  center = true,
  opacity = "0.92 0.92 1"
})

-- Makes workspaces consistent so they show up in waybar
hl.workspace_rule({
  workspace = "1",
  monitor = "eDP-1",
  persistent = true
})
hl.workspace_rule({
  workspace = "2",
  monitor = "eDP-1",
  persistent = true
})
hl.workspace_rule({
  workspace = "3",
  monitor = "eDP-1",
  persistent = true
})
hl.workspace_rule({
  workspace = "4",
  monitor = "eDP-1",
  persistent = true
})
hl.workspace_rule({
  workspace = "5",
  monitor = "eDP-1",
  persistent = true
})
