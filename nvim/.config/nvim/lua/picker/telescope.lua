local M = {}

M.resume = function()
  require("telescope.builtin").resume()
end

M.files = function()
  require("telescope.builtin").find_files({ hidden = true })
end

M.recent_cwd = function()
  require("telescope.builtin").oldfiles({ cwd_only = true })
end

M.recent = function()
  require("telescope.builtin").oldfiles()
end

M.project = function()
  require("telescope").extensions.project.project()
end

M.buffers = function()
  require("telescope.builtin").buffers({ sort_mru = true })
end

M.buffer_search = function()
  require("telescope.builtin").current_buffer_fuzzy_find()
end

M.buffer_grep_live = function()
  require("telescope.builtin").live_grep({ grep_open_files = true })
end

M.grep = function()
  local input_string = vim.fn.input("Grep pattern: ")
  if input_string == "" then return end
  require("telescope.builtin").grep_string({ search = input_string })
end

M.grep_live = function()
  require("telescope.builtin").live_grep()
end

M.grep_cword = function()
  require("telescope.builtin").grep_string()
end

M.history = function()
  require("telescope.builtin").command_history()
end

M.jumplist = function()
  require("telescope.builtin").jumplist()
end

M.lsp_references = function()
  require("telescope.builtin").lsp_references()
end

M.lsp_definitions = function()
  require("telescope.builtin").lsp_definitions()
end

M.lsp_implementations = function()
  require("telescope.builtin").lsp_implementations()
end

M.lsp_document_symbols = function()
  require("telescope.builtin").lsp_document_symbols()
end

M.lsp_workspace_symbols = function()
  require("telescope.builtin").lsp_workspace_symbols()
end

M.lsp_document_diagnostics = function()
  require("telescope.builtin").lsp_document_diagnostics()
end

M.lsp_workspace_diagnostics = function()
  require("telescope.builtin").lsp_workspace_diagnostics()
end

M.help = function()
  require("telescope.builtin").help_tags()
end

return M
