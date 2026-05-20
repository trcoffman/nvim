---@type LazySpec
return {
  -- fork of aaronik/treewalker.nvim
  'trcoffman/treewalker.nvim',
  dependencies = {
    -- fork of folke/which-key.nvim
    'trcoffman/which-key.nvim',
    -- fork of nvimtools/hydra.nvim
    'trcoffman/hydra.nvim',
  },
  lazy = false,
  config = function()
    require('treewalker').setup {
      -- highlight = true,
      -- highlight_duration = 250,
      -- highlight_group = 'CursorLine',
    }
    require 'hydra' {
      name = 'Treewalker',
      mode = { 'n', 'v' },
      config = {
        color = 'pink',
      },
      body = '<leader>tw',
      heads = {
        { 'j', '<cmd>Treewalker Down<cr>' },
        { 'k', '<cmd>Treewalker Up<cr>' },
        { 'h', '<cmd>Treewalker Left<cr>' },
        { 'l', '<cmd>Treewalker Right<cr>' },
        { 'J', '<cmd>Treewalker SwapDown<cr>' },
        { 'K', '<cmd>Treewalker SwapUp<cr>' },
        { 'H', '<cmd>Treewalker SwapLeft<cr>' },
        { 'L', '<cmd>Treewalker SwapRight<cr>' },
      },
    }
  end,
}
