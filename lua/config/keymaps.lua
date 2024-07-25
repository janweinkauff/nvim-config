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

-- New line
keymap("n", "oo", "o<esc>", opts)
keymap("n", "OO", "O<esc>", opts)

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

-- Trouble
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

-- Search --
keymap("n", "<Esc>", ":nohl<cr>", opts)

-- URL --
function HandleURL()
    local line = vim.fn.getline('.')
    local url_pattern = '[a-z]+://[^ >,;\'"()]*[^ >,;\'"().]'
    local markdown_url_pattern = '%b<>%f[%a]%f[^<]|%b()%f[%a]%f[^)]|%b[]%f[%a]%f[^%]]'
    local uri = line:match(url_pattern) or line:match(markdown_url_pattern)
    if uri then
        uri = uri:gsub("^<", ""):gsub(">$", "")
        uri = uri:gsub("%b[]%(", ""):gsub("%)", "")
        vim.api.nvim_echo({ { uri, "Normal" } }, false, {})

        vim.cmd('silent !open ' .. '-jg -a Safari ' .. vim.fn.shellescape(uri, 1))
    else
        vim.api.nvim_echo({ { "No URI found in line.", "WarningMsg" } }, false, {})
    end
end

keymap('n', 'gx', ':lua HandleURL()<CR>', { noremap = true, silent = true })
