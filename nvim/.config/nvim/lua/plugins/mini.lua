return {
  "echasnovski/mini.nvim",
  lazy = false,
  version = false,
  config = function()
    local e = vim.g.dha.conf.enable

    -- enhanced textobjects. 'a(', 'a)', 'a'', 'a*' 'a ', 'an', 'al', 'g[' 'g]'
    if e.mini_ai then require("mini.ai").setup() end

    -- move using '[' or ']' + bcxdfijloqtuwy
    if e.mini_bracketed then require("mini.bracketed").setup({
      comment = { suffix = "", options = {} },
    }) end

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

      local choose_all = function()
        local mappings = MiniPick.get_picker_opts().mappings
        vim.api.nvim_input(mappings.mark_all .. mappings.choose_marked)
      end

      require("mini.pick").setup({
        mappings = {
          scroll_one_line_down = { char = "<C-y>", func = pick_scroll_one_line("down") },
          scroll_one_line_up = { char = "<C-e>", func = pick_scroll_one_line("up") },
          choose_all = { char = "<C-q>", func = choose_all },
        },
        source = {
          preview = function(buf_id, item)
            MiniPick.default_preview(buf_id, item, { line_position = "center" })
          end,
        },
      })

      vim.ui.select = MiniPick.ui_select
    end

    -- extra stuff
    if e.mini_extra then
      require("mini.extra").setup()
      vim.keymap.set("n", "z=", MiniExtra.pickers.spellsuggest, { desc = "Show spelling suggestions" })
    end

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
    if e.mini_cursorword then
      -- disable mini_cursorword when in visual mode
      vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "*:[vV\x16]",
        callback = function()
          vim.b.minicursorword_disable = true
        end,
      })

      vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "[vV\x16]:*",
        callback = function()
          vim.b.minicursorword_disable = false
        end,
      })
      require("mini.cursorword").setup()
    end

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

    if e.mini_completion then
      require("mini.completion").setup({})

      local imap_expr = function(lhs, rhs)
        vim.keymap.set("i", lhs, rhs, { expr = true })
      end
      imap_expr("<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
      imap_expr("<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

      local keycode = vim.keycode
        or function(x)
          return vim.api.nvim_replace_termcodes(x, true, true, true)
        end
      local keys = {
        ["cr"] = keycode("<CR>"),
        ["ctrl-y"] = keycode("<C-y>"),
        ["ctrl-y_cr"] = keycode("<C-y><CR>"),
      }

      _G.cr_action = function()
        if vim.fn.pumvisible() ~= 0 then
          -- If popup is visible, confirm selected item or add new line otherwise
          local item_selected = vim.fn.complete_info()["selected"] ~= -1
          return item_selected and keys["ctrl-y"] or keys["ctrl-y_cr"]
        else
          -- If popup is not visible, use plain `<CR>`. You might want to customize
          -- according to other plugins. For example, to use 'mini.pairs', replace
          -- next line with `return require('mini.pairs').cr()`
          return keys["cr"]
        end
      end

      vim.keymap.set("i", "<CR>", "v:lua._G.cr_action()", { expr = true })

      -- disable mini_completion in snacks
      vim.cmd([[au FileType snacks_picker_input lua vim.b.minicompletion_disable = true]])
    end

    if e.mini_snippets then
      require("mini.snippets").setup({
        snippets = {
          { prefix = "cdate", body = "$CURRENT_YEAR-$CURRENT_MONTH-$CURRENT_DATE", desc = "Date" },
          { prefix = "T", body = "TODO: ", desc = "TODO" },
          { prefix = "N", body = "NOTE: ", desc = "NOTE" },
          { prefix = "F", body = "FIXME: ", desc = "FIXME" },
          { prefix = "H", body = "HACK: ", desc = "HACK" },
          vim.g.dha.conf.snippets(),
        },
      })
      vim.keymap.set("i", "<C-g><C-j>", function()
        MiniSnippets.expand({ match = false })
      end, { desc = "Expand all" })

      -- stop session when moved to Normal mode
      local make_stop = function()
        local au_opts = { pattern = "*:n", once = true }
        au_opts.callback = function()
          while MiniSnippets.session.get() do
            MiniSnippets.session.stop()
          end
        end
        vim.api.nvim_create_autocmd("ModeChanged", au_opts)
      end
      local opts = { pattern = "MiniSnippetsSessionStart", callback = make_stop }
      vim.api.nvim_create_autocmd("User", opts)
    end

    if e.mini_cmdline then require("mini.cmdline").setup({
      autocomplete = { delay = 500 },
    }) end

    if e.mini_tabline then require("mini.tabline").setup() end

    if e.mini_statusline then
      local ALWAYS_TRUNC = 500
      local diff = function()
        local summary = vim.b.minidiff_summary
        if summary == nil then return "" end
        local t = {}
        if summary.add and summary.add > 0 then table.insert(t, "+" .. summary.add) end
        if summary.change and summary.change > 0 then table.insert(t, "~" .. summary.change) end
        if summary.delete and summary.delete > 0 then table.insert(t, "-" .. summary.delete) end
        return table.concat(t, " ")
      end

      local indent = function()
        local get_opt = vim.api.nvim_get_option_value
        if not get_opt("expandtab", {}) then return "T:" .. get_opt("tabstop", {}) end

        local size = get_opt("shiftwidth", {})
        if size == 0 then size = get_opt("tabstop", {}) end
        return "S:" .. size
      end

      local utils = require("utils")
      local fname = function()
        local modified = vim.bo.modified and " [+]" or ""
        local ro = vim.bo.readonly and " [-]" or ""
        local file = utils.get_rel_path(vim.fn.expand("%:p"))
        return file .. modified .. ro
      end

      require("mini.statusline").setup({
        content = {
          active = function()
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = ALWAYS_TRUNC })
            return MiniStatusline.combine_groups({
              { hl = mode_hl, strings = { mode } },
              { hl = "MiniStatuslineDevinfo", strings = { diff() } },
              "%<", -- Mark general truncate point
              { hl = "MiniStatuslineFilename", strings = { fname() } },
              "%=", -- End left alignment
              { hl = nil, strings = { vim.g.cscope_maps_statusline_indicator, indent() } },
              { hl = mode_hl, strings = { "%l:%v" } },
            })
          end,
          inactive = function()
            return MiniStatusline.combine_groups({ { hl = "MiniStatuslineInactive", strings = { fname() } } })
          end,
        },
      })
    end
    if e.mini_jump2d then
      require("mini.jump2d").setup({
        allowed_lines = {
          blank = false,
        },
        view = {
          dim = true,
          n_steps_ahead = 2,
        },
        mappings = {
          start_jumping = "",
        },
      })
      vim.keymap.set(
        { "o", "x", "n" },
        "\\",
        "<Cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.single_character)<CR>",
        { desc = "MiniJump2d" }
      )
    end
  end,
}
