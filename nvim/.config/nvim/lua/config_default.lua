-- NOTE: Do not edit config_default.lua,
--       copy this file as `config.lua` and edit that.

local M = {}

--[[ Available colorschemes:
  - ayu
  - catppuccin
  - everforest
  - gruvbox-material
  - kanagawa
  - nord
  - onedark
  - rosepine
  - tokyonight
--]]
M.colorscheme = "gruvbox-material"

-- Plugin config

-- LSP
M.lsp = {
  -- List of LSP servers to enable
  -- Use :LspInstallInfo to check available servers
  -- Use empty table if no settings are required
  servers = {
    lua_ls = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
        diagnostics = { globals = { "vim" } },
      },
    },
  },
}
-- Treesitter
M.treesitter = {
  ensure_installed = { "lua" }, -- List of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    disable = {}, -- List of parsers to disable
  },
}

-- Dashboard
M.dashboard = {
  custom_footer = { "", "Dhananjay's Neovim Config" },
  custom_header = {
    "",
    "",
    "",
    " ______       ___  _______  __   __ ",
    "|      |     |   ||   _   ||  | |  |",
    "|  _    |    |   ||  |_|  ||  |_|  |",
    "| | |   |    |   ||       ||       |",
    "| |_|   | ___|   ||       ||_     _|",
    "|       ||       ||   _   |  |   |  ",
    "|______| |_______||__| |__|  |___|  ",
    "",
    "",
  },
}

-- Notes
M.notes = {
  root_dir = os.getenv("HOME") .. "/code/notes/",
}
-- Vim options
-- NOTE: Overide vim options using this table (defaults can be found in vim_config.lua).
M.vim = {}

-- Plugins
M.enable = {
  lightspeed = true, -- ggandor/lightspeed.nvim
  Comment = true, -- numToStr/Comment.nvim
  vim_surround = true, -- tpope/vim-surround
  telescope_project = true, -- nvim-telescope/telescope-project.nvim
  project = true, -- ahmedkhalf/project.nvim
  nvim_tree = true, -- kyazdani42/nvim-tree.lua
  harpoon = true, -- ThePrimeagen/harpoon
  gitsigns = true, -- lewis6991/gitsigns.nvim
  neogit = true, -- TimUntersberger/neogit
  git_blame = true, -- f-person/git-blame.nvim
  lsp = true, -- neovim/nvim-lspconfig
  nvim_cmp = true, -- hrsh7th/nvim-cmp
  LuaSnip = true, -- L3MON4D3/LuaSnip
  undotree = true, -- mbbill/undotree
  nvim_treesitter = true, -- nvim-treesitter/nvim-treesitter
  nvim_treesitter_refactor = true, -- nvim-treesitter/nvim-treesitter-refactor
  nvim_treesitter_context = true, -- nvim-treesitter/nvim-treesitter-context
  formatter = true, -- mhartington/formatter.nvim
  vim_sleuth = true, -- tpope/vim-sleuth
  cscope_maps = true, -- dhananjaylatkar/cscope_maps.nvim
  nvim_web_devicons = true, -- kyazdani42/nvim-web-devicons
  nvim_colorizer = true, -- norcalli/nvim-colorizer.lua
  indent_blankline = true, -- lukas-reineke/indent-blankline.nvim
  dashboard = true, -- glepnir/dashboard-nvim
  lualine = true, -- hoob3rt/lualine.nvim
  vim_markdown = true, -- plasticboy/vim-markdown
}

M.custom = function()
  -- additional device specific config
end

return M
