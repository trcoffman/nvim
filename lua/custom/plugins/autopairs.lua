-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  -- fork of windwp/nvim-autopairs
  'trcoffman/nvim-autopairs',
  event = 'InsertEnter',
  -- Optional dependency
  -- fork of hrsh7th/nvim-cmp
  dependencies = { 'trcoffman/nvim-cmp' },
  config = function()
    require('nvim-autopairs').setup {}
    -- If you want to automatically add `(` after selecting a function or method
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
  keys = {
    {
      '<leader>ta',
      function()
        require('nvim-autopairs').toggle()
      end,
      desc = 'Toggle autopairs',
    },
  },
}
