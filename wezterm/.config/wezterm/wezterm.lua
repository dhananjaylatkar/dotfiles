local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local config = wezterm.config_builder()

config.color_scheme = "carbonfox"

config.font = wezterm.font("Victor Mono", { weight = "DemiBold" })
config.font_size = 14.0

config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.window_decorations = "NONE"

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

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.default_prog = { "powershell.exe" }
  config.window_decorations = "RESIZE"
end

-- tab bar style
config.use_fancy_tab_bar = false
config.tab_max_width = 1600

local function tab_title(tab_info)
  local title = tab_info.tab_title
  if title and #title > 0 then return title end
  return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, _, _, _, hover, max_width)
  local background = "#0c0c0c"
  local foreground = "#b6b8bb"

  if tab.is_active then
    background = "#25be6a"
    foreground = "#0c0c0c"
  elseif hover then
    background = "#be95ff"
    foreground = "#0c0c0c"
  end

  local zoom = ""
  if tab.active_pane.is_zoomed then zoom = "[Z]" end
  local title = ("  %d %s %s "):format(tab.tab_index + 1, tab_title(tab), zoom)

  return {
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
  }
end)

return config
