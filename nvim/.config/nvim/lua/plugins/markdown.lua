return {
  "plasticboy/vim-markdown",
  ft = { "md", "markdown" },
  config = function()
    vim.g.vim_markdown_folding_disabled = 1
    vim.g.vim_markdown_conceal = 0

    vim.g.tex_conceal = ""
    vim.g.vim_markdown_math = 1

    vim.g.vim_markdown_frontmatter = 1
    vim.g.vim_markdown_toml_frontmatter = 1
    vim.g.vim_markdown_json_frontmatter = 1
  end,
  enabled = vim.g.dha.conf.enable.vim_markdown,
}
