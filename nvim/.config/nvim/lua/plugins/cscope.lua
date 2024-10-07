-- cscope keymaps
local C = vim.g.dha.conf.cscope_maps
return {
  "dhananjaylatkar/cscope_maps.nvim",
  ft = C.ft,
  cmd = C.cmd,
  keys = C.keys,
  opts = C.opts,
  enabled = vim.g.dha.conf.enable.cscope_maps,
}
