return {
  "echasnovski/mini.nvim",
  lazy = false,
  version = false,
  config = function()
    local e = vim.g.dha.conf.enable

    -- enhanced textobjects. 'a(', 'a)', 'a'', 'a*' 'a ', 'an', 'al', 'g[' 'g]'
    if e.mini_ai then require("mini.ai").setup() end

    -- move using '[' or ']' + bcxdfijloqtuwy
    if e.mini_bracketed then require("mini.bracketed").setup() end

    -- floating file tree
    if e.mini_files then require("mini.files").setup() end

    -- indentlines
    if e.mini_indentscope then
      require("mini.indentscope").setup({
        draw = { delay = 0, animation = require("mini.indentscope").gen_animation.none() },
        symbol = "│",
      })
    end

    -- Extend f, F, t, T
    if e.mini_jump then require("mini.jump").setup() end

    -- Move line/selection with Alt+hjkl
    if e.mini_move then require("mini.move").setup() end

    -- 'gS' to join/split args on separate lines
    if e.mini_splitjoin then require("mini.splitjoin").setup() end

    -- Beautiful start page
    if e.mini_starter then
      require("mini.starter").setup({
        items = {
          require("mini.starter").sections.recent_files(10, true, true),
        },
        footer = function()
          return vim.fn.getcwd():gsub(vim.env.HOME, "~")
        end,
      })
    end

    -- sa, sd, sr, sf, sh or sn + <surround char>
    if e.mini_surround then require("mini.surround").setup() end

    -- highlight trailing whitespace
    if e.mini_trailspace then require("mini.trailspace").setup() end

    -- picker
    if e.mini_pick then
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
          if is_not_main_view then return scroll_fun(win_id) end
        end
      end

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
      })
    end

    -- extra stuff
    if e.mini_extra then require("mini.extra").setup() end

    -- diff signs and keymaps([h,]h) to traverse diff hunks
    if e.mini_diff then
      require("mini.diff").setup({ view = { style = "sign", signs = { add = "+", change = "~", delete = "-" } } })
    end

    -- highlight patterns
    if e.mini_hipatterns then
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
      })
    end

    -- highlight word under cursor
    if e.mini_cursorword then require("mini.cursorword").setup() end

    -- minimal ascii icons
    if e.mini_icons then
      require("mini.icons").setup({ style = "ascii" })
      MiniIcons.mock_nvim_web_devicons()
    end

    if e.mini_clue then
      local miniclue = require("mini.clue")
      miniclue.setup({
        window = {
          config = {
            width = "auto",
          },
          delay = 100,
        },

        triggers = {
          -- Leader triggers
          { mode = "n", keys = "<leader>" },
          { mode = "x", keys = "<leader>" },

          -- Built-in completion
          { mode = "i", keys = "<C-x>" },

          -- `g` key
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },

          -- Marks
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "`" },

          -- Registers
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          { mode = "i", keys = "<C-r>" },
          { mode = "c", keys = "<C-r>" },

          -- Window commands
          { mode = "n", keys = "<C-w>" },

          -- `z` key
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },

          { mode = "n", keys = "[" },
          { mode = "n", keys = "]" },
        },

        clues = {
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.z(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows({
            submode_move = true,
            submode_navigate = true,
            submode_resize = true,
          }),

          -- bracketed improved
          { mode = "n", keys = "]b", postkeys = "]" },
          { mode = "n", keys = "[b", postkeys = "[" },
          { mode = "n", keys = "]w", postkeys = "]" },
          { mode = "n", keys = "[w", postkeys = "[" },
          { mode = "n", keys = "]f", postkeys = "]" },
          { mode = "n", keys = "[f", postkeys = "[" },
          { mode = "n", keys = "]h", postkeys = "]" },
          { mode = "n", keys = "[h", postkeys = "[" },
        },
      })
    end
  end,
}
