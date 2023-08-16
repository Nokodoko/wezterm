local wezterm = require('wezterm')

local config = {}


config.font = wezterm.font_with_fallback {
    'VictorMono Nerd Font',
    'Symbol Nerd Font'
}
config.window_background_opacity = 0.7
config.window_decorations = "RESIZE"

config.inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.8,
}

--IF YOU EVER WANT A DIFFERENT BACKGROUND IN YOUR TERMINAL
--config.window_background_image = 'path/to/image'
--config_widow_background_image = {
--    brightness = 0.3,
--    hue = 1.0,
--    saturation = 1.0,
--}

return config
