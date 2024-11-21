-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    -- Do i actually need this?
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      'nvim-telescope/telescope.nvim',
    },
    opts = {
      graph_style = 'kitty',
    },
    keys = {
      {
        '<leader>gs',
        '<cmd>Neogit<cr>',
        desc = 'Neogit Status',
      },
    },
    config = true,
  },
  {
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
  },
  {
    'github/copilot.vim',
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
  {
    'tpope/vim-eunuch',
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('harpoon'):setup()
    end,
    keys = function()
      -- basic telescope configuration
      local conf = require('telescope.config').values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end
      return {
        {
          '<leader>a',
          function()
            toggle_telescope(require('harpoon'):list())
          end,
          desc = 'Harpoon menu',
        },
      }
    end,
  },
}
