-- Code formatter

-- vim.api.nvim_exec(
--   [[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.js,*.lua FormatWrite
-- augroup END
-- ]],
--   true
-- )

require("formatter").setup({
	logging = false,
	filetype = {
		javascript = {
			-- prettier
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						vim.api.nvim_buf_get_name(0),
						"--single-quote",
					},
					stdin = true,
				}
			end,
		},
		python = {
			-- yapf
			function()
				return {
					exe = "yapf",
					stdin = true,
				}
			end,
		},
		lua = {
			-- stylua
			function()
				return {
					exe = "stylua",
					stdin = false,
				}
			end,
		},
		cpp = {
			-- clang-format
			function()
				return {
					exe = "clang-format",
					stdin = true,
				}
			end,
		},
		c = {
			-- clang-format
			function()
				return {
					exe = "clang-format",
					stdin = true,
				}
			end,
		},
	},
})
