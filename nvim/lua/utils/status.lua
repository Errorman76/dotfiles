local M = {}

--- Get lsp servers
function M.get_attached_clients()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.buf_get_clients(bufnr)
	if next(clients) == nil then
		return ""
	end

	local clients_list = {}
	for _, client in pairs(clients) do
		table.insert(clients_list, client.name)
	end

	return "\u{eaf2} " .. table.concat(clients_list, "|")
end

--- Get formatters
function M.get_attached_formatters()
	local status, conform = pcall(require, "conform")
	if not status then
		return "Conform not installed"
	end

	local bufnr = vim.api.nvim_get_current_buf()
	local formatters = conform.list_formatters(bufnr)

	if #formatters > 0 then
		local formatter_names = {}

		for _, formatter in ipairs(formatters) do
			table.insert(formatter_names, formatter.name)
		end

		return "\u{eab2} " .. table.concat(formatter_names, "|")
	end

	return ""
end

--- Get linters
function M.get_attached_linters()
	local linters = require("lint").get_running()
	if #linters == 0 then
		return ""
	end
	return "󱉶 " .. table.concat(linters, ", ")
end

return M
