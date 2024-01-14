local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- fixes C-i to not be mapped to TAB 
keymap("n", "<C-i>", "<C-i>", opts)

-- after jumping keep the cursor centered on screen (the 'zz')
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

keymap("n", "<C-Space>", "<cmd>WhichKey \\<space><cr>", opts)

-- Better window navigation
keymap("n", "<a-h>", "<C-w>h", opts)
keymap("n", "<a-j>", "<C-w>j", opts)
keymap("n", "<a-k>", "<C-w>k", opts)
keymap("n", "<a-l>", "<C-w>l", opts)
keymap("n", "<a-tab>", "<c-6>", opts)
-- 
