-- Detect indentation
return {
  "tpope/vim-sleuth",
  event = "BufRead",
  enabled = vim.g.dha.conf.enable.vim_sleuth,
}
