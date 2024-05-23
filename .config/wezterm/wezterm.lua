-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Gruvbox Dark (Gogh)'
config.window_background_opacity = 0.9
config.font = wezterm.font 'IosevkaTerm NFM'
config.font_shaper = 'Harfbuzz'
config.font_size = 16
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

-- and finally, return the configuration to wezterm
return config
