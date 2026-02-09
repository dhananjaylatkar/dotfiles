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

M.get_rel_path = function(path, rel_to)
  if vim.fn.isabsolutepath(path) == 0 then return path end

  if rel_to == nil then rel_to = vim.fn.getcwd() end
  local rel_path = ""
  local sp_rel_to = vim.split(vim.fs.normalize(rel_to), "/")
  local sp_path = vim.split(vim.fs.normalize(path), "/")
  local len_rel_to = #sp_rel_to + 1
  local len_path = #sp_path + 1
  local i = 1

  -- skip till parents are same
  while i < len_rel_to and i < len_path do
    if sp_rel_to[i] == sp_path[i] then
      i = i + 1
    else
      break
    end
  end

  -- append "../" for remaining parents
  rel_path = rel_path .. string.rep("../", len_rel_to - i)

  -- append remaining path
  rel_path = rel_path .. table.concat(sp_path, "/", i)

  if rel_path == "" then rel_path = "." end

  return rel_path
end
return M
