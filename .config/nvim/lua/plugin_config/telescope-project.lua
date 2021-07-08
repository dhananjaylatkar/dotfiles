-- Telescope projects extention

require('telescope').setup {
	extensions = {
		project = {
			base_dirs = {'~/code', max_depth = 3},
		}
	}
}

require('telescope').load_extension('project')

