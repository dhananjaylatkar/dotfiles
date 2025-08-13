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
    vim.o.foldcolumn = "0"
    print("Mouse disabled")
  else
    vim.cmd("set list")
    vim.wo.signcolumn = "yes"
    vim.o.mouse = "a"
    vim.wo.number = true
    vim.wo.relativenumber = true
    vim.o.foldcolumn = "1"
    print("Mouse enabled")
  end
end

M.update_config = function()
  local conf = require("config_default")
  conf.file = "config_default.lua"

  local _ok, config_user = pcall(require, "config")
  if _ok then
    conf = vim.tbl_deep_extend("force", conf, config_user)
    conf.file = "config.lua"
  end

  vim.g.dha = { conf = conf }
end

M.install_lazy = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
end

M.set_undo = function()
  -- Read Undo file for current buffer
  local function ReadUndo()
    local fname = vim.api.nvim_buf_get_name(0)
    local undofile = string.format("%s%s", vim.o.undodir, fname)

    if vim.fn.filereadable(undofile) ~= 1 then return end
    vim.cmd(string.format("silent! rundo " .. vim.fn.fnameescape(undofile)))
  end

  -- Write Undo file for current buffer
  local function WriteUndo()
    local fname = vim.api.nvim_buf_get_name(0)
    local undofile = string.format("%s%s", vim.o.undodir, fname)
    local dir = vim.fn.fnamemodify(undofile, ":h")

    if vim.fn.isdirectory(dir) == 0 then vim.fn.mkdir(dir, "p") end
    vim.cmd(string.format("silent! wundo %s", vim.fn.fnameescape(undofile)))
  end

  -- Autocommands
  vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = ReadUndo,
  })

  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*",
    callback = WriteUndo,
  })
end

return M
