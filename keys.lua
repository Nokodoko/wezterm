local status_ok, act = pcall(require, "wezterm.action")
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
    if not k.config.keys{} then
        k.config.keys{}
    end
    for _, v in ipairs(keys) do
        table.insert(k.config.keys, v)
    end
end


return k
