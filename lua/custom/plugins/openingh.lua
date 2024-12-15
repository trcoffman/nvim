return {
  'Almo7aya/openingh.nvim',
  lazy = false,
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>gl', '<cmd>OpenInGHFileLines<CR>', { noremap = true, silent = true, desc = 'Open lines in GitHub' })
    vim.api.nvim_set_keymap('n', '<leader>gf', '<cmd>OpenInGHFile<CR>', { noremap = true, silent = true, desc = 'Open file in GitHub' })
    vim.api.nvim_set_keymap('n', '<leader>gr', '<cmd>OpenInGHRepo<CR>', { noremap = true, silent = true, desc = 'Open repo in GitHub' })
  end,
}
