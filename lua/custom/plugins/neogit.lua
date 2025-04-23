return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    'ibhagwan/fzf-lua',
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
