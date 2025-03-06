local function find_root(dir)
  local result = vim.system({ 'git', 'rev-parse', '--show-toplevel' }, { cwd = dir }):wait()
  if result.code ~= 0 then
    return nil, 'Command failed with error: ' .. result.code
  end
  return result.stdout:gsub('%s+$', '')
end

local function find_jest_config(start_path)
  local current_dir = vim.fn.fnamemodify(start_path, ':h')
  local root = find_root(current_dir)
  local possible_configs = { 'jest.config.js', 'jest.config.ts' }

  -- Keep going up until we hit root
  while current_dir ~= root do
    -- Check for both config file types
    for _, config_name in ipairs(possible_configs) do
      local config_path = current_dir .. '/' .. config_name
      if vim.fn.filereadable(config_path) == 1 then
        return config_path
      end
    end

    -- Move up one directory
    current_dir = vim.fn.fnamemodify(current_dir, ':h')
  end

  -- Check root directory as final attempt
  for _, config_name in ipairs(possible_configs) do
    local config_path = current_dir .. '/' .. config_name
    if vim.fn.filereadable(config_path) == 1 then
      return config_path
    end
  end

  return nil
end

local function cd_to_package_json_dir()
  local packageJsonDir = vim.fs.root(vim.fn.expand '%', { 'package.json' })
  if packageJsonDir == nil then
    error 'Not in a node project, package.json not found'
    return nil, 'No package.json found'
  end
  vim.cmd(string.format(
    [[
    tab split
    tchdir %s
  ]],
    packageJsonDir
  ))
end

return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/neotest-jest',
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    {
      '<leader>ctl',
      function()
        require('neotest').run.run_last()
      end,
      desc = 'Run Last Test',
    },
    {
      '<leader>ctd',
      function()
        require('neotest').run.run { strategy = 'dap' }
      end,
      desc = 'Debug Nearest Test',
    },
    {
      '<leader>ctL',
      function()
        require('neotest').run.run_last { strategy = 'dap' }
      end,
      desc = 'Debug Last Test',
    },
    {
      '<leader>ctw',
      "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
      desc = 'Run Watch',
    },
    {
      '<leader>ctr',
      "<cmd>lua require('neotest').run.run()<cr>",
      desc = 'Run nearest test',
    },
    {
      '<leader>ctf',
      function()
        require('neotest').run.run(vim.fn.expand '%')
      end,
      desc = 'Run file tests',
    },
    {
      '<leader>ctt',
      cd_to_package_json_dir,
      desc = 'cwd to proper directory to run tests',
    },
  },
  opts = function()
    return {
      adapters = {
        require 'neotest-jest' {
          jestCommand = 'yarn test',
          jestConfigFile = find_jest_config,
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        },
      },
    }
  end,
}
