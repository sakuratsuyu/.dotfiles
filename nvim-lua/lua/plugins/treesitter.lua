local keymap = vim.keymap

keymap.set('n', '<M-g>', ':TSPlaygroundToggle<CR>')
keymap.set('v', '<M-g>', ':TSPlaygroundToggle<CR>')
keymap.set('i', '<M-g>', '<ESC>:TSPlaygroundToggle<CR>a')

keymap.set('n', '<M-c>', ':TSHighlightCapturesUnderCursor<CR>')

-- [[
-- e.g. For `false`, from `:TSHighlightCapturesUnderCursor<CR>`, we know it's @boolean. 
-- `:highlight @boolean` prints out the current color scheme of @boolean.
-- Then we can change its frontground and background colors by (guifg, guibg, ctermfg, ctermbg)
-- :highlight @boolean guifg=#000000 guibg=#ffffff
-- ]]

require('nvim-treesitter.configs').setup {
    -- A list of parser names
    ensure_installed = { 'c', 'lua', 'vim', 'help' }, 
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    auto_install = true,
    -- List of parsers to ignore installing
    ignore_install = {},

    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true,
        disable = {}
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection    = '+',     -- set to `false` to disable one of the mappings
            node_incremental  = '+',
            scope_incremental = '<TAB>',
            node_decremental  = '-',
        },
    },

    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    }
}
