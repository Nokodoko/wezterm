-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker

--REQUIREMENTS {{{
local wezterm = require("wezterm")

local option_status_ok, o = pcall(require, "options")
if not option_status_ok then
	return
end

local keys_ok, k = pcall(require, "keys")
if not keys_ok then
	return
end
--}}}

--CMDR-DASHBOARD WINDOW RULE {{{
-- When wezterm is launched with --class containing "cmdr-dashboard",
-- force the window to spawn at 200 columns x 55 rows.
wezterm.on("gui-startup", function(cmd)
	local found = false
	local procinfo = wezterm.procinfo or {}
	local argv_fn = procinfo.argv
	if argv_fn then
		for _, arg in ipairs(argv_fn()) do
			if arg:match("cmdr%-dashboard") then
				found = true
				break
			end
		end
	end
	if found then
		local spawn = cmd or {}
		spawn.width = 200
		spawn.height = 55
		local tab, pane, window = wezterm.mux.spawn_window(spawn)
		return
	end
end)
--}}}

--TRUECOLOR / BRIGHTNESS {{{
-- Advertise wezterm terminfo so apps emit 24-bit color sequences.
o.term("wezterm")
-- WebGpu front-end renders colors brighter/more accurately vs default OpenGL.
o.front_end("WebGpu")
-- Ensure bold uses bright ANSI palette (matches kitty default).
o.bold_brightens_ansi_colors("BrightAndBold")
-- Full-strength foreground (no HSB dimming).
o.foreground_text_hsb(1.0, 1.0, 1.0)
--}}}

--OPACITY {{{
-- Was 0.8 — transparency darkens perceived colors vs kitty/neovide (opaque).
o.opacity(1.0)
--}}}

--SATURATION, BRIGHTNESS {{{
-- Was (0.9, 0.8) — dimmed inactive panes. Full brightness matches other terms.
o.inactive_pane_hsb(1.0, 1.0)
--}}}

--TAB BAR {{{
--DISPLAY
o.tab_bar(true)
o.tab_bar_bottom(true)

-- BAR STYLE
o.tab_bar_style({
	--tab bar background
	"#0b0022",
	--tab bar foreground
	"#2b2042",
})
--}}}

--COLOR SCHEME {{{
--}}}

--CUSTOM COLOR SCHEME {{{
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
--}}}

--FONT, FONT-FALLBACK{{{
o.font({
    "VictorMono Nerd Font",
    "Symbols Nerd Font",
    "Noto Color Emoji",
    "Noto Sans CJK JP",
})
--}}}

-- DEFAULT WORKSPACE {{{
o.default_workspace("home")
--}}}

--SCROLLBACK {{{
o.scrollback(3000)
--}}}

--KEYS-- {{{
--k.leader(
----KEY
--'space',
----MODS
--'ctrl',
----TIMEOUT_MILLISECONDS
--1000
--)

k.open_url_keybind("u", "CTRL|SHIFT")
k.disable_debug_overlay()

-- Disable CTRL+SHIFT+SPACE so it passes through to dunst
k.keybindings({
    { key = "Space", mods = "CTRL|SHIFT", action = "DisableDefaultAssignment" },
    { key = "LeftArrow", mods = "CTRL|SHIFT", action = "DisableDefaultAssignment" },
    { key = "RightArrow", mods = "CTRL|SHIFT", action = "DisableDefaultAssignment" },
    { key = "UpArrow", mods = "CTRL|SHIFT", action = "DisableDefaultAssignment" },
    { key = "DownArrow", mods = "CTRL|SHIFT", action = "DisableDefaultAssignment" },
    { key = "LeftArrow", mods = "ALT", action = "DisableDefaultAssignment" },
    { key = "RightArrow", mods = "ALT", action = "DisableDefaultAssignment" },
    { key = "UpArrow", mods = "ALT", action = "DisableDefaultAssignment" },
    { key = "DownArrow", mods = "ALT", action = "DisableDefaultAssignment" },
})
o.config.keys = k.config.keys

return o.config
--}}}
