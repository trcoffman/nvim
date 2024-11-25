return {
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
}
