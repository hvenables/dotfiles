local set = vim.opt

set.modelines = 0
set.autoread = true

set.autowrite = true

set.relativenumber = true
set.number = true

set.visualbell = true
-- Stop vim creating backups
set.backup = false
set.writebackup = false
set.swapfile = false

set.scrolloff = 3

set.expandtab = true
set.softtabstop = 2
set.shiftwidth = 2
set.tabstop = 2
set.shiftround = true

set.cursorline = true

-- Improve Searching
vim.keymap.set('n', '/', '/\\v')
vim.keymap.set('v', '/', '/\\v')
set.ignorecase = true
set.smartcase = true

set.clipboard = 'unnamedplus'
set.wrap = true

-- Open new split panes to right and bottom, which feels more natural
set.splitbelow = true
set.splitright = true

set.textwidth = 120
set.colorcolumn = '+1'

set.tags:append('./.git/tags')

set.background = 'dark'
set.termguicolors = true

-- vim.cmd('colorscheme solarized8')
vim.cmd('set list listchars=tab:»·,trail:·,nbsp:·')
vim.cmd('set iskeyword+=@-@')
vim.cmd('set iskeyword+=?')

set.signcolumn = 'number'

-- set.undofile = true
-- set.undodir = '~/.config/nvim/undo'
-- set.undolevels = 10000

vim.g.mapleader = ","
vim.g.maplocalleader = " "

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldnestmax = 4
