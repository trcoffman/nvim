---@type LazySpec
return {
  -- fork of nvim-treesitter/nvim-treesitter-textobjects
  'trcoffman/nvim-treesitter-textobjects',
  dependencies = {
    -- fork of nvim-treesitter/nvim-treesitter
    'trcoffman/nvim-treesitter',
  },
  lazy = false,
  config = function()
    require('nvim-treesitter-textobjects').setup {
      select = { enable = true },
      move = { set_jumps = true },
    }

    local select = require 'nvim-treesitter-textobjects.select'
    local move = require 'nvim-treesitter-textobjects.move'

    vim.keymap.set({ 'x', 'o' }, 'af', function() select.select_textobject('@function.outer', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'if', function() select.select_textobject('@function.inner', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'ac', function() select.select_textobject('@call.outer', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'ic', function() select.select_textobject('@call.outer', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'as', function() select.select_textobject('@statement.outer', 'textobjects') end)

    vim.keymap.set({ 'n', 'x', 'o' }, ']m', function() move.goto_next_start('@function.outer', 'textobjects') end)
    vim.keymap.set({ 'n', 'x', 'o' }, ']M', function() move.goto_next_end('@function.outer', 'textobjects') end)
    vim.keymap.set({ 'n', 'x', 'o' }, '[m', function() move.goto_previous_start('@function.outer', 'textobjects') end)
    vim.keymap.set({ 'n', 'x', 'o' }, '[M', function() move.goto_previous_end('@function.outer', 'textobjects') end)
  end,
}
