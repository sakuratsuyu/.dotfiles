vim.opt.number = true
vim.opt.relativenumber = true

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.mouse = "a"
vim.opt.clipboard:append ("unnamedplus") -- set clipboard+=unnamedplus

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.list = true
vim.opt.listchars = "tab:-·,trail:·,lead:·"

vim.opt.autoread = true
vim.bo.autoread = true

vim.wo.signcolumn = "no"
