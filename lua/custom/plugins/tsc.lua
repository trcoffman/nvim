return {
  'dmmulroy/tsc.nvim',
  lazy = false,
  config = function()
    require('tsc').setup {
      save_on_toggle = true,
      sync_on_ui_close = true,
    }
  end,
}
