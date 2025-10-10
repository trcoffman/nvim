return {
  'olimorris/codecompanion.nvim',
  enabled = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    -- The following are optional:
    { 'MeanderingProgrammer/render-markdown.nvim', ft = { 'markdown', 'codecompanion' } },
  },
  opts = {
    display = {
      diff = {
        enabled = true,
        close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
        layout = 'vertical', -- vertical|horizontal split for default provider
        opts = { 'internal', 'filler', 'closeoff', 'algorithm:patience', 'followwrap', 'linematch:120' },
        provider = 'mini_diff', -- default|mini_diff
      },
    },
    strategies = {
      chat = {
        adapter = 'copilot',
        slash_commands = {
          ['file'] = {
            callback = 'strategies.chat.slash_commands.file',
            description = 'Select a file',
            opts = {
              provider = 'fzf_lua', -- Other options include 'default', 'mini_pick', 'fzf_lua'
              contains_code = true,
            },
          },
          ['buffer'] = {
            callback = 'strategies.chat.slash_commands.buffer',
            description = 'Select a buffer',
            opts = {
              provider = 'fzf_lua', -- Other options include 'default', 'mini_pick', 'fzf_lua'
              contains_code = true,
            },
          },
        },
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
              -- default = 'gpt-4o-2024-08-06',
              default = 'claude-3.5-sonnet',
            },
            max_tokens = {
              -- default = 8192,
              default = 148000,
            },
          },
        })
      end,
    },
  },
}
