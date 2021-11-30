-- NOTE: Do not edit config_default.lua,
--       copy this file as `config.lua` and edit that.

local M = {}

-- one of "gruvbox", "onedark", "everforest", "tokyonight", "gruvbuddy", or "rose-pine"
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
    " ______       ___  _______  __   __",
    "|      |     |   ||   _   ||  | |  |",
    "|  _    |    |   ||  |_|  ||  |_|  |",
    "| | |   |    |   ||       ||       |",
    "| |_|   | ___|   ||       ||_     _|",
    "|       ||       ||   _   |  |   |",
    "|______| |_______||__| |__|  |___|",
  },
}

-- Wiki
M.wiki = {
  root_dir = "~/code/notes",
}
-- Vim options
-- NOTE: Overide vim options using this table (defaults can be found in vim_config.lua).
M.vim = {}

return M
