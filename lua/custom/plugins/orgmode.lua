return {
  'nvim-orgmode/orgmode',
  lazy = true,
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup {
      org_agenda_files = '~/org/**/*',
      org_default_notes_file = '~/org/refile.org',
    }
  end,
}
