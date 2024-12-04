return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/neotest-jest',
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    {
      '<leader>ctl',
      function()
        require('neotest').run.run_last()
      end,
      desc = 'Run Last Test',
    },
    {
      '<leader>ctL',
      function()
        require('neotest').run.run_last { strategy = 'dap' }
      end,
      desc = 'Debug Last Test',
    },
    {
      '<leader>ctw',
      "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
      desc = 'Run Watch',
    },
    {
      '<leader>ctr',
      "<cmd>lua require('neotest').run.run()<cr>",
      desc = 'Run nearest test',
    },
    {
      '<leader>ctf',
      function()
        require('neotest').run.run(vim.fn.expand '%')
      end,
      desc = 'Run file tests',
    },
  },
  opts = function()
    return {
      adapters = {
        require 'neotest-jest' {
          jestCommand = 'yarn test',
          jestConfigFile = 'jest.config.js',
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        },
      },
    }
  end,
}
