return {
  "echasnovski/mini.nvim",
  lazy = false,
  version = false,
  config = function()
    require("mini.ai").setup() -- enhanced textobjects. 'a(', 'a)', 'a'', 'a*' 'a ', 'an', 'al', 'g[' 'g]'
    require("mini.bracketed").setup() -- move using '[' or ']' + bcxdfijloqtuwy
    require("mini.files").setup() -- floating file tree
    require("mini.indentscope").setup({ symbol = "│" }) -- indentlines
    require("mini.jump").setup() -- Extend f, F, t, T
    require("mini.move").setup() -- Move line/selection with Alt+hjkl
    require("mini.splitjoin").setup() -- 'gS' to join/split args on separate lines
    require("mini.starter").setup({
      items = {
        require("mini.starter").sections.recent_files(10, true, true),
      },
      footer = function()
        return vim.fn.getcwd():gsub(vim.env.HOME, "~")
      end,
    })
    require("mini.surround").setup() -- sa, sd, sr, sf, sh or sn + <surround char>
    require("mini.trailspace").setup() -- highlight trailing whitespace
  end,
}
