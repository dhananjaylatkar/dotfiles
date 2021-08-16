-- Packer config
require("plugin_config.packer")

-- Vim config
require("vim_config")

-- Utils
require("utils")

-- Load plugin configs
require("plugin_config.colors") -- Colorschems
require("plugin_config.dashboard") -- Doom like dashboard
require("plugin_config.lualine") -- Statusbar
require("plugin_config.telescope") -- Telescope
require("plugin_config.telescope-project")
require("plugin_config.lspconfig") -- lspconfig
require("plugin_config.nvim-compe") -- nvim-compe
require("plugin_config.which-key") -- Which-key
require("plugin_config.treesitter") -- Treesitter
require("plugin_config.vim_rooter") -- Vim rooter
require("plugin_config.nvim-colorizer") -- Hex colors
require("plugin_config.formatter") -- Code formatter
require("plugin_config.neogit") -- Magit
require("gitsigns").setup() -- Gitsigns
require("cscope_maps") -- Cscope

-- Keymaps
require("keymaps")
