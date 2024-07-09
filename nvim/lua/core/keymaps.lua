vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "exit insert mode" })

keymap.set("n", "<leader>nh", "<cmd>noh<CR>", { desc = "no highlight" })

keymap.set("n", "+", "<C-a>", { desc = "increase number" })
keymap.set("n", "-", "<C-x>", { desc = "decrease number" })

-- line
keymap.set("n", "<A-k>", ":<C-u>m-2<CR>==", { desc = "move up line" })
keymap.set("n", "<A-j>", ":<C-u>m+<CR>==", { desc = "move down line" })
keymap.set("v", "<A-k>", ":m-2<CR>gv=gv", { desc = "move up line" })
keymap.set("v", "<A-j>", ":m'>+<CR>gv=gv", { desc = "move down line" })

-- buffer
keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "next buffere" })
keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "previous buffer" })

keymap.set("n", "<Leader>w", "<cmd>w<CR>", { desc = "save" })
keymap.set("n", "<Leader>q", "<cmd>q<CR>", { desc = "quit" })

-- indent
keymap.set("n", "<", "<<", { desc = "unindent" })
keymap.set("n", ">", ">>", { desc = "indent" })
keymap.set("v", "<", "<gv", { desc = "nuindent" })
keymap.set("v", ">", ">gv", { desc = "indent" })

-- window
keymap.set("n", "<leader>\\", "<C-w>s", { desc = "split horizontal" })
keymap.set("n", "<leader>|", "<C-w>v", { desc = "split virtical" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "equalize window size" })

-- keymap.set("n", "<Leader>r", ":RunCode<CR>") -- Run code
-- keymap.set("n", "<Leader>lf", ":lua vim.lsp.buf.format({async=true}) <CR>") -- Format Code
-- keymap.set("v", "<leader>!", 
--   function()
--     local ftype = vim.api.nvim_eval("&filetype")
--     vim.cmd("vsplit")
--     vim.cmd("enew")
--     vim.cmd("normal! P")
--     vim.cmd("setlocal buftype=nowrite")
--     vim.cmd("set filetype="..ftype)
--     vim.cmd("diffthis")
--     vim.cmd([[execute "normal! \<C-w>h"]])
-- 
--     vim.cmd("normal! gv")
--     vim.cmd("'<,'>y")
--     vim.cmd("enew")
--     vim.cmd("normal! P")
--     vim.cmd("setlocal buftype=nowrite")
--     vim.cmd("set filetype="..ftype)
--     vim.cmd("diffthis")
--   end, {desc = "diff with clipboard"}
-- )

