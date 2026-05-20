return {
  -- fork of gruvw/strudel.nvim
  'trcoffman/strudel.nvim',
  build = 'npm ci',
  config = function()
    require('strudel').setup()
  end,
}
