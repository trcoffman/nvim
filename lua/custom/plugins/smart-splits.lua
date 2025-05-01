return {
  'mrjones2014/smart-splits.nvim',
  build = './kitty/install-kittens.bash',
  lazy = false,
  keys = {
    {
      '<C-h>',
      function()
        require('smart-splits').move_cursor_left()
      end,
      mode = { 'i', 'n', 'v' },
      desc = 'Move to left window',
    },
    {
      '<C-j>',
      function()
        require('smart-splits').move_cursor_down()
      end,
      mode = { 'i', 'n', 'v' },
      desc = 'Move to bottom window',
    },
    {
      '<C-k>',
      function()
        require('smart-splits').move_cursor_up()
      end,
      mode = { 'i', 'n', 'v' },
      desc = 'Move to top window',
    },
    {
      '<C-l>',
      function()
        require('smart-splits').move_cursor_right()
      end,
      mode = { 'i', 'n', 'v' },
      desc = 'Move to right window',
    },
    -- Terminal mode mappings
    {
      '<C-h>',
      '<C-\\><C-N><CMD>lua require("smart-splits").move_cursor_left()<CR>',
      mode = 't',
      desc = 'Move to left window from terminal',
    },
    {
      '<C-j>',
      '<C-\\><C-N><CMD>lua require("smart-splits").move_cursor_down()<CR>',
      mode = 't',
      desc = 'Move to bottom window from terminal',
    },
    {
      '<C-k>',
      '<C-\\><C-N><CMD>lua require("smart-splits").move_cursor_up()<CR>',
      mode = 't',
      desc = 'Move to top window from terminal',
    },
    {
      '<C-l>',
      '<C-\\><C-N><CMD>lua require("smart-splits").move_cursor_right()<CR>',
      mode = 't',
      desc = 'Move to right window from terminal',
    },
    -- Additional escape mapping for terminal
    {
      '<esc>',
      '<C-\\><C-N>',
      mode = 't',
      desc = 'Exit terminal mode',
    },
  },
}
