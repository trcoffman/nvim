return {
  -- fork of norcalli/nvim-colorizer.lua
  'trcoffman/nvim-colorizer.lua',
  lazy = false,
  config = function()
    require('colorizer').setup()
  end,
}
