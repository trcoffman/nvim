return {
  'lewis6991/gitsigns.nvim',
  event = 'BufReadPre',

  config = function()
    require('gitsigns').setup {
      auto_attach = true,
      attach_to_untracked = true,
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end)

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end)

        -- Actions
        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = '[s]tage hunk' })
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = '[r]eset hunk' })
        map('v', '<leader>hs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[s]tage hunk' })
        map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[r]eset hunk' })
        map('n', '<leader>hS', gitsigns.stage_buffer, { desc = '[S]tage buffer' })
        map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = '[u]ndo stage hunk' })
        map('n', '<leader>hR', gitsigns.reset_buffer, { desc = '[R]eset buffer' })
        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = '[p]review hunk' })
        map('n', '<leader>hb', function()
          gitsigns.blame_line { full = true }
        end, { desc = '[b]lame line' })
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'toggle [b]lame' })
        map('n', '<leader>hd', gitsigns.diffthis, { desc = '[d]iff' })
        map('n', '<leader>hD', function()
          gitsigns.diffthis '~'
        end, { desc = '[D]iff against ~' })
        map('n', '<leader>td', gitsigns.toggle_deleted, { desc = 'toggle deleted' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end,
    }
  end,
}
