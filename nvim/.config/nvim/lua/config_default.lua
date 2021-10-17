-- NOTE: Do not edit config_default.lua,
--       copy this file as `config.lua` and edit that.

local M = {}

-- one of "onedark", "everforest", "tokyonight", "gruvbuddy" or "gruvbox"
M.colorscheme = "gruvbox"

-- Plugin config
-- NOTE: Do not remove variables from plugin section, instead change them in-place.
--       Deleting variables will result in startup failure.

-- LSP
M.lsp = {
  -- List of LSP servers to enable
  -- Use :LspInstallInfo to check available servers
  servers = { "sumneko_lua" },
}
-- Treesitter
M.treesitter = {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    disable = {}, -- List of parsers to disable
  },
}

-- Dashboard
M.dashboard = {
  custom_footer = { "Dhananjay's Neovim Config" },
  custom_header = {
    " ______       ___  _______  __   __ ",
    "|      |     |   ||   _   ||  | |  |",
    "|  _    |    |   ||  |_|  ||  |_|  |",
    "| | |   |    |   ||       ||       |",
    "| |_|   | ___|   ||       ||_     _|",
    "|       ||       ||   _   |  |   |",
    "|______| |_______||__| |__|  |___|",
  },
}

-- Vim options
-- NOTE: Add/Remove options as you please.
M.vim = {
  autoindent = true,
  breakindent = true, -- Enable break indent
  cindent = true,
  clipboard = "unnamedplus", -- copy to system clipboard
  cmdheight = 1,
  confirm = true, -- confirm when exiting
  cursorline = true,
  hidden = true, --Do not save when switching buffers
  hlsearch = true, -- Set highlight on search
  ignorecase = true, -- Case insensitive searching
  inccommand = "nosplit", -- Incremental live completion
  incsearch = true,
  list = true,
  listchars = { tab = "› ", eol = "↩", trail = "␣" }, -- must enable `list`
  -- listchars = { tab = "› ", eol = "↩", trail = "␣", lead = "␣" },
  mouse = "a", -- enable mouse mode
  number = true, -- enable line numbers
  relativenumber = true, -- relative line numbers
  scrolloff = 3,
  shada = { "!", "'1000", "<50", "s10", "h" }, -- shada file
  shiftwidth = 4,
  signcolumn = "yes",
  smartcase = true, -- UNLESS /C or capital in search
  softtabstop = 4,
  -- expandtab = true, -- convert tabs to spaces
  splitbelow = true,
  splitright = true,
  swapfile = false, -- Disable swap files
  tabstop = 4,
  undofile = true, -- Save undo history
  updatetime = 250, -- Decrease update time
  wrap = true,
}

return M
