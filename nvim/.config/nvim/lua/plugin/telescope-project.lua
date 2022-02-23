-- Telescope projects extention

require("telescope").setup({
	extensions = {
		project = {
			base_dirs = { "~/code", max_depth = 3 },
			hidden_files = true,
		},
	},
})

require("telescope").load_extension("project")
