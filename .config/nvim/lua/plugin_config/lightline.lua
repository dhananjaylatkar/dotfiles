-- lightline

vim.g.lightline = {
  colorscheme = "onedark",
  active = {
    left = { { "mode", "paste" }, { "gitbranch", "readonly", "relativepath", "modified" } },
    right = { { "lineinfo" }, { "percent" }, { "fileformat", "fileencoding", "filetype" } },
  },
  subseparator = {
    left = "│",
    right = "│",
  },
  component_function = { gitbranch = "fugitive#head" },
}
