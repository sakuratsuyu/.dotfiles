local g = vim.g

g.db_ui_use_nerd_fonts = 1
g.db_ui_save_location = "~/Workspace/DB"

vim.cmd([[
    autocmd FileType sql,mysql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
    let g:completion_chain_complete_list = {
        \   'sql': [
        \    {'complete_items': ['vim-dadbod-completion']},
        \   ],
        \ }
    " Make sure `substring` is part of this list. Other items are optional for this completion source
    let g:completion_matching_strategy_list = ['exact', 'substring']
    " Useful if there's a lot of camel case items
    let g:completion_matching_ignore_case = 1
]])
