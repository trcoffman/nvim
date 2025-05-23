return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    scroll = {
      enabled = false,
      animate = {
        easing = 'inOutQuad',
      },
    },
    bigfile = { enabled = true },
    picker = {
      enabled = true,
      layout = {
        preset = 'vertical',
        layout = {
          width = 0.8,
        },
      },
      matcher = {
        frecency = true,
      },
      formatters = {
        file = {
          truncate = 100,
        },
      },
      sources = {
        files = {
          exclude = { '.jj' },
        },
        explorer = {
          layout = 'sidebar',
        },
      },
    },
    notifier = {},
  },
  keys = {
    {
      '<leader>ts',
      function()
        if require('snacks').scroll.enabled then
          require('snacks').scroll.disable()
        else
          require('snacks').scroll.enable()
        end
      end,
      'Toggle [S]croll animations',
    },
    {
      '<leader>sf',
      function()
        Snacks.picker.files { hidden = true }
      end,
      'Search [F]iles',
    },
    {
      '<leader>sF',
      function()
        Snacks.picker.git_files()
      end,
      'Search Git [F]iles',
    },
    {
      '<leader>sc',
      function()
        Snacks.picker.commands()
      end,
      desc = '[S]earch [C]ommands',
    },
    {
      '<leader>sh',
      function()
        Snacks.picker.help()
      end,
      desc = '[S]earch [H]elp',
    },
    {
      '<leader>sk',
      function()
        Snacks.picker.keymaps()
      end,
      desc = '[S]earch [K]eymaps',
    },
    {
      '<leader>sS',
      function()
        Snacks.picker()
      end,
      desc = '[S]earch [S]elect Snacks',
    },
    {
      '<leader>ss',
      function()
        Snacks.picker.smart {
          matcher = {
            frecency = true,
          },
        }
      end,
      desc = '[S]earch [S]elect Snacks',
    },
    {
      '<leader>sw',
      function()
        Snacks.picker.grep_word()
      end,
      desc = '[S]earch current [W]ord',
    },
    {
      '<leader>sg',
      function()
        Snacks.picker.grep()
      end,
      desc = '[S]earch by [G]rep',
    },
    {
      '<leader>sd',
      function()
        Snacks.picker.diagnostics()
      end,
      desc = '[S]earch [D]iagnostics',
    },
    {
      '<leader>sr',
      function()
        Snacks.picker.resume()
      end,
      desc = '[S]earch [R]esume',
    },
    {
      '<leader>s.',
      function()
        Snacks.picker.recent()
      end,
      desc = '[S]earch Recent Files',
    },
    {
      '<leader><leader>',
      function()
        Snacks.picker.buffers()
      end,
      desc = '[ ] Find existing buffers',
    },
    {
      '\\',
      function()
        Snacks.explorer.reveal()
      end,
      desc = 'Reveal current file in [E]xplorer',
    },
    {
      '<leader>gsl',
      function()
        require('snacks').gitbrowse.open()
      end,
    },
  },
}
