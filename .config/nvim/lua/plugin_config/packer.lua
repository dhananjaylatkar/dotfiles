-- Packer config

-- Install packer
local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end

vim.api.nvim_exec([[
	augroup Packer
		autocmd!
		autocmd BufWritePost init.lua PackerCompile
	augroup end
]], false)

local use = require('packer').use
require('packer').startup(function()
	use 'wbthomason/packer.nvim'       -- Package manager
	use 'tpope/vim-fugitive'           -- Git commands in nvim
	use 'tpope/vim-commentary'         -- "gc" to comment visual regions/lines
	use 'airblade/vim-rooter'          -- Change directory to project root
	-- UI to select things (files, grep results, open buffers...)
	use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
	use {'nvim-telescope/telescope-project.nvim', requires = {'nvim-telescope/telescope.nvim'}}
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use 'joshdick/onedark.vim'         -- Theme inspired by Atom
	use 'itchyny/lightline.vim'        -- Fancier statusline
	use 'folke/which-key.nvim'         -- emacs like Which-key
	use {'ThePrimeagen/harpoon', requires = {{'nvim-lua/plenary.nvim'}, {'nvim-lua/popup.nvim'}}}
	-- Add git related info in the signs columns and popups
	use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'} }
	use 'neovim/nvim-lspconfig'        -- Collection of configurations for built-in LSP client
	use 'hrsh7th/nvim-compe'           -- Autocompletion plugin
	use 'dhananjaylatkar/cscope_maps.nvim' -- cscope keymaps
	use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}}
end)

