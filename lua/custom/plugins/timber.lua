---@type LazySpec
return {
  'Goose97/timber.nvim',
  version = '*', -- Use for stability; omit to use `main` branch for the latest features
  event = 'VeryLazy',
  config = function()
    local jsTemplate = [[console.log('%watcher_marker_start %filename:%line_number ', '%log_target', %log_target, '%watcher_marker_end');]]
    local jsBatch = [[console.log('%watcher_marker_start %filename:%line_number ', { %repeat<%log_target><, > }, '%watcher_marker_end');]]
    require('timber').setup {
      log_templates = {
        default = {
          javscript = jsTemplate,
          typescript = jsTemplate,
          jsx = jsTemplate,
          tsx = jsTemplate,
        },
      },
      batch_log_templates = {
        default = {
          javascript = jsBatch,
          typescript = jsBatch,
          jsx = jsBatch,
          tsx = jsBatch,
        },
      },
      log_watcher = {
        enabled = true,
        sources = {
          javascript_log = {
            type = 'filesystem',
            name = 'Log File',
            path = '/tmp/timber.log',
            buffer = {
              syntax = 'javascript',
            },
          },
        },
      },
    }
  end,
  keys = {
    {
      '<leader>lf',
      function()
        require('timber.buffers').open_float()
      end,
      desc = 'Open Timber Float',
    },
    {
      '<leader>ls',
      function()
        require('timber.summary').open()
      end,
      desc = 'Open Timber Float',
    },
  },
}
