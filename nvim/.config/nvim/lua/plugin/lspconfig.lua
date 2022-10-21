-- LSP settings

local nvim_lsp = require("lspconfig")
local on_attach = function(_client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

----------------------------------------------
-- Using nvim-lsp-installer for LSP servers --
----------------------------------------------
-- Enable the following language servers
-- local servers = CONFIG.lsp.servers
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup({ on_attach = on_attach, capabilities = capabilities })
-- end
