return {
  -- fork of NeogitOrg/neogit
  'trcoffman/neogit',
  dependencies = {
    -- fork of nvim-lua/plenary.nvim
    'trcoffman/plenary.nvim', -- required
    -- fork of sindrets/diffview.nvim
    'trcoffman/diffview.nvim', -- optional - Diff integration

    -- fork of ibhagwan/fzf-lua
    'trcoffman/fzf-lua',
  },
  --@module 'neogit'
  --@type neogit.SetupOpts
  opts = {
    graph_style = 'kitty',
    integration = {
      diffview = true, -- integrate with diffview
      fzf_lua = true,
    },
  },
  keys = {
    {
      '<leader>gs',
      '<cmd>Neogit<cr>',
      desc = 'Neogit Status',
    },
  },
  config = true,
}
