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

-- Unix domains
-- config.unix_domains = { { name = "0" } }
-- config.default_gui_startup_args = { "connect", "0" }

-- tab and status bar style
config.hide_tab_bar_if_only_one_tab = true
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

  local name = mux.get_active_workspace()
  update_items(items, _colors.status_bg2, _colors.status_fg2, name)

  update_items(items, _colors.bg, _colors.fg, "")

  window:set_left_status(wezterm.format(items))
end)

wezterm.on("update-right-status", function(window, pane)
  local items = {}

  local key_table = window:active_key_table()
  update_items(items, _colors.bg, _colors.fg, key_table)

  if window:leader_is_active() then update_items(items, _colors.bg, _colors.fg, "`") end

  local date = wezterm.strftime("%H:%M | %b %-d")
  update_items(items, _colors.bg, _colors.fg, date)

  local username = os.getenv("USER") or os.getenv("LOGNAME") or os.getenv("USERNAME")
  update_items(items, _colors.status_bg2, _colors.status_fg2, username)

  local hostname = wezterm.hostname()
  update_items(items, _colors.status_bg1, _colors.status_fg1, hostname)

  window:set_right_status(wezterm.format(items))
end)

-- LEADER based keybindings
-- config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 5000 }
-- config.keys = {
--   { key = "a", mods = "LEADER|CTRL", action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }) },
--
--   -- tab navigation
--   { key = "1", mods = "LEADER", action = act.ActivateTab(0) },
--   { key = "2", mods = "LEADER", action = act.ActivateTab(1) },
--   { key = "3", mods = "LEADER", action = act.ActivateTab(2) },
--   { key = "4", mods = "LEADER", action = act.ActivateTab(3) },
--   { key = "5", mods = "LEADER", action = act.ActivateTab(4) },
--   { key = "6", mods = "LEADER", action = act.ActivateTab(5) },
--   { key = "7", mods = "LEADER", action = act.ActivateTab(6) },
--   { key = "8", mods = "LEADER", action = act.ActivateTab(7) },
--   { key = "9", mods = "LEADER", action = act.ActivateTab(8) },
--   { key = "0", mods = "LEADER", action = act.ActivateTab(9) },
--   { key = "Tab", mods = "LEADER", action = act.ActivateLastTab },
--
--   -- pane life cycle
--   { key = "_", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
--   { key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
--   { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
--   { key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
--
--   -- tab life cycle
--   { key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
--   { key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
--   { key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },
--   {
--     key = ",",
--     mods = "LEADER",
--     action = act.PromptInputLine({
--       description = "Enter new name for tab",
--       initial_value = "ws",
--       action = wezterm.action_callback(function(window, pane, line)
--         if line then window:active_tab():set_title(line) end
--       end),
--     }),
--   },
--
--   -- scroll
--   { key = "PageUp", mods = "SHIFT", action = act.ScrollByPage(-1) },
--   { key = "PageDown", mods = "SHIFT", action = act.ScrollByPage(1) },
--
--   -- pane navigation
--   { key = "LeftArrow", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
--   { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
--
--   { key = "RightArrow", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
--   { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
--
--   { key = "UpArrow", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
--   { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
--
--   { key = "DownArrow", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
--   { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
--
--   -- pane resize
--   { key = "H", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
--   { key = "J", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
--   { key = "K", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
--   { key = "L", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
-- }
--
-- config.key_tables = {
--   resize_pane = {
--     { key = "H", action = act.AdjustPaneSize({ "Left", 1 }) },
--     { key = "L", action = act.AdjustPaneSize({ "Right", 1 }) },
--     { key = "K", action = act.AdjustPaneSize({ "Up", 1 }) },
--     { key = "J", action = act.AdjustPaneSize({ "Down", 1 }) },
--     { key = "Escape", action = "PopKeyTable" },
--   },
-- }

return config
