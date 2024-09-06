vim.loader.enable()
require("utils").install_lazy()
require("utils").update_config()
require("vim_config")
require("lazy").setup({
  import = "plugins",
}, {
  defaults = {
    lazy = true,
  },
  change_detection = {
    enabled = false,
    notify = false,
  },
})
require("keymaps")
require("autocommands")
local ok, _ = pcall("colors." .. vim.g.dha.conf.colorscheme)
if not ok then
  vim.cmd("colorscheme " .. vim.g.dha.conf.colorscheme)
end

-- Overwrite with user specific config
if vim.g.dha.conf.custom then
  vim.g.dha.conf.custom()
end
