local pick_scroll_one_line = function(direction)
  local key = ({ down = "<C-y>", up = "<C-e>" })[direction]
  key = vim.api.nvim_replace_termcodes(key, true, true, true)
  local scroll_fun = function(win_id)
    vim.api.nvim_win_call(win_id, function()
      vim.cmd("normal! " .. key)
    end)
  end

  return function()
    local win_id = MiniPick.get_picker_state().windows.main
    local is_not_main_view = vim.api.nvim_get_current_buf() ~= MiniPick.get_picker_state().buffers.main
    if is_not_main_view then
      return scroll_fun(win_id)
    end
  end
end

return {
  "echasnovski/mini.nvim",
  lazy = false,
  version = false,
  config = function()
    require("mini.ai").setup() -- enhanced textobjects. 'a(', 'a)', 'a'', 'a*' 'a ', 'an', 'al', 'g[' 'g]'
    require("mini.bracketed").setup() -- move using '[' or ']' + bcxdfijloqtuwy
    require("mini.files").setup() -- floating file tree
    require("mini.indentscope").setup({
      draw = {
        delay = 0,
        animation = require("mini.indentscope").gen_animation.none(),
      },
      symbol = "│",
    }) -- indentlines
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
    require("mini.pick").setup({
      mappings = {
        scroll_one_line_down = { char = "<C-y>", func = pick_scroll_one_line("down") },
        scroll_one_line_up = { char = "<C-e>", func = pick_scroll_one_line("up") },
      },
      source = {
        preview = function(buf_id, item)
          MiniPick.default_preview(buf_id, item, { line_position = "center" })
        end,
      },
    }) -- picker
    require("mini.extra").setup() -- extra stuff
    require("mini.diff").setup({
      view = {
        style = "sign",
        signs = { add = "+", change = "~", delete = "-" },
      },
    }) -- diff signs and keymaps to traverse diff hunks
    local hipatterns = require("mini.hipatterns")
    hipatterns.setup({
      highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
        hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
        todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
        note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    }) -- colorizer
  end,
}
