return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    -- The following are optional:
    { 'MeanderingProgrammer/render-markdown.nvim', ft = { 'markdown', 'codecompanion' } },
  },
  opts = {
    strategies = {
      chat = {
        adapter = 'copilot',
      },
      inline = {
        adapter = 'copilot',
      },
    },
    adapters = {
      copilot = function()
        return require('codecompanion.adapters').extend('copilot', {
          schema = {
            model = {
              default = 'gpt-4o-2024-08-06',
              -- default = 'claude-3.5-sonnet', TODO: Get copilot admins to enable Claude.
            },
            max_tokens = {
              default = 8192,
            },
          },
        })
      end,
    },
  },
}
