-- LSP
return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    -- Additional lua configuration, makes nvim stuff amazing
    { "folke/neodev.nvim" },

    -- Automatically install LSPs to stdpath for neovim
    { "williamboman/mason-lspconfig.nvim" },
  },
  enabled = vim.g.dha.conf.enable.lsp,
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local servers = vim.g.dha.conf.lsp.servers
    local server_names = vim.tbl_keys(servers)

    mason.setup()

    -- -- Uninstall servers removed from config
    -- local registry = require("mason-registry")
    -- for _, server in pairs(registry.get_installed_package_names()) do
    -- 	print("Checking server " .. server)
    -- 	if not vim.tbl_contains(server_names, server) then
    -- 		print("Removing " .. server)
    -- 		registry.get_package(server):uninstall()
    -- 	end
    -- end

    -- Setup neovim lua configuration
    require("neodev").setup()

    -- Install new servers added to config
    mason_lspconfig.setup({
      ensure_installed = server_names,
    })

    --  This function gets run when an LSP connects to a particular buffer.
    local on_attach = function(_, bufnr)
      vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
    end

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    mason_lspconfig.setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
        })
      end,
    })
  end,
}
