local option_status_ok, o = pcall(require, "options")
if not option_status_ok then
    return
end

--OPTIONS--
o.opacity(0.8)
o.inactive_pane_hsb(0.9, 0.8)
o.tab_bar(true)
o.font({
    'VictorMono Nerd Font',
    'Symbol Nerd Font'
})
o.tab_bar_style()

return o.config
