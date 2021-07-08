-- Packer config
require('plugin_config.packer')

-- Vim config
require('vim_config')

-- Utils
require('utils')

-- Load plugin configs
require('plugin_config.lightline')  -- Statusbar
require('plugin_config.telescope')  -- Telescope
require('plugin_config.telescope-project')
-- require('plugin_config.lspconfig')  -- lspconfig
require('plugin_config.nvim-compe') -- nvim-compe
require('plugin_config.which-key')  -- Which-key
require('plugin_config.treesitter') -- Treesitter
require('plugin_config.vim_rooter') -- Vim rooter
require('gitsigns').setup()         -- Gitsigns
require('cscope_maps')              -- Cscope

-- Keymaps
require('keymaps')

