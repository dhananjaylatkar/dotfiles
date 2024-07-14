local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha (Gogh)"

config.font = wezterm.font("JetBrains Mono")
config.font_size = 14.0

config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.window_decorations = "NONE"

-- config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.mouse_bindings = {
	-- Right click to paste
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = act.PasteFrom("Clipboard"),
	},
}

return config
