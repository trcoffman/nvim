return {
  -- fork of 3rd/diagram.nvim
  'trcoffman/diagram.nvim',
  dependencies = {
    -- fork of 3rd/image.nvim
    'trcoffman/image.nvim',
  },
  opts = {
    -- Disable automatic rendering for manual-only workflow
    events = {
      render_buffer = {}, -- Empty = no automatic rendering
      clear_buffer = { 'BufLeave' },
    },
    renderer_options = {
      mermaid = {
        scale = 5,
      },
    },
  },
  keys = {
    {
      'K', -- or any key you prefer
      function()
        require('diagram').show_diagram_hover()
      end,
      mode = 'n',
      ft = { 'markdown', 'norg' }, -- Only in these filetypes
      desc = 'Show diagram in new tab',
    },
  },
}

