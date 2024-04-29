local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Window resize
keymap("n", "<C-up>", ":resize -1<CR>", opts)
keymap("n", "<C-down>", ":resize #3<CR>", opts)
keymap("n", "<C-right>", ":vertical -1<CR>", opts)
keymap("n", "<C-left>", ":vertical -1<CR>", opts)

-- Buffers
keymap("n", "<Right>", ":bnext<CR>", opts)
keymap("n", "<Left>", ":bprevious<CR>", opts)
keymap("n", "<C-w>", ":bd<CR>", opts)

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
keymap("v", "J", ":move '>+1<cr>gv-gv", opts)
keymap("v", "K", ":move '<-2<cr>gv-gv", opts)
keymap("x", "<A-j>", ":move '<+2<cr>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-1<cr>gv-gv", opts)

-- Terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)

-- Selection
keymap("n", "<C-a>", "ggVG", opts)

-- LSP
keymap("n", "r", ":lua vim.lsp.buf.format{async=true}<cr>", opts)

-- Trouble
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

-- Search --
keymap("n", "<Esc>", ":nohl<cr>", opts)

-- Tests
keymap("n", "t", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", opts)
keymap("n", "ta", ":lua require('neotest').run.run(vim.loop.cwd())<CR>", opts)
keymap("n", "ts", ":lua require('neotest').summary.toggle()<CR>", opts)
keymap("n", "tr", ":lua require('neotest').output_panel.toggle()<CR>", opts)
keymap("n", "tg", ":lua require('neotest').output.open({ enter = true, auto_close = true })<CR>", opts)
keymap("n", "tk", ":lua require('neotest').run.stop()<CR>", opts)
keymap("n", "tw", ":lua require('neotest').watch.toggle()<CR>", opts)
keymap("n", "td", ":lua require('neotest').diagnostics.toggle()<CR>", opts)
