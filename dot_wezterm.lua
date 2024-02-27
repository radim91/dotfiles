-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.font = wezterm.font 'Inconsolata Nerd Font'
config.warn_about_missing_glyphs = false
config.font_size = 13.5
config.default_prog = { 'fish', '-l' }

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- and finally, return the configuration to wezterm
return config

