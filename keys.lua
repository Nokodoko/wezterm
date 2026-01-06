local status_ok, wez = pcall(require, "wezterm")
if not status_ok then
    return
end

local k = {}
k.config = {}

k.leader = function (opt, mod, dur)
   k.config.leader = {
        key = opt,
        mods = mod,
        timeout_milliseconds = dur
    }
end

k.keybindings = function (keys)
    if not k.config.keys then
        k.config.keys = {}
    end
    for _, v in ipairs(keys) do
        table.insert(k.config.keys, v)
    end
end

k.open_url_keybind = function(key, mods)
    if not k.config.keys then
        k.config.keys = {}
    end
    table.insert(k.config.keys, {
        key = key,
        mods = mods,
        action = wez.action.QuickSelectArgs {
            label = "open url",
            patterns = { "https?://[^\\s\"'>]+" },
            action = wez.action_callback(function(window, pane)
                local url = window:get_selection_text_for_pane(pane)
                wez.open_with(url, "vivaldi")
            end),
        },
    })
end

return k
