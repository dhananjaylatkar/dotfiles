-- Hex colors
return
{
  "norcalli/nvim-colorizer.lua",
  ft = { "css", "js", "html", "yaml", "yml" },
  cmd = { "ColorizerToggle" },
  opts = { "css", "javascript", "html", "yaml", "yml" },
  enabled = vim.g.dha.conf.enable.nvim_colorizer,
}
