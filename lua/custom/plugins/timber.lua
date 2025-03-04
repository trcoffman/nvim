---@type LazySpec
return {
  'Goose97/timber.nvim',
  version = '*', -- Use for stability; omit to use `main` branch for the latest features
  event = 'VeryLazy',
  config = function()
    local jsTemplate = [[console.log('>>>>> %filename:%line_number ', '%log_target', %log_target);]]
    local jsBatch = [[console.log('>>>>> %filename:%line_number ', { %repeat<%log_target><, > });]]
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
    }
  end,
}
