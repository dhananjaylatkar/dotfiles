local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local config = wezterm.config_builder()

config.color_scheme = "dayfox"

-- cyberdream
-- config.colors = {
--     foreground = "#ffffff",
--     background = "#16181a",
--
--     cursor_bg = "#ffffff",
--     cursor_fg = "#16181a",
--     cursor_border = "#ffffff",
--
--     selection_fg = "#ffffff",
--     selection_bg = "#3c4048",
--
--     scrollbar_thumb = "#16181a",
--     split = "#16181a",
--
--     ansi = { "#16181a", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
--     brights = { "#3c4048", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
--     indexed = { [16] = "#ffbd5e", [17] = "#ff6e5e" },
-- }

config.font = wezterm.font("Victor Mono", { weight = "DemiBold" })
config.font_size = 14.0

config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.window_decorations = "RESIZE"

-- config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- don't ask when closing
config.window_close_confirmation = "NeverPrompt"

-- Maximize on startup
wezterm.on("gui-attached", function(_)
  -- maximize all displayed windows on startup
  local workspace = mux.get_active_workspace()
  for _, window in ipairs(mux.all_windows()) do
    if window:get_workspace() == workspace then window:gui_window():maximize() end
  end
end)

config.mouse_bindings = {
  -- Right click to paste
  {
    event = { Down = { streak = 1, button = "Right" } },
    mods = "NONE",
    action = act.PasteFrom("Clipboard"),
  },
}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then config.default_prog = { "powershell.exe" } end

return config
