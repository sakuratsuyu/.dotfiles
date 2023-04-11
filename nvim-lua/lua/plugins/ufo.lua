local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local opt = vim.opt

opt.foldcolumn = '1'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep:│,foldclose:]]
opt.foldcolumn = '1'

keymap.set('n', 'zR', require('ufo').openAllFolds, opts)
keymap.set('n', 'zM', require('ufo').closeAllFolds, opts)
keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds, opts)
keymap.set('n', 'zm', require('ufo').closeFoldsWith, opts) -- closeAllFolds == closeFoldsWith(0)
keymap.set('n', 'K', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
        -- choose one of coc.nvim and nvim lsp
        vim.fn.CocActionAsync('definitionHover') -- coc.nvim
        vim.lsp.buf.hover()
    end
end, opts)

local ftMap = {
    vim = 'indent',
    python = {'indent'},
    git = ''
}

local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ('  %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end

require('ufo').setup({
    open_fold_hl_timeout = 150,
    close_fold_kinds = {'imports', 'comment'},
    fold_virt_text_handler = handler,
    preview = {
        win_config = {
            border = {'', '─', '', '', '', '─', '', ''},
            winhighlight = 'Normal:Folded',
            winblend = 0
        },
        mappings = {
            scrollU = '<C-u>',
            scrollD = '<C-d>',
            jumpTop = '[',
            jumpBot = ']'
        }
    },
    provider_selector = function(bufnr, filetype, buftype)
        return ftMap[filetype] or {'treesitter', 'indent'}
    end
})
