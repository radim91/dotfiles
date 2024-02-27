-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.font = wezterm.font 'Inconsolata Nerd Font'
config.warn_about_missing_glyphs = false
config.font_size = 13.5
config.default_prog = { 'fish', '-l' }
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

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
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

wezterm.action.SpawnCommandInNewWindow {
    cwd = '~/dev'
}
-- and finally, return the configuration to wezterm
return config

