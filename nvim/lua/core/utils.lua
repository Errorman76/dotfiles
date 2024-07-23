local M = {}

-- get lsp servers
function M.get_attached_clients()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.buf_get_clients(bufnr)
  if next(clients) == nil then
    return ''
  end

  local clients_list = {}
  for _, client in pairs(clients) do
    table.insert(clients_list, client.name)
  end

  return '\u{eaf2} ' .. table.concat(clients_list, "|")
end

-- get formatters
function M.get_attached_formatters()
  -- Check if 'conform' is available
  local status, conform = pcall(require, 'conform')
  if not status then
    return 'Conform not installed'
  end

  local lsp_format = require('conform.lsp_format')

  -- Get formatters for the current buffer
  local formatters = conform.list_formatters_for_buffer()
  if formatters and #formatters > 0 then
    local formatterNames = {}

    for _, formatter in ipairs(formatters) do
      table.insert(formatterNames, formatter.name or formatter)
    end

    return '\u{eab2} ' .. table.concat(formatterNames, ' ')
  end

  -- Check if there's an LSP formatter
  local bufnr = vim.api.nvim_get_current_buf()
  local lsp_clients = lsp_format.get_format_clients({ bufnr = bufnr })

  if not vim.tbl_isempty(lsp_clients) then
    local lsp_names = {}
    for _, client in pairs(lsp_clients) do
      table.insert(lsp_names, client.name)
    end
    return '\u{eab2} ' .. table.concat(lsp_names, ' ')
  end

  return ''
end

return M
