return {
  'zbirenbaum/copilot.lua',
  dependencies = {
    'copilotlsp-nvim/copilot-lsp', -- (optional) for NES functionality
  },
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      panel = { enabled = false },
      suggestion = {
        auto_trigger = true,
      },
      nes = {
        enabled = false,
        auto_trigger = true,
        keymap = {
          accept_and_goto = '<leader>p',
          accept = '<M-o>',
          dismiss = '<Esc>',
        },
      },
    }
  end,
}
