-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_button_style = "Gnome"
config.font = wezterm.font "Inconsolata Nerd Font"
config.warn_about_missing_glyphs = false
config.font_size = 14
config.default_prog = { 'fish', '-l' }
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.disable_default_key_bindings = true

config.keys = {
  {
    key = 'n',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(1)
  },
  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  {
    key = 'a',
    mods = 'LEADER|CTRL',
    action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
  },
}

config.window_padding = {
  left = 1,
  right = 1,
  top = 5,
  bottom = 1,
}

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

config.default_cwd = "/home/radim/dev"
-- and finally, return the configuration to wezterm
return config

