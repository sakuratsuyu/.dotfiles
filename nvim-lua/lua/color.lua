local opt = vim.opt
local g = vim.g
local fn = vim.fn

opt.cursorline = true
opt.termguicolors = true

-- Color Scheme
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/everforest'
if fn.empty(vim.fn.glob(install_path)) <= 0 then
    vim.cmd('colorscheme everforest')
    opt.background = 'dark'
    g.everforest_background = 'medium'
    g.everforest_diagnostic_line_highlight = 1
end

-- Diagnostic Line
fn.sign_define({
    {
        name = 'DiagnosticSignError',
        text = '',
        texthl = 'DiagnosticSignError',
        linehl = 'ErrorLine'
    },
    {
        name = 'DiagnosticSignWarn',
        text = '',
        texthl = 'DiagnosticSignWarn',
        linehl = 'WarningLine'
    },
    {
        name = 'DiagnosticSignInfo',
        text = '',
        texthl = 'DiagnosticSignInfo',
        linehl = 'InfoLine'
    },
    {
        name = 'DiagnosticSignHint',
        text = '',
        texthl = 'DiagnosticSignHint',
        linehl = 'HintLine'
    },
})

-- Yank with color prompt
local autocmd = vim.api.nvim_create_autocmd
autocmd(
    { 'TextYankPost' },
    {
        callback = function()
            vim.highlight.on_yank{
                higroup = 'IncSearch',
                timeout = 300
            }
        end
    }
)

