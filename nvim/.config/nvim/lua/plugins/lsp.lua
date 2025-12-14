-- LSP
return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    { "williamboman/mason.nvim" },
  },
  enabled = vim.g.dha.conf.enable.lsp,
  config = function()
    local servers = vim.g.dha.conf.lsp.servers
    local s_names = vim.tbl_keys(servers)
    for _, s in ipairs(s_names) do
      local config = servers[s]
      if config.enable then
        if not vim.tbl_isempty(config) then vim.lsp.config(s, config) end
        vim.lsp.enable(s)
      end
    end
    vim.diagnostic.config({ virtual_lines = { current_line = true } })
  end,
}
