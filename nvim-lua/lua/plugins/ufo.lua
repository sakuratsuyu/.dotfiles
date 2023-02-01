local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local opt = vim.opt

opt.foldcolumn = '1'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

keymap.set('n', 'zR', require('ufo').openAllFolds, opts)
keymap.set('n', 'zM', require('ufo').closeAllFolds, opts)

require('ufo').setup({
    provider_selector = function()
        return {'treesitter', 'indent'}
    end
})
