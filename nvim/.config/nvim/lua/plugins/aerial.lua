return {
  "stevearc/aerial.nvim",
  keys = {
    { "<f6>", "<cmd>AerialToggle!<CR>" },
    { "{", "<cmd>AerialPrev<CR>" },
    { "}", "<cmd>AerialNext<CR>" },
  },
  opts = {
    backends = { "treesitter" },
  },
}
