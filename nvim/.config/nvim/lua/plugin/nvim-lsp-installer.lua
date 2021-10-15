local lsp_installer_servers = require("nvim-lsp-installer.servers")
local servers = CONFIG.lsp.servers
for _, server in ipairs(servers) do
  local ok, server_info = lsp_installer_servers.get_server(server)
  if ok then
    if not server_info:is_installed() then
      server_info:install()
    end
  end
end

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}

  -- (optional) Customize the options passed to the server
  -- if server.name == "tsserver" then
  --     opts.root_dir = function() ... end
  -- end

  -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
  server:setup(opts)
  vim.cmd([[ do User LspAttachBuffers ]])
end)
