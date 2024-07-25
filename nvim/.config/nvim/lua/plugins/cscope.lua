-- cscope keymaps
return {
  -- dir = "~/code/cscope_maps.nvim",
  "dhananjaylatkar/cscope_maps.nvim",
  ft = { "c", "h", "cpp", "ministarter" },
  cmd = { "Cscope", "Cstag", "Cs" },
  keys = "<C-]>",
  opts = {
    cscope = {
      picker = "mini-pick",
      project_rooter = { enable = true },
    },
  },
  enabled = vim.g.dha.conf.enable.cscope_maps,
}
