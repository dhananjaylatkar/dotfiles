-- LSP settings

local nvim_lsp = require("lspconfig")
local on_attach = function(_client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

-- Enable the following language servers
local servers = { "clangd", "rust_analyzer", "pyright", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({ on_attach = on_attach })
end
