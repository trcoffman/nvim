return {
  -- fork of stevearc/oil.nvim
  'trcoffman/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  -- fork of echasnovski/mini.icons
  dependencies = { { 'trcoffman/mini.icons', opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  --
  config = function()
    require('oil').setup()
    vim.keymap.set('n', '<Leader>ff', ':Oil<CR>', { desc = 'Open oil file manager' })
  end,
}
