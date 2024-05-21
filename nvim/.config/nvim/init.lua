require("utils").install_lazy()
require("utils").update_config()
require("vim_config")
require("lazy").setup({ { import = "plugins", opts = { defaults = { lazy = true } } } })
require("keymaps")
require("autocommands")
require("colors." .. vim.g.dha.conf.colorscheme)

-- Overwrite with user specific config
if vim.g.dha.conf.custom then
  vim.g.dha.conf.custom()
end
