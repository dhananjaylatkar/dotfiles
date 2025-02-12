---@diagnostic disable: undefined-global
local M = {}

M.resume = function()
  local ok, _ = pcall(MiniPick.builtin.resume)
  if not ok then print("There is no picker to resume.") end
end

M._files = function(opts)
  MiniPick.builtin.cli({
    command = {
      "fd",
      "--hidden",
      "-t",
      "f",
      "-E",
      ".git*",
      "-E",
      "*venv*",
      "-E",
      "cscope.out",
      "-E",
      "cscope.files",
      "-E",
      "cscope.in.out",
      "-E",
      "cscope.po.out",
    },
  }, {
    source = {
      name = opts.name,
      show = function(buf_id, items, query)
        MiniPick.default_show(buf_id, items, query, { show_icons = true })
      end,
      cwd = opts.cwd,
    },
  })
end

M.files = function()
  M._files({ name = "Files", cwd = vim.fn.getcwd() })
end

M.recent_cwd = function()
  MiniExtra.pickers.oldfiles({ current_dir = true })
end

M.recent = function()
  MiniExtra.pickers.oldfiles()
end

M.project = function()
  local cwd = vim.fn.expand("~/code")
  local choose = function(item)
    vim.schedule(function()
      M._files({ name = item.path, cwd = item.path })
    end)
  end
  return MiniExtra.pickers.explorer({ cwd = cwd }, { source = { choose = choose } })
end

M.buffers = function()
  MiniPick.builtin.buffers()
end

M.buffer_search = function()
  MiniExtra.pickers.buf_lines({ scope = "current" })
end

M.buffer_grep_live = function()
  MiniExtra.pickers.buf_lines({ scope = "all" })
end

M.grep = function()
  MiniPick.builtin.grep()
end

M.grep_live = function()
  MiniPick.builtin.grep_live()
end

M.grep_cword = function()
  local sym = ""
  if vim.fn.mode() == "v" then
    local saved_reg = vim.fn.getreg("v")
    vim.cmd([[noautocmd sil norm! "vy]])
    sym = vim.fn.getreg("v")
    vim.fn.setreg("v", saved_reg)
  else
    local arg = "<cword>"
    sym = vim.fn.expand(arg)
  end
  MiniPick.builtin.grep({ pattern = sym }, { source = { name = string.format("Grep (%s)", sym) } })
end

M.history = function()
  MiniExtra.pickers.history()
end

M.jumplist = function()
  MiniExtra.pickers.list({ scope = "jump" })
end

M.lsp_references = function()
  MiniExtra.pickers.lsp({ scope = "references" })
end

M.lsp_definitions = function()
  MiniExtra.pickers.lsp({ scope = "definition" })
end

M.lsp_implementations = function()
  MiniExtra.pickers.lsp({ scope = "implementation" })
end

M.lsp_document_symbols = function()
  MiniExtra.pickers.lsp({ scope = "document_symbol" })
end

M.lsp_workspace_symbols = function()
  MiniExtra.pickers.lsp({ scope = "workspace_symbol" })
end

M.lsp_document_diagnostics = function()
  MiniExtra.pickers.diagnostic({ scope = "current" })
end

M.lsp_workspace_diagnostics = function()
  MiniExtra.pickers.diagnostic({ scope = "all" })
end

return M
