-- cscope keymaps
local C = vim.g.dha.conf.cscope_maps
return {
  "dhananjaylatkar/cscope_maps.nvim",
  ft = { "c", "h", "cpp", "ministarter" },
  cmd = { "Cscope", "Cstag", "Cs" },
  opts = C.opts,
  enabled = vim.g.dha.conf.enable.cscope_maps,
  keys = {
    { "<C-]>" },
    { "<C-\\>", "<cmd>Cs f c<cr>", mode = { "n", "v" }, desc = "cs caller" },

    { "<C-c><C-s>", "<cmd>Cs f s<cr>", mode = { "n", "v" }, desc = "cs symbol" },
    { "<C-c><C-g>", "<cmd>Cs f g<cr>", mode = { "n", "v" }, desc = "cs global" },
    { "<C-c><C-c>", "<cmd>Cs f c<cr>", mode = { "n", "v" }, desc = "cs caller" },
    { "<C-c><C-t>", "<cmd>Cs f t<cr>", mode = { "n", "v" }, desc = "cs text" },
    { "<C-c><C-f>", "<cmd>Cs f f<cr>", mode = { "n", "v" }, desc = "cs file" },
    { "<C-c><C-i>", "<cmd>Cs f i<cr>", mode = { "n", "v" }, desc = "cs included" },
    { "<C-c><C-d>", "<cmd>Cs f d<cr>", mode = { "n", "v" }, desc = "cs called" },
    { "<C-c><C-a>", "<cmd>Cs f a<cr>", mode = { "n", "v" }, desc = "cs assigned" },
    { "<C-c><C-b>", "<cmd>Cs f b<cr>", mode = { "n", "v" }, desc = "cs build" },

    { "<C-c><C-x>", "<cmd>CsStackView open down<cr>", mode = { "n", "v" }, desc = "Stack view down" },
    { "<C-c><C-v>", "<cmd>CsStackView open up<cr>", mode = { "n", "v" }, desc = "Stack view up" },
    { "<C-c><C-o>", "<cmd>CsStackView toggle<cr>", mode = { "n", "v" }, desc = "Stack view toggle" },
  },
}
