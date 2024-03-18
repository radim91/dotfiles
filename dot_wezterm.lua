-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_button_style = "Gnome"
config.font = wezterm.font "Inconsolata Nerd Font Mono"
config.warn_about_missing_glyphs = false
config.font_size = 14.5
config.default_prog = { 'fish', '-l' }
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.disable_default_key_bindings = true
config.integrated_title_buttons = { 'Close' }
config.show_new_tab_button_in_tab_bar = true
config.show_tab_index_in_tab_bar = false
config.prefer_to_spawn_tabs = true

config.colors = {
    background = "#2C2E34",
}

config.keys = {
  {
    key = 'n',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(1)
  },
  {
    key = 'p',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(-1)
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.SpawnTab 'DefaultDomain',
  },
  {
    key = 'q',
    mods = 'LEADER',
    action = wezterm.action.QuitApplication,
  },
  {
    key = 'a',
    mods = 'LEADER|CTRL',
    action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
  }
}


config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action_callback(function(window, pane)
			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
				window:perform_action(act.ClearSelection, pane)
			else
				window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
			end
		end),
	},
}

config.window_padding = {
  left = 5,
  right = 5,
  top = 15,
  bottom = 1,
}

config.default_cwd = "/home/radim/dev"
-- and finally, return the configuration to wezterm
return config

