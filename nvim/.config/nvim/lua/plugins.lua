-- Packer config

-- Install lazy.nvim
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

local opts = {
	defaults = {
		lazy = true,
	},
}

local plugins = {
	-- Recurring Dependancies
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-lua/popup.nvim" },

	-- 2 char search
	{
		"ggandor/lightspeed.nvim",
		event = "BufRead",
		config = function()
			require("plugin.lightspeed")
		end,
		enabled = CONFIG.enable.lightspeed,
	},

	-- "gc" to comment visual regions/lines
	{
		"numToStr/Comment.nvim",
		event = "BufRead",
		config = function()
			require("plugin.comment")
		end,
		enabled = CONFIG.enable.Comment,
	},

	-- surround text with ysiw", cs"', ds", etc
	{
		"tpope/vim-surround",
		event = "BufRead",
		enabled = CONFIG.enable.vim_surround,
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		event = "BufWinEnter",
		config = function()
			require("plugin.telescope")
		end,
	},

	-- Project manager
	{
		"nvim-telescope/telescope-project.nvim",
		event = "BufWinEnter",
		config = function()
			require("plugin.telescope-project")
		end,
		requires = { "nvim-telescope/telescope.nvim" },
		enabled = CONFIG.enable.telescope_project,
	},

	-- Change directory to project root
	{
		"ahmedkhalf/project.nvim",
		event = "BufRead",
		config = function()
			require("plugin.project_rooter")
		end,
		enabled = CONFIG.enable.project,
	},

	-- File browser
	{
		"kyazdani42/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("plugin.nvim-tree")
		end,
		enabled = CONFIG.enable.nvim_tree,
	},

	-- which-key
	{
		"folke/which-key.nvim",
		config = function()
			require("plugin.which-key")
			require("keymaps")
		end,
		event = "BufWinEnter",
	},

	-- Harpoon
	{
		"ThePrimeagen/harpoon",
		enabled = CONFIG.enable.harpoon,
	},

	--* Git *--
	-- Add git related info in the signs columns and popups
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("plugin.gitsigns")
		end,
		enabled = CONFIG.enable.gitsigns,
	},

	-- Neogit
	{
		"TimUntersberger/neogit",
		cmd = "Neogit",
		requires = "nvim-lua/plenary.nvim",
		enabled = CONFIG.enable.neogit,
	},

	-- Git Blame
	{
		"bobrown101/git_blame.nvim",
		event = "BufRead",
		enabled = CONFIG.enable.git_blame,
	},

	--* Code *--
	-- LSP
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			require("plugin.lsp")
		end,
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
		},
		enabled = CONFIG.enable.lsp,
	},

	{
		"williamboman/mason.nvim",
		lazy = false,
		enabled = CONFIG.enable.mason,
	},

	-- Autocompletion plugin
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"f3fora/cmp-spell",
			"hrsh7th/cmp-emoji",
		},
		config = function()
			require("plugin.nvim-cmp")
		end,
		enabled = CONFIG.enable.nvim_cmp,
	},

	{
		"ZhiyuanLck/smart-pairs",
		event = "InsertEnter",
		config = function()
			require("pairs"):setup()
		end,
		enabled = CONFIG.enable.smart_pairs,
	},

	-- Snipets
	{
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		config = function()
			require("luasnip/loaders/from_vscode").lazy_load()
		end,
		dependencies = {
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
		},
		enabled = CONFIG.enable.LuaSnip and CONFIG.enable.nvim_cmp,
	},

	-- Undotree
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		enabled = CONFIG.enable.undotree,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		config = function()
			require("plugin.treesitter")
		end,
		run = ":TSUpdate",
		enabled = CONFIG.enable.nvim_treesitter,
	},

	{
		"nvim-treesitter/nvim-treesitter-refactor",
		event = "BufRead",
		config = function()
			require("plugin.nvim-treesitter-refactor")
		end,
		enabled = CONFIG.enable.nvim_treesitter_refactor and CONFIG.enable.nvim_treesitter,
	},
	-- Code formatter
	{
		"mhartington/formatter.nvim",
		cmd = "Format",
		config = function()
			require("plugin.formatter")
		end,
		enabled = CONFIG.enable.formatter,
	},
	-- Detect indentation
	{
		"tpope/vim-sleuth",
		event = "BufRead",
		enabled = CONFIG.enable.vim_sleuth,
	},

	-- cscope keymaps
	{
		"dhananjaylatkar/cscope_maps.nvim",
		ft = { "c", "h", "dashboard" },
		cmd = "Cscope",
		config = function()
			require("cscope_maps").setup({ cscope = { use_telescope = true } })
		end,
		enabled = CONFIG.enable.cscope_maps,
	},

	--* Looks do matter *--
	-- Dev Icons
	{
		"kyazdani42/nvim-web-devicons",
		enabled = CONFIG.enable.nvim_web_devicons,
	},

	-- Hex colors
	{
		"norcalli/nvim-colorizer.lua",
		ft = { "css", "js", "html" },
		config = function()
			require("plugin.nvim-colorizer")
		end,
		enabled = CONFIG.enable.nvim_colorizer,
	},

	-- dashboard-nvim
	{
		"glepnir/dashboard-nvim",
		lazy = false,
		config = function()
			require("plugin.dashboard")
		end,
		enabled = CONFIG.enable.dashboard,
	},

	-- Statusline
	{
		"hoob3rt/lualine.nvim",
		event = "BufWinEnter",
		config = function()
			require("plugin.lualine")
		end,
		enabled = CONFIG.enable.lualine,
	},

	-- Markdown
	{
		"junegunn/goyo.vim",
		cmd = "Goyo",
		enabled = CONFIG.enable.goyo,
	},
	{
		"junegunn/limelight.vim",
		cmd = "Limelight",
		enabled = CONFIG.enable.limelight,
	},
	{
		"dkarter/bullets.vim",
		event = "BufRead",
		ft = { "md", "markdown" },
		config = function()
			require("plugin.bullets")
		end,
		enabled = CONFIG.enable.bullets,
	},
	{
		"godlygeek/tabular",
		ft = { "md", "markdown" },
		enabled = CONFIG.enable.tabular and CONFIG.enable.vim_markdown,
	},
	{
		"plasticboy/vim-markdown",
		ft = { "md", "markdown" },
		config = function()
			require("plugin.vim-markdown")
		end,
		enabled = CONFIG.enable.vim_markdown,
	},

	-- Colorschemes
	{ "joshdick/onedark.vim" },
	{ "sainnhe/gruvbox-material" },
	{ "sainnhe/everforest" },
	{ "folke/tokyonight.nvim" },
	{ "rose-pine/neovim" },
	{ "Shatur/neovim-ayu" },
	{ "rebelot/kanagawa.nvim" },
	{ "arcticicestudio/nord-vim" },
	{ "catppuccin/nvim" },
}
require("lazy").setup(plugins, opts)
