local option_status_ok, o = pcall(require, "options")
if not option_status_ok then
    return
end

--OPTIONS--
o.opacity(0.95)

--SATURATION, BRIGHTNESS
o.inactive_pane_hsb(0.9, 0.8)

--DISPLAY TAB BAR
o.tab_bar(true)

--COLOR SCHEME
o.color_scheme('Tokyo Night')

o.config_colors({
--FOREGROUND
--BACKGROUND
--CURSOR_FG
--CURSOR_BG
--SELECTION_FG
--SELECTION_BG
--SCROLLBACK_THUMB
--SPLIT
})

--FONT, FONT-FALLBACK
o.font({
    'VictorMono Nerd Font',
    'Symbol Nerd Font'
})

o.default_workspace("home")

--SCROLLBACK
o.scrollback(3000)

o.tab_bar_style({
    --tab bar background
    '#0b0022',
    --tab bar foreground
    '#2b2042'
})

return o.config
