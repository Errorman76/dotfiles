local utils_diff = require("utils.diff")

--- Map a key combination to a command
---@param modes string|string[]: The mode(s) to map the key combination to
---@param lhs string: The key combination to map
---@param rhs string|function: The command to run when the key combination is pressed
---@param opts table: Options to pass to the keymap
local map = function(modes, lhs, rhs, opts)
	local options = { silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	if type(modes) == "string" then
		modes = { modes }
	end
	for _, mode in ipairs(modes) do
		vim.keymap.set(mode, lhs, rhs, options)
	end
end

vim.g.mapleader = " "

map("i", "jk", "<ESC>", { desc = "exit insert mode" })

map("n", "<leader>nh", "<cmd>noh<CR>", { desc = "no highlight" })

map("n", "+", "<C-a>", { desc = "increase number" })
map("n", "-", "<C-x>", { desc = "decrease number" })

-- line
map("n", "<A-k>", ":<C-u>m-2<CR>==", { desc = "move up line" })
map("n", "<A-j>", ":<C-u>m+<CR>==", { desc = "move down line" })
map("v", "<A-k>", ":m-2<CR>gv=gv", { desc = "move up line" })
map("v", "<A-j>", ":m'>+<CR>gv=gv", { desc = "move down line" })

-- buffer
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "next buffere" })
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "previous buffer" })

map("n", "<Leader>w", "<cmd>w<CR>", { desc = "save" })
map("n", "<Leader>q", "<cmd>q<CR>", { desc = "quit" })
map("n", "<Leader>Q", "<cmd>q!<CR>", { desc = "forced quit" })

-- indent
map("n", "<", "<<", { desc = "unindent" })
map("n", ">", ">>", { desc = "indent" })
map("v", "<", "<gv", { desc = "nuindent" })
map("v", ">", ">gv", { desc = "indent" })

-- window
map("n", "<leader>\\", "<C-w>s", { desc = "split horizontal" })
map("n", "<leader>|", "<C-w>v", { desc = "split virtical" })
map("n", "<leader>se", "<C-w>=", { desc = "equalize window size" })

-- diff
-- stylua: ignore start
-- map("n", "<leader>df", function() utils_diff.telescope_diff_file() end, { desc = "Diff file with current buffer" })
-- map("n", "<leader>dr", function() utils_diff.telescope_diff_file(true) end, { desc = "Diff recent file with current buffer" })
-- map("n", "<leader>dg", function() utils_diff.telescope_diff_from_history() end, { desc = "Diff from git history" })
-- map("v", "<leader>dc", function() utils_diff.diff_from_clipboard() end, { desc = "Diff from clipboard" })
-- stylua: ignore end

-- Code/LSP
-- stylua: ignore start
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>lh", vim.lsp.buf.signature_help, { desc = "Signature Help" })

map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
map("n", "gr", ":Telescope lsp_references<cr>", { desc = "Goto References" })
map("n", "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, { desc = "Goto Implementation" })
map("n", "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, { desc = "Goto Definition" })
map("n", "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, { desc = "Goto Type Definition" })
-- stylua: ignore end
