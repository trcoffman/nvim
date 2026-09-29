return {
  -- fork of microsoft/codetour (the Neovim plugin lives alongside the VS Code extension)
  'trcoffman/codetour',
  dependencies = {
    -- fork of MeanderingProgrammer/render-markdown.nvim
    'trcoffman/render-markdown.nvim',
  },
  -- Load at startup so tour markers and the "take a tour?" prompt work.
  event = 'VeryLazy',
  cmd = 'CodeTour',
  opts = {},
  config = function(_, opts)
    require('codetour').setup(opts)
    require('which-key').add {
      { '<leader>cT', group = 'CodeTour', mode = { 'n', 'x' } },
    }
  end,
  keys = {
    -- Taking tours
    { '<leader>cTs', '<cmd>CodeTour start<cr>', desc = 'Start tour' },
    { '<leader>cTt', '<cmd>CodeTour tree<cr>', desc = 'Toggle tour tree' },
    { '<leader>cTn', '<cmd>CodeTour next<cr>', desc = 'Next step' },
    { '<leader>cTp', '<cmd>CodeTour prev<cr>', desc = 'Previous step' },
    { '<leader>cTr', '<cmd>CodeTour resume<cr>', desc = 'Resume tour (show current step)' },
    { '<leader>cTx', '<cmd>CodeTour end<cr>', desc = 'End tour' },
    { '<leader>cTl', '<cmd>CodeTour links<cr>', desc = 'Pick a link in the current step' },
    { '<leader>cTm', '<cmd>CodeTour start_at_marker<cr>', desc = 'Start tour at marker on this line' },
    { '<leader>cTM', '<cmd>CodeTour toggle_markers<cr>', desc = 'Toggle tour markers' },
    { '<leader>cTo', '<cmd>CodeTour open_file<cr>', desc = 'Open tour file' },

    -- Recording and editing tours
    { '<leader>cTR', '<cmd>CodeTour record<cr>', desc = 'Record new tour' },
    { '<leader>cTe', '<cmd>CodeTour edit<cr>', desc = 'Edit tour' },
    { '<leader>cTa', '<cmd>CodeTour add_step<cr>', desc = 'Add step for this line' },
    { '<leader>cTa', ':CodeTour add_step<cr>', mode = 'x', silent = true, desc = 'Add step for selection' },
    { '<leader>cTc', '<cmd>CodeTour add_content_step<cr>', desc = 'Add content step' },
    { '<leader>cTd', '<cmd>CodeTour add_directory_step<cr>', desc = 'Add directory step' },
  },
}
