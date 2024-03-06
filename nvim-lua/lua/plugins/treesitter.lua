local keymap = vim.keymap
local opt = { noremap = true, silent = true }

keymap.set('n', '<LEADER>gp', ':TSPlaygroundToggle<CR>', opt)
keymap.set('v', '<LEADER>gp', ':TSPlaygroundToggle<CR>', opt)
-- keymap.set('i', '<LEADER>gp', '<ESC>:TSPlaygroundToggle<CR>a', opt)

keymap.set('n', '<LEADER>gc', ':TSHighlightCapturesUnderCursor<CR>', opt)

-- [[
-- e.g. For `false`, from `:TSHighlightCapturesUnderCursor<CR>`, we know it's @boolean. 
-- `:highlight @boolean` prints out the current color scheme of @boolean.
-- Then we can change its frontground and background colors by (guifg, guibg, ctermfg, ctermbg)
-- :highlight @boolean guifg=#000000 guibg=#ffffff
-- ]]

require('nvim-treesitter.configs').setup {
    -- A list of parser names
    ensure_installed = { 'c', 'lua', 'vim' },
    -- List of parsers to ignore installing
    ignore_install = {},

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    modules = {

        highlight = {
            enable = true,
            disable = {},
            additional_vim_regex_highlighting = false,
            keymaps = {},
            module_path = "nvim-treesitter.highlight",
            is_supported = function(lang)
                return true
            end,
            attach = function(bufnr, lang)
                vim.api.nvim_buf_set_option(bufnr, 'commentstring', '// %s')
            end,
            detach = function(bufnr)
                vim.api.nvim_buf_set_option(bufnr, 'commentstring', nil)
            end,
            enabled_buffers = {},
        },

        incremental_selection = {
            enable = true,
            disable = {},
            additional_vim_regex_highlighting = false,
            keymaps = {
                init_selection    = '+',     -- set to `false` to disable one of the mappings
                node_incremental  = '+',
                scope_incremental = '<CR>',
                node_decremental  = '-',
            },
            module_path = "nvim-treesitter.incremental_selection",
            enabled_buffers = {},
            is_supported = function(lang)
                return true
            end,
            attach = function(bufnr, lang)
                vim.api.nvim_buf_set_option(bufnr, 'commentstring', '// %s')
            end,
            detach = function(bufnr)
                vim.api.nvim_buf_set_option(bufnr, 'commentstring', nil)
            end,
        },

        indent = {
            enable = true,
            disable = {},
            additional_vim_regex_highlighting = false,
            keymaps = {
                init_selection    = '+',     -- set to `false` to disable one of the mappings
                node_incremental  = '+',
                scope_incremental = '<CR>',
                node_decremental  = '-',
            },
            module_path = "nvim-treesitter.indent",
            enabled_buffers = {},
            is_supported = function(lang)
                return true
            end,
            attach = function(bufnr, lang)
                vim.api.nvim_buf_set_option(bufnr, 'commentstring', '// %s')
            end,
            detach = function(bufnr)
                vim.api.nvim_buf_set_option(bufnr, 'commentstring', nil)
            end,
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
            additional_vim_regex_highlighting = false,
            keymaps = { },
            module_path = "nvim-treesitter-playground.internal",
            enabled_buffers = {},
            is_supported = function(lang)
                return true
            end,
            attach = function(bufnr, lang)
                vim.api.nvim_buf_set_option(bufnr, 'commentstring', '// %s')
            end,
            detach = function(bufnr)
                vim.api.nvim_buf_set_option(bufnr, 'commentstring', nil)
            end,
        },

        autotag = {
            enable = true,
            disable = {},
            additional_vim_regex_highlighting = false,
            keymaps = { },
            module_path = "nvim-ts-autotag.internal",
            enabled_buffers = {},
            is_supported = function(lang)
                return true
            end,
            attach = function(bufnr, lang)
                vim.api.nvim_buf_set_option(bufnr, 'commentstring', '// %s')
            end,
            detach = function(bufnr)
                vim.api.nvim_buf_set_option(bufnr, 'commentstring', nil)
            end,
        }
    }
}
