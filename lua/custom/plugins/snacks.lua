return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    scroll = {
      enabled = false,
      animate = {
        easing = 'inOutQuad',
      },
    },
  },
  keys = {
    {
      '<leader>ts',
      function()
        if require('snacks').scroll.enabled then
          require('snacks').scroll.disable()
        else
          require('snacks').scroll.enable()
        end
      end,
      'Toggle [S]croll animations',
    },
  },
}
