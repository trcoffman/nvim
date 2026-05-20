return {
  -- fork of julienvincent/hunk.nvim
  'trcoffman/hunk.nvim',
  dependencies = {
    -- fork of MunifTanjim/nui.nvim
    'trcoffman/nui.nvim',
  },
  cmd = { 'DiffEditor' },
  config = function()
    require('hunk').setup()
  end,
}
