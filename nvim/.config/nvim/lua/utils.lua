-- Utils: some useful functions

local M = {}

-- Toggle to disable mouse mode and indentlines for easier paste
M.ToggleMouse = function()
  if vim.o.mouse == "a" then
    vim.cmd("set nolist")
    vim.wo.signcolumn = "no"
    vim.o.mouse = "v"
    vim.wo.number = false
    vim.wo.relativenumber = false
    print("Mouse disabled")
  else
    vim.cmd("set list")
    vim.wo.signcolumn = "yes"
    vim.o.mouse = "a"
    vim.wo.number = true
    vim.wo.relativenumber = true
    print("Mouse enabled")
  end
end

M.get_config = function()
  local config = require("config_default")
  local config_file = "config_default.lua"

  local _ok, config_user = pcall(require, "config")
  if _ok then
    config = vim.tbl_deep_extend("force", config, config_user)
    config_file = "config.lua"
  end

  return config, config_file
end

return M
