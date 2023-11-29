local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Explorer
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Window resize
keymap("n", "<C-up>", ":resize -2<CR>", opts)
keymap("n", "<C-down>", ":resize #2<CR>", opts)
keymap("n", "<C-right>", ":vertical -2<CR>", opts)
keymap("n", "<C-left>", ":vertical -2<CR>", opts)

-- Buffers
keymap("n", "<tab>", ":bnext<CR>", opts)
keymap("n", "<s-tab>", ":bprevious<CR>", opts)
keymap("n", "<C-w>", ":bd<CR>", opts)

--- Search
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Fast exit
keymap("i", "jk", "<esc>", opts)
keymap("i", "kj", "<esc>", opts)

-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- cursor movement
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- move text up/down
keymap("v", "<a-j>", ":m .+1<cr>==", opts)
keymap("v", "<a-k>", ":m .-2<cr>==", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Terminal, move text up/down
keymap("x", "J", ":move '>+1<cr>gv-gv", opts)
keymap("x", "K", ":move '<-2<cr>gv-gv", opts)
keymap("x", "<A-j>", ":move '<+1<cr>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<cr>gv-gv", opts)

-- Terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)

-- LSP
keymap("n", "r", ":lua vim.lsp.buf.format{async=true}<cr>", opts)

-- LSP Trouble
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

-- Search --
keymap("", "<leader>hc", ":nohl<cr>", opts)

-- Harpoon --
vim.keymap.set("", "<leader>h", function() require("harpoon.ui").toggle_quick_menu() end)
vim.keymap.set("", "<leader>ha", function() require("harpoon.mark").add_file() end)
vim.keymap.set("", "<leader>hr", function() require("harpoon.mark").rm_file() end)
