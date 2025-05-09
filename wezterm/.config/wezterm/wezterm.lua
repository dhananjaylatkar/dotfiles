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

local _colors = {
  bg = "#0c0c0c",
  fg = "#b6b8bb",

  tab_active_bg = "#25be6a",
  tab_active_fg = "#0c0c0c",

  tab_hover_bg = "#be95ff",
  tab_hover_fg = "#0c0c0c",

  status_bg1 = "#78a9ff",
  status_fg1 = "#0c0c0c",

  status_bg2 = "#282828",
  status_fg2 = "#b6b8bb",
}

local update_items = function(items, bg, fg, text)
  if not text then return end
  table.insert(items, { Background = { Color = bg } })
  table.insert(items, { Foreground = { Color = fg } })
  if text == "" then
    text = " "
  else
    text = (" %s "):format(text)
  end
  table.insert(items, { Text = text })
end

wezterm.on("format-tab-title", function(tab, _, _, _, hover, max_width)
  local items = {}

  local zoom = ""
  if tab.active_pane.is_zoomed then zoom = "[Z]" end
  local title = ("%d %s %s"):format(tab.tab_index + 1, tab_title(tab), zoom)

  if tab.is_active then
    update_items(items, _colors.tab_active_bg, _colors.tab_active_fg, title)
  elseif hover then
    update_items(items, _colors.tab_hover_bg, _colors.tab_hover_fg, title)
  else
    update_items(items, _colors.bg, _colors.fg, title)
  end

  return items
end)

wezterm.on("update-status", function(window, pane)
  local items = {}

  local domain = window:active_pane():get_domain_name()
  update_items(items, _colors.status_bg1, _colors.status_fg1, domain)

  local name = wezterm.mux.get_active_workspace()
  update_items(items, _colors.status_bg2, _colors.status_fg2, name)

  update_items(items, _colors.bg, _colors.fg, "")

  window:set_left_status(wezterm.format(items))
end)

wezterm.on("update-right-status", function(window, pane)
  local items = {}

  local key_table = window:active_key_table()
  update_items(items, _colors.bg, _colors.fg, key_table)

  local date = wezterm.strftime("%H:%M | %b %-d")
  update_items(items, _colors.bg, _colors.fg, date)

  local username = os.getenv("USER") or os.getenv("LOGNAME") or os.getenv("USERNAME")
  update_items(items, _colors.status_bg2, _colors.status_fg2, username)

  local hostname = wezterm.hostname()
  update_items(items, _colors.status_bg1, _colors.status_fg1, hostname)

  window:set_right_status(wezterm.format(items))
end)

return config
