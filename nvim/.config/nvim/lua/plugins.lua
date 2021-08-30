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
  use({ "tpope/vim-commentary", event = "BufRead" })

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
    event = "BufRead",
    config = function()
      require("plugin.lspconfig")
    end,
  })

  -- Autocompletion plugin
  use({
    "hrsh7th/nvim-compe",
    event = "InsertEnter",
    config = function()
      require("plugin.nvim-compe")
    end,
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

  -- Colorschemes
  use("joshdick/onedark.vim")
  use("sainnhe/gruvbox-material")
  use("sainnhe/everforest")
  use("folke/tokyonight.nvim")
  use("tjdevries/colorbuddy.vim")
  use("tjdevries/gruvbuddy.nvim")
end)
