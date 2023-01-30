-- Number Line
vim.opt.number = true
vim.opt.relativenumber = true

-- Encoding
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Margin Line
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

-- Fold
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/nvim-treesitter'
-- if vim.fn.empty(vim.fn.glob(install_path)) <= 0 then
--     vim.cmd([[
--         set foldmethod=expr
--         set foldexpr=nvim_treesitter#foldexpr()
--         set nofoldenable
--     ]])
--     -- Disable folding at startup.
-- else 
    vim.opt.foldmethod = 'indent'
    vim.opt.foldlevel = 99
-- end

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable mouse
vim.opt.mouse = "a"

-- System Clipboard
vim.opt.clipboard:append("unnamedplus")         -- set clipboard+=unnamedplus

-- Enable Backspace
vim.opt.backspace='indent,eol,start'

-- Enable Cursor Cross Lines
vim.opt.whichwrap:append("<,>,h,")

-- Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Dots
vim.opt.list = true
vim.opt.listchars = "tab:-·,trail:·,lead:·"

vim.opt.autoread = true
vim.bo.autoread = true

vim.wo.signcolumn = "no"
