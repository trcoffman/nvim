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
        map('n', '<leader>ghs', gitsigns.stage_hunk, { desc = '[s]tage hunk' })
        map('n', '<leader>ghr', gitsigns.reset_hunk, { desc = '[r]eset hunk' })
        map('v', '<leader>ghs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[s]tage hunk' })
        map('v', '<leader>ghr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[r]eset hunk' })
        map('n', '<leader>ghS', gitsigns.stage_buffer, { desc = '[S]tage buffer' })
        map('n', '<leader>ghu', gitsigns.undo_stage_hunk, { desc = '[u]ndo stage hunk' })
        map('n', '<leader>ghR', gitsigns.reset_buffer, { desc = '[R]eset buffer' })
        map('n', '<leader>ghp', gitsigns.preview_hunk, { desc = '[p]review hunk' })
        map('n', '<leader>ghb', function()
          gitsigns.blame_line { full = true }
        end, { desc = '[b]lame line' })
        map('n', '<leader>gb', function()
          gitsigns.blame()
        end, { desc = '[b]lame' })
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'toggle [b]lame' })
        map('n', '<leader>ghd', gitsigns.diffthis, { desc = '[d]iff' })
        map('n', '<leader>ghD', function()
          gitsigns.diffthis '~'
        end, { desc = '[D]iff against ~' })
        map('n', '<leader>td', gitsigns.toggle_deleted, { desc = 'toggle deleted' })
        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end,
    }
  end,
}
