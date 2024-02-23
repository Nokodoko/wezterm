local status_ok, wez = pcall(require, "wezterm")
if not status_ok then
	return
end

local o = {}
o.config = {}

o.opacity = function(float)
	o.config.window_background_opacity = float
end

o.tab_bar = function(bool)
	o.config.enable_tab_bar = bool
end

o.tab_bar_bottom = function(bool)
	o.config.tab_bar_at_bottom = bool
end

o.inactive_pane_hsb = function(float1, float2)
	o.config.inactive_pane_hsb = {
		saturation = float1,
		brightness = float2,
	}
end

o.scrollback = function(number)
	o.config.scrollback_lines = number
end

o.color_scheme = function(color_scheme)
	o.config.color_scheme = color_scheme
end

o.config_colors = function(bg, fg, cbg, cfg, sbg, sfg, sbt, splt, cmab, cmaf, cmib, cmif, qslb, qslf, qsmb, qsmf, crs)
	o.config.colors = {
		foreground = fg,
		background = bg,
		cursor_fg = cfg,
		cursor_bg = cbg,
		selection_fg = sfg,
		selection_bg = sbg,
		scrollback_thumb = sbt,
		split = splt,
		ansi = {
			"black",
			"maroon",
			"green",
			"olive",
			"navy",
			"purple",
			"teal",
			"silver",
		},
		brights = {
			"grey",
			"red",
			"lime",
			"yellow",
			"blue",
			"fuchsia",
			"aqua",
			"white",
		},
		compose_cursor = crs,
		copy_mode_active_highlight_bg = { Color = cmab },
		copy_mode_active_highlight_fg = { AnsiColor = cmaf },
		copy_mode_inactive_highlight_bg = { Color = cmib },
		copy_mode_inactive_highlight_fg = { AnsiColor = cmif },

		quick_select_label_bg = { Color = qslb },
		quick_select_label_fg = { Color = qslf },
		quick_select_match_bg = { AnsiColor = qsmb },
		quick_select_match_fg = { Color = qsmf },
	}
end

o.default_workspace = function(workspace)
	o.config.default_workspace = workspace
end

o.font = function(font, fallback)
	o.config.font = wez.font_with_fallback(font, fallback)
	o.config.font_size = 23
end

o.tab_bar_style = function(tbsb, tbsf)
	o.config.hide_tab_bar_if_only_one_tab = true
	o.config.use_fancy_tab_bar = true
	--   local left_arrow =  wez.nerdfonts.pl_right_hard_divider
	--   local right_arrow =  wez.nerdfonts.pl_left_hard_divider
	--    o.config.tab_bar_style = {
	--        background = tbsb,
	--        foreground = tbsf
	--    }
	--        new_tab_left = {
	--            {Background = '#000000'},
	--            --{Background = '#0b0022'},
	--            {Foreground = '#2b2042'},
	--            {Text = left_arrow},
	--        },
	--            new_tab_right = wez.format {
	--            {Background = '#000000'},
	--            --{Background = '#0b0022'},
	--            {Foreground = '#2b2042'},
	--           {Text = right_arrow},
	--        },
	--        inactive_tab_left = wez.format{
	--            {Background = '#000000'},
	--            --{Background = '#0b0022'},
	--            {Foreground = '#2b2042'},
	--            {Text = left_arrow},
	--        },
	--        inactive_tab_right = wez.format{
	--            {Background = '#000000'},
	--            --{Background = '#0b0022'},
	--            {Foreground = '#2b2042'},
	--            {Text = right_arrow},
	--        },
end

return o
