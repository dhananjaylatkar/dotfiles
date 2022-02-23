-- Treesitter

require("nvim-treesitter.configs").setup({
	ensure_installed = CONFIG.treesitter.ensure_installed, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = CONFIG.treesitter.ignore_install, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = CONFIG.treesitter.highlight.disable, -- list of language that will be disabled
	},
})
