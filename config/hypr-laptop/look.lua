-- Colors
require("colors")
hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 8,

    border_size = 2,

    -- https://wiki.hypr.land/Configuring/Variables/#variable-types for info about colors
    col = {
      active_border = { colors = { FirstColor, SecondColor }, angle = 45 },
      inactive_border = InactiveBorderColor,
    },

    -- Set to true enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = true,

    -- Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on
    allow_tearing = false,

    layout = "dwindle",
    hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
  },

  misc = {
    disable_splash_rendering = true,
    disable_hyprland_logo = true,
  },

  -- https://wiki.hypr.land/Configuring/Variables/#decoration
  decoration = {
    rounding = 10,
    rounding_power = 2,

    -- Change transparency of focused and unfocused windows
    active_opacity = 1.0,
    inactive_opacity = 1.0,

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },

    -- https://wiki.hypr.land/Configuring/Variables/#blur
    blur = {
      enabled = true,
      size = 3,
      passes = 1,
    },
  },
  hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 1, bezier = "default", style = "fade", })

})
