-- cscope keymaps
return {
  -- dir = "~/code/cscope_maps.nvim",
  "dhananjaylatkar/cscope_maps.nvim",
  ft = { "c", "h", "cpp", "starter" },
  cmd = { "Cscope", "Cstag" },
  keys = "<C-]>",
  opts = {
    cscope = {
      picker = "telescope",
    },
  },
  enabled = vim.g.dha.conf.enable.cscope_maps,
}
