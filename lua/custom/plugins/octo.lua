return {
  -- fork of pwntester/octo.nvim
  'trcoffman/octo.nvim',
  dependencies = {
    -- fork of nvim-lua/plenary.nvim
    'trcoffman/plenary.nvim',
    -- fork of folke/snacks.nvim
    'trcoffman/snacks.nvim',
    -- fork of nvim-tree/nvim-web-devicons
    'trcoffman/nvim-web-devicons',
  },
  lazy = false,
  config = function()
    require('octo').setup {
      picker = 'snacks',
    }
  end,
}
