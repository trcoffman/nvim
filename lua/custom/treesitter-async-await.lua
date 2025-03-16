local function find_node_ancestor(types, node)
  if not node then
    return nil
  end
  if vim.tbl_contains(types, node:type()) then
    return node
  end

  local parent = node:parent()

  return find_node_ancestor(types, parent)
end

local function add_async()
  vim.api.nvim_feedkeys('t', 'n', true)

  local text_before_cursor = vim.fn.getline('.'):sub(vim.fn.col '.' - 4, vim.fn.col '.' - 1)
  if text_before_cursor ~= 'awai' then
    return
  end

  local current_node = vim.treesitter.get_node()
  local function_node = find_node_ancestor({ 'function_declaration', 'arrow_function' }, current_node)
  if not function_node then
    return
  end
  local function_node_text = vim.treesitter.get_node_text(function_node, 0)
  if vim.startswith(function_node_text, 'async ') then
    return
  end

  local start_row, start_col = function_node:start()
  vim.api.nvim_buf_set_text(0, start_row, start_col, start_row, start_col, { 'async ' })
end

vim.keymap.set('i', 't', add_async, { buffer = true })
