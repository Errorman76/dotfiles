vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", "<cmd>noh<CR>")

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

keymap.set("n", "<A-k>", ":<C-u>m-2<CR>==")
keymap.set("n", "<A-j>", ":<C-u>m+<CR>==")
keymap.set("v", "<A-k>", ":m-2<CR>gv=gv")
keymap.set("v", "<A-j>", ":m'>+<CR>gv=gv")

keymap.set("n", "<S-l>", "<cmd>bnext<CR>")
keymap.set("n", "<S-h>", "<cmd>bprevious<CR>")

keymap.set("n", "<Leader>w", "<cmd>w<CR>")
keymap.set("n", "<Leader>q", "<cmd>q<CR>")
keymap.set("n", "<leader>c", "<cmd>tabclose<CR>")

keymap.set("n", "<", "<<")
keymap.set("n", ">", ">>")
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

keymap.set("n", "<leader>\\", "<C-w>s")
keymap.set("n", "<leader>|", "<C-w>v")
keymap.set("n", "<leader>se", "<C-w>=")

keymap.set("n", "<A-Up>", function() require("smart-splits").resize_up() end)
keymap.set("n", "<A-Down>", function() require("smart-splits").resize_down() end)
keymap.set("n", "<A-Left>", function() require("smart-splits").resize_left() end)
keymap.set("n", "<A-Right>", function() require("smart-splits").resize_right() end)


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

