return { -- Collection of various small independent plugins/modules
  -- fork of echasnovski/mini.nvim
  'trcoffman/mini.nvim',
  version = false,
  -- fork of mawkler/jsx-element.nvim
  dependencies = { 'trcoffman/jsx-element.nvim' },
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - gsaiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - gsd'   - [S]urround [D]elete [']quotes
    -- - gsr)'  - [S]urround [R]eplace [)] [']
    -- - gsaitt - [S]urround [A]dd [I]nside [T]ag with JSX [T]ag
    local surround = require 'mini.surround'
    local ts_input = surround.gen_spec.input.treesitter
    surround.setup {
      -- Increase search lines for JSX elements
      n_lines = 100,
      mappings = {
        add = 'gsa', -- Add surrounding in Normal and Visual modes
        delete = 'gsd', -- Delete surrounding
        find = 'gsf', -- Find surrounding (to the right)
        find_left = 'gsF', -- Find surrounding (to the left)
        highlight = 'gsh', -- Highlight surrounding
        replace = 'gsr', -- Replace surrounding

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },
      custom_surroundings = {
        -- JSX tag surrounding using treesitter
        -- Works with: <Button>content</Button>, <div>text</div>, etc.
        -- Usage: gsdt (delete tag), gsrt (replace tag), gsaiwt (add tag)
        t = {
          input = function()
            -- Get current node and find parent jsx_element
            local node = vim.treesitter.get_node()
            if not node then
              return nil
            end

            -- Walk up the tree to find jsx_element or jsx_self_closing_element
            while node do
              local node_type = node:type()
              if node_type == 'jsx_element' or node_type == 'jsx_self_closing_element' then
                break
              end
              node = node:parent()
            end

            if not node then
              return nil
            end

            -- For jsx_element, find the opening and closing tags
            if node:type() == 'jsx_element' then
              local opening = node:child(0) -- jsx_opening_element
              local closing = node:child(node:child_count() - 1) -- jsx_closing_element

              if not opening or not closing then
                return nil
              end

              local open_start_row, open_start_col, open_end_row, open_end_col = opening:range()
              local close_start_row, close_start_col, close_end_row, close_end_col = closing:range()

              return {
                left = {
                  from = { line = open_start_row + 1, col = open_start_col + 1 },
                  to = { line = open_end_row + 1, col = open_end_col },
                },
                right = {
                  from = { line = close_start_row + 1, col = close_start_col + 1 },
                  to = { line = close_end_row + 1, col = close_end_col },
                },
              }
            else
              -- Self-closing element - no surrounding to delete
              return nil
            end
          end,
          output = function()
            local tag = surround.user_input 'Tag name'
            if not tag then
              return nil
            end
            return {
              left = '<' .. tag .. '>',
              right = '</' .. tag .. '>',
            }
          end,
        },
      },
    }

    require('mini.diff').setup()

    -- -- Simple and easy statusline.
    -- --  You could remove this setup call if you don't like it,
    -- --  and try some other statusline plugin
    -- local statusline = require 'mini.statusline'
    -- -- set use_icons to true if you have a Nerd Font
    -- statusline.setup { use_icons = vim.g.have_nerd_font }

    -- -- You can configure sections in the statusline by overriding their
    -- -- default behavior. For example, here we set the section for
    -- -- cursor location to LINE:COLUMN
    -- ---@diagnostic disable-next-line: duplicate-set-field
    -- statusline.section_location = function()
    --   return '%2l:%-2v'
    -- end

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
