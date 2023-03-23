local g = vim.g

g.db_ui_use_nerd_fonts = 1
g.db_ui_save_location = "~/Workspace/DB"

-- Completion
local autocmd = vim.api.nvim_create_autocmd
autocmd(
    { 'FileType sql,mysql' },
    {
        command = 'lua require("cmp").setup.buffer({ sources = {{ name = "vim-dadbod-completion" }} })'
    }
)

g.completion_chain_complete_list = {
    sql = {
        { complete_items = { 'vim-dadbod-completion' }},
    },
}
-- Make sure `substring` is part of this list. Other items are optional for this completion source
g.completion_matching_strategy_list = { 'exact', 'substring' }
--  Useful if there's a lot of camel case items
g.completion_matching_ignore_case = 1
