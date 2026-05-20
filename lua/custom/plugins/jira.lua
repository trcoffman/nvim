return {
  -- fork of kid-icarus/jira.nvim
  'trcoffman/jira.nvim',
  lazy = true,
  dependencies = {
    -- fork of nvim-lua/plenary.nvim
    'trcoffman/plenary.nvim',
    -- fork of folke/snacks.nvim
    'trcoffman/snacks.nvim', -- optional
  },
  keys = {
    { '<leader>jv', '<cmd>Jira issue view<cr>', desc = 'View Jira issue' },
    { '<leader>jc', '<cmd>Jira issue create<cr>', desc = 'Create Jira issue' },
    {
      '<leader>jt',
      function()
        require('jira.pickers.snacks').transitions()
      end,
      desc = 'Jira transitions',
    },
  },
  config = function()
    require('jira').setup {
      jira_api = {
        domain = vim.env.JIRA_DOMAIN,
        username = vim.env.JIRA_USER,
        token = vim.env.JIRA_API_TOKEN,
      },
    }
  end,
  commands = {
    'Jira',
  },
}
