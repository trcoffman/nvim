return {
  -- fork of dmmulroy/ts-error-translator.nvim
  'trcoffman/ts-error-translator.nvim',
  config = function()
    require('ts-error-translator').setup()
  end,
}
