-- fork of NicolasGB/jj.nvim (audited at 64605c8)
return {
  'trcoffman/jj.nvim',
  dependencies = {
    -- fork of folke/snacks.nvim
    'trcoffman/snacks.nvim', -- optional - pickers
    -- fork of sindrets/diffview.nvim
    'trcoffman/diffview.nvim', -- optional - diff backend
  },
  config = function()
    require('jj').setup {}
  end,
}
