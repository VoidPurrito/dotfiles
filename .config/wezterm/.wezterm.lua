-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.debug_key_events = true
--config.disable_default_key_bindings = true

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.icolor_scheme = 'AdventureTime'

config.initial_rows = 40
config.initial_cols = 150

config.colors = {
    foreground = '#2ffe5a',
}

config.window_background_opacity = 0.8

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
    {
        mods = 'LEADER',
        key = '-',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        mods = 'LEADER',
        key = '=',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
}

-- and finally, return the configuration to wezterm
return config
