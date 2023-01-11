-- Packer config

-- Install packer
local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.api.nvim_exec(
	[[
	augroup Packer
		autocmd!
		autocmd BufWritePost packer.lua PackerCompile
	augroup end
]],
	false
)

local use = require("packer").use

require("packer").startup(function()
	-- Package manager
	use("wbthomason/packer.nvim")

	-- Recurring Dependancies
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")

	-- 2 char search
	use({
		"ggandor/lightspeed.nvim",
		config = function()
			require("plugin.lightspeed")
		end,
		disable = not CONFIG.enable.lightspeed,
	})

	-- "gc" to comment visual regions/lines
	use({
		"numToStr/Comment.nvim",
		event = "BufRead",
		config = function()
			require("plugin.comment")
		end,
		disable = not CONFIG.enable.Comment,
	})

	-- surround text with ysiw", cs"', ds", etc
	use({
		"tpope/vim-surround",
		event = "BufRead",
		disable = not CONFIG.enable.vim_surround,
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		config = function()
			require("plugin.telescope")
		end,
	})

	-- Project manager
	use({
		"nvim-telescope/telescope-project.nvim",
		after = "telescope.nvim",
		config = function()
			require("plugin.telescope-project")
		end,
		requires = { "nvim-telescope/telescope.nvim" },
		disable = not CONFIG.enable.telescope_project,
	})

	-- Change directory to project root
	use({
		"ahmedkhalf/project.nvim",
		event = "BufRead",
		config = function()
			require("plugin.project_rooter")
		end,
		disable = not CONFIG.enable.project,
	})

	-- File browser
	use({
		"kyazdani42/nvim-tree.lua",
		event = "BufWinEnter",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("plugin.nvim-tree")
		end,
		disable = not CONFIG.enable.nvim_tree,
	})

	-- which-key
	use({
		"folke/which-key.nvim",
		config = function()
			require("plugin.which-key")
			require("keymaps")
		end,
		event = "BufWinEnter",
	})

	-- Harpoon
	use({
		"ThePrimeagen/harpoon",
		event = "BufWinEnter",
		disable = not CONFIG.enable.harpoon,
	})

	--* Git *--
	-- Add git related info in the signs columns and popups
	use({
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("plugin.gitsigns")
		end,
		disable = not CONFIG.enable.gitsigns,
	})

	-- Neogit
	use({
		"TimUntersberger/neogit",
		cmd = "Neogit",
		requires = "nvim-lua/plenary.nvim",
		disable = not CONFIG.enable.neogit,
	})

	--* Code *--
	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("plugin.lsp")
		end,
		requires = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
		},
		disable = not CONFIG.enable.lsp,
	})

	-- Autocompletion plugin
	use({
		"hrsh7th/nvim-cmp",
		-- event = "InsertEnter",
		config = function()
			require("plugin.nvim-cmp")
		end,
		disable = not CONFIG.enable.nvim_cmp,
	})
	use({
		"hrsh7th/cmp-nvim-lsp",
		disable = not CONFIG.enable.cmp_nvim_lsp or not CONFIG.enable.nvim_cmp,
	})
	use({
		"hrsh7th/cmp-buffer",
		disable = not CONFIG.enable.cmp_buffer or not CONFIG.enable.nvim_cmp,
	})
	use({
		"hrsh7th/cmp-path",
		disable = not CONFIG.enable.cmp_path or not CONFIG.enable.nvim_cmp,
	})
	use({
		"f3fora/cmp-spell",
		disable = not CONFIG.enable.cmp_spell or not CONFIG.enable.nvim_cmp,
	})
	use({
		"hrsh7th/cmp-emoji",
		disable = not CONFIG.enable.cmp_emoji or not CONFIG.enable.nvim_cmp,
	})

	use({
		"ZhiyuanLck/smart-pairs",
		event = "InsertEnter",
		config = function()
			require("pairs"):setup()
		end,
		disable = not CONFIG.enable.smart_pairs,
	})

	-- Snipets
	use({
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip/loaders/from_vscode").lazy_load()
		end,
		disable = not CONFIG.enable.LuaSnip or not CONFIG.enable.nvim_cmp,
	})
	use({
		"rafamadriz/friendly-snippets",
		disable = not CONFIG.enable.friendly_snippets or not CONFIG.enable.LuaSnip or not CONFIG.enable.nvim_cmp,
	})
	use({
		"saadparwaiz1/cmp_luasnip",
		disable = not CONFIG.enable.cmp_luasnip or not CONFIG.enable.LuaSnip or not CONFIG.enable.nvim_cmp,
	})

	-- A tree like view for symbols
	use({
		"simrat39/symbols-outline.nvim",
		after = "nvim-lspconfig",
		disable = not CONFIG.enable.symbols_outline,
	})

	-- Undotree
	use({
		"mbbill/undotree",
		disable = not CONFIG.enable.undotree,
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		config = function()
			require("plugin.treesitter")
		end,
		run = ":TSUpdate",
		disable = not CONFIG.enable.nvim_treesitter,
	})

	use({
		"nvim-treesitter/nvim-treesitter-refactor",
		after = "nvim-treesitter",
		config = function()
			require("plugin.nvim-treesitter-refactor")
		end,
		disable = not CONFIG.enable.nvim_treesitter_refactor or not CONFIG.enable.nvim_treesitter,
	})
	-- Code formatter
	use({
		"mhartington/formatter.nvim",
		event = "BufWinEnter",
		config = function()
			require("plugin.formatter")
		end,
		disable = not CONFIG.enable.formatter,
	})
	-- Detect indentation
	use({
		"tpope/vim-sleuth",
		disable = not CONFIG.enable.vim_sleuth,
	})

	-- cscope keymaps
	use({
		"dhananjaylatkar/cscope_maps.nvim",
		after = "which-key.nvim",
		config = function()
			require("cscope_maps")
		end,
		disable = not CONFIG.enable.cscope_maps,
	})

	--* Looks do matter *--
	-- Dev Icons
	use({
		"kyazdani42/nvim-web-devicons",
		event = "BufWinEnter",
		disable = not CONFIG.enable.nvim_web_devicons,
	})

	-- Hex colors
	use({
		"norcalli/nvim-colorizer.lua",
		event = "BufRead",
		config = function()
			require("plugin.nvim-colorizer")
		end,
		disable = not CONFIG.enable.nvim_colorizer,
	})

	-- dashboard-nvim
	use({
		"glepnir/dashboard-nvim",
		event = "BufWinEnter",
		config = function()
			require("plugin.dashboard")
		end,
		disable = not CONFIG.enable.dashboard,
	})

	-- Statusline
	use({
		"hoob3rt/lualine.nvim",
		config = function()
			require("plugin.lualine")
		end,
		disable = not CONFIG.enable.lualine,
	})

	-- Markdown
	use({
		"junegunn/goyo.vim",
		cmd = "Goyo",
		disable = not CONFIG.enable.goyo,
	})
	use({
		"junegunn/limelight.vim",
		cmd = "Limelight",
		disable = not CONFIG.enable.limelight,
	})
	use({
		"dkarter/bullets.vim",
		config = function()
			require("plugin.bullets")
		end,
		disable = not CONFIG.enable.bullets,
	})
	use({
		"godlygeek/tabular",
		event = "BufRead",
		disable = not CONFIG.enable.tabular or not CONFIG.enable.vim_markdown,
	})
	use({
		"plasticboy/vim-markdown",
		config = function()
			require("plugin.vim-markdown")
		end,
		disable = not CONFIG.enable.vim_markdown,
	})

	-- Colorschemes
	use("joshdick/onedark.vim")
	use("sainnhe/gruvbox-material")
	use("sainnhe/everforest")
	use("folke/tokyonight.nvim")
	use("tjdevries/colorbuddy.vim")
	use("rose-pine/neovim")
	use("Shatur/neovim-ayu")
	use("rebelot/kanagawa.nvim")
	use("arcticicestudio/nord-vim")
	use({ "catppuccin/nvim", as = "catppuccin" })
end)
