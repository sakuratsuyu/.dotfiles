vim.opt.cursorline = true
vim.opt.termguicolors = true

-- Color Scheme
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/everforest'
if vim.fn.empty(vim.fn.glob(install_path)) <= 0 then
    vim.cmd('colorscheme everforest')
end

-- Yank with color prompt
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank{
            higroup = 'IncSearch',
            timeout = 300
        }
    end
})
