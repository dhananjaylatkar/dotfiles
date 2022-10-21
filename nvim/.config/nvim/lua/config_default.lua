-- NOTE: Do not edit config_default.lua,
--       copy this file as `config.lua` and edit that.

local M = {}

--[[ Available colorschemes:
  - ayu
  - catppuccin
  - everforest
  - gruvbox
  - kanagawa
  - nord
  - onedark
  - rosepine
  - tokyonight
--]]
M.colorscheme = "gruvbox"

-- Plugin config

-- LSP
M.lsp = {
	-- List of LSP servers to enable
	-- Use :LspInstallInfo to check available servers
	servers = { "sumneko_lua" },
}
-- Treesitter
M.treesitter = {
	ensure_installed = { "lua" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = {}, -- List of parsers to ignore installing
	highlight = {
		disable = {}, -- List of parsers to disable
	},
}

-- Dashboard
M.dashboard = {
	custom_footer = { "Dhananjay's Neovim Config" },
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
	nvim_lspconfig = true, -- neovim/nvim-lspconfig
	nvim_lsp_installer = true, -- williamboman/nvim-lsp-installer
	nvim_cmp = true, -- hrsh7th/nvim-cmp
	cmp_nvim_lsp = true, -- hrsh7th/cmp-nvim-lsp
	cmp_buffer = true, -- hrsh7th/cmp-buffer
	cmp_path = true, -- hrsh7th/cmp-path
	cmp_spell = true, -- f3fora/cmp-spell
	cmp_emoji = true, -- hrsh7th/cmp-emoji
	smart_pairs = false, -- ZhiyuanLck/smart-pairs
	LuaSnip = true, -- L3MON4D3/LuaSnip
	friendly_snippets = true, -- rafamadriz/friendly-snippets
	cmp_luasnip = true, -- saadparwaiz1/cmp_luasnip
	symbols_outline = true, -- simrat39/symbols-outline.nvim
	undotree = true, -- mbbill/undotree
	nvim_treesitter = true, -- nvim-treesitter/nvim-treesitter
	nvim_treesitter_refactor = true, -- nvim-treesitter/nvim-treesitter-refactor
	formatter = true, -- mhartington/formatter.nvim
	vim_sleuth = true, -- tpope/vim-sleuth
	cscope_maps = true, -- dhananjaylatkar/cscope_maps.nvim
	nvim_web_devicons = true, -- kyazdani42/nvim-web-devicons
	nvim_colorizer = true, -- norcalli/nvim-colorizer.lua
	dashboard = true, -- glepnir/dashboard-nvim
	lualine = true, -- hoob3rt/lualine.nvim
	goyo = true, -- junegunn/goyo.vim
	limelight = true, -- junegunn/limelight.vim
	bullets = true, -- dkarter/bullets.vim
	tabular = true, -- godlygeek/tabular
	vim_markdown = true, -- plasticboy/vim-markdown
}

return M
