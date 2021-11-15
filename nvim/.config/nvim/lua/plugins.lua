-- Packer config

-- Install packer
local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath("data")
  .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute(
    "!git clone https://github.com/wbthomason/packer.nvim " .. install_path
  )
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
  use({ "justinmk/vim-sneak", event = "BufRead" })

  -- "gc" to comment visual regions/lines
  use({
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require("plugin.comment")
    end,
  })

  -- surround text with ysiw", cs"', ds", etc
  use({ "tpope/vim-surround", event = "BufRead" })

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function()
      require("plugin.telescope")
    end,
    requires = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
  })

  -- Project manager
  use({
    "nvim-telescope/telescope-project.nvim",
    after = "telescope.nvim",
    config = function()
      require("plugin.telescope-project")
    end,
    requires = { "nvim-telescope/telescope.nvim" },
  })

  -- Change directory to project root
  use({
    "ahmedkhalf/project.nvim",
    event = "BufRead",
    config = function()
      require("plugin.project_rooter")
    end,
  })

  -- File browser
  use({
    "kyazdani42/nvim-tree.lua",
    event = "BufWinEnter",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("plugin.nvim-tree")
    end,
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
    requires = { { "nvim-lua/plenary.nvim" }, { "nvim-lua/popup.nvim" } },
  })

  --* Git *--
  -- Add git related info in the signs columns and popups
  use({
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
      require("gitsigns").setup()
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })

  -- Neogit
  use({
    "TimUntersberger/neogit",
    cmd = "Neogit",
    requires = "nvim-lua/plenary.nvim",
  })

  --* Code *--
  -- LSP
  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("plugin.lspconfig")
    end,
  })

  use({
    "williamboman/nvim-lsp-installer",
    config = function()
      require("plugin.nvim-lsp-installer")
    end,
  })

  -- Autocompletion plugin
  use({
    "hrsh7th/nvim-cmp",
    -- event = "InsertEnter",
    config = function()
      require("plugin.nvim-cmp")
    end,
  })
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("f3fora/cmp-spell")
  use("hrsh7th/cmp-emoji")

  -- Snipets
  use({
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip/loaders/from_vscode").lazy_load()
    end,
  })
  use("rafamadriz/friendly-snippets")
  use("saadparwaiz1/cmp_luasnip")

  -- A tree like view for symbols
  use({
    "simrat39/symbols-outline.nvim",
    after = "nvim-lspconfig",
  })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    config = function()
      require("plugin.treesitter")
    end,
    run = ":TSUpdate",
  })

  use({
    "nvim-treesitter/nvim-treesitter-refactor",
    after = "nvim-treesitter",
    config = function()
      require("plugin.nvim-treesitter-refactor")
    end,
  })
  -- Code formatter
  use({
    "mhartington/formatter.nvim",
    event = "BufWinEnter",
    config = function()
      require("plugin.formatter")
    end,
  })

  -- cscope keymaps
  use({
    "dhananjaylatkar/cscope_maps.nvim",
    after = "which-key.nvim",
    config = function()
      require("cscope_maps")
    end,
  })

  --* Looks do matter *--
  -- Dev Icons
  use({ "kyazdani42/nvim-web-devicons", event = "BufWinEnter" })

  -- Hex colors
  use({
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require("plugin.nvim-colorizer")
    end,
  })

  -- dashboard-nvim
  use({
    "glepnir/dashboard-nvim",
    event = "BufWinEnter",
    config = function()
      require("plugin.dashboard")
    end,
  })

  -- Statusline
  use({
    "hoob3rt/lualine.nvim",
    config = function()
      require("plugin.lualine")
    end,
    requires = { "kyazdani42/nvim-web-devicons" },
  })

  -- Markdown
  use({ "junegunn/goyo.vim", cmd = "Goyo" })
  use({ "junegunn/limelight.vim", cmd = "Limelight" })

  use({ "godlygeek/tabular", event = "BufRead" })
  use({
    "plasticboy/vim-markdown",
    config = function()
      require("plugin.vim-markdown")
    end,
  })

  use({
    "lervag/wiki.vim",
    config = function()
      require("plugin.wiki")
    end,
  })

  -- Colorschemes
  use("joshdick/onedark.vim")
  use("sainnhe/gruvbox-material")
  use("sainnhe/everforest")
  use("folke/tokyonight.nvim")
  use("tjdevries/colorbuddy.vim")
  use("tjdevries/gruvbuddy.nvim")
  use("rose-pine/neovim")
end)
