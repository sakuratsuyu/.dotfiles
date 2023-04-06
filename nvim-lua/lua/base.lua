local opt = vim.opt

-- Number Line
opt.number = true
opt.relativenumber = true

-- Encoding
vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

-- Margin Line
opt.scrolloff = 5
opt.sidescrolloff = 5

-- Fold
-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/nvim-treesitter'
-- local fn = vim.fn
-- if fn.empty(fn.glob(install_path)) <= 0 then
--     vim.cmd([[
--         set foldmethod=expr
--         set foldexpr=nvim_treesitter#foldexpr()
--         set nofoldenable
--     ]])
--     -- Disable folding at startup.
-- else
--     opt.foldmethod = 'indent'
--     opt.foldlevel = 99
-- end

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Enable mouse
opt.mouse = 'a'

-- System Clipboard
opt.clipboard:append('unnamedplus')         -- set clipboard+=unnamedplus

-- Enable Backspace
opt.backspace='indent,eol,start'

-- Enable Cursor Cross Lines
opt.whichwrap:append('<,>,h,')

-- Tab
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

vim.cmd([[
    autocmd Filetype yaml,javascript,typescript,typescriptreact setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
]])

-- Dots
opt.list = true
-- opt.listchars = 'tab:-·,trail:·,lead:·'
opt.listchars = 'tab:▸ ,trail:·,extends:>,precedes:<,nbsp:·'

opt.autoread = true
vim.bo.autoread = true

vim.wo.signcolumn = 'yes'
