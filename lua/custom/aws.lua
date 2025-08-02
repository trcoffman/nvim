aws_load_env = function(aws_json)
  -- deserialize aws json
  local data = vim.fn.json_decode(aws_json)
  -- for each property in data, vim.env.property = that value
  for key, value in pairs(data) do
    vim.env[key] = value
  end
end
