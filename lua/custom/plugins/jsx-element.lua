---@type LazySpec
return {
  -- fork of mawkler/jsx-element.nvim
  'trcoffman/jsx-element.nvim',
  dependencies = {
    -- fork of nvim-treesitter/nvim-treesitter
    'trcoffman/nvim-treesitter',
    -- fork of nvim-treesitter/nvim-treesitter-textobjects
    'trcoffman/nvim-treesitter-textobjects',
  },
  ft = { 'typescriptreact', 'javascriptreact', 'javascript' },
  opts = {},
}
