local status_ok, wez = pcall(require, "wezterm")
if not status_ok then
    return
end

local o = {}
o.config = {}

o.opacity = function (float)
    o.config.window_background_opacity = float
end

o.tab_bar = function (bool)
    o.config.enable_tab_bar = bool
end

o.tab_bar_style = function ()
    o.config.hide_tab_bar_if_only_one_tab = true
    o.config.use_fancy_tab_bar = false
    o.config.text_background_opacity = 0.0
--   local left_arrow =  wez.nerdfonts.pl_right_hard_divider
--   local right_arrow =  wez.nerdfonts.pl_left_hard_divider
    o.config.tab_bar_style = {
        new_tab_left = {
            Background = 'red',
            Foreground = blue,
            --{Text = left_arrow},
        },
            new_tab_right = wez.format {
            Background = 'red',
            Foreground = blue,
           --{Text = right_arrow},
        },
        inactive_tab_left = wez.format{
            Background = 'red',
            Foreground = blue,
            --{Text = left_arrow},
        },
        inactive_tab_right = wez.format{
            Background = 'red',
            Foreground = blue,
            --{Text = right_arrow},
        },
    }
end

o.inactive_pane_hsb = function (float1, float2)
    o.config.inactive_pane_hsb = {
        saturation = float1,
        brightness = float2
    }
end

o.font = function (font)
   o.config.font = wez.font_with_fallback(font)
end

return o
