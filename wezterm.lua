local option_status_ok, o = pcall(require, "options")
if not option_status_ok then
    return
end

local keys_ok, k = pcall(require, "keys")
if not keys_ok then
    return
end

--OPTIONS--
o.opacity(0.95)

--SATURATION, BRIGHTNESS
o.inactive_pane_hsb(0.9, 0.8)

--DISPLAY TAB BAR
o.tab_bar(true)
o.tab_bar_bottom(false)

--COLOR SCHEME
o.color_scheme('Tokyo Night')

--CUSTOM COLOR SCHEME
--o.config_colors(
----FOREGROUND
----BACKGROUND
----CURSOR_FG
----CURSOR_BG
----SELECTION_FG
----SELECTION_BG
----SCROLLBACK_THUMB
----SPLIT
----COMPOSE_CURSOR
----COPY_MODE_ACTIVE_HIGHLIGHT_BG
----COPY_MODE_ACTIVE_HIGHLIGHT_FG
----COPY_MODE_INACTIVE_HIGHLIGHT_BG
----COPY_MODE_INACTIVE_HIGHLIGHT_FG
----QUICK_SELECT_LABEL_BG
----QUICK_SELECT_LABEL_FG
----QUICK_SELECT_MATCH_BG
----QUICK_SELECT_MATCH_FG
--)

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

--KEYS--
k.leader(
--KEY
'space',
--MODS
'ctrl',
--TIMEOUT_MILLISECONDS
1000
)

return o.config
