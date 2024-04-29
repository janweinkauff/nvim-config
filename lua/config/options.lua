local opt = vim.opt

opt.autowrite = true

opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.list = true

opt.mouse = "a"

opt.number = true
opt.relativenumber = true

opt.pumblend = 10
opt.pumheight = 10

opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true
opt.shortmess:append { W = true, I = true, c = true }
opt.showmode = false
opt.signcolumn = "yes"

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.sidescrolloff = 8
opt.scrolloff = 8

opt.smartcase = true
opt.smartindent = true

opt.spelllang = { "en" }

opt.splitbelow = true
opt.splitright = true

opt.tabstop = 4
opt.expandtab = true
opt.shiftwidth = 4

opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true
opt.timeoutlen = 300
opt.updatetime = 50

opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200

opt.wildmode = "longest:full,full"

opt.winminwidth = 4

opt.wrap = false

vim.g.markdown_recommended_style = 0


-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.fileencoding = "utf-8"
