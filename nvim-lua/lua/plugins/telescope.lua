local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local builtin = require('telescope.builtin')

keymap.set('n', '\'', '<NOP>', opts)

keymap.set('n', '\'f', builtin.find_files, opts)     -- Find by file name
keymap.set('n', '\'g', builtin.live_grep, opts)      -- Find by file content
keymap.set('n', '\'i', builtin.treesitter, opts)     -- Find identifiers
keymap.set('n', '\'h', builtin.oldfiles, opts)       -- Find previously opened files
keymap.set('n', '\'c', builtin.commands, opts)       -- Find commands

keymap.set('v', '\'f', builtin.find_files, opts)     -- Find by file name
keymap.set('v', '\'g', builtin.live_grep, opts)      -- Find by file content
keymap.set('v', '\'i', builtin.treesitter, opts)     -- Find identifiers
keymap.set('v', '\'h', builtin.oldfiles, opts)       -- Find previously opened files
keymap.set('v', '\'c', builtin.commands, opts)       -- Find commands

function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

-- keymap.set('n', '\'b', ':Telescope file_browser<CR>', opts)
keymap.set('n', '\'b', ':lua require("telescope").extensions.file_browser.file_browser({path = "%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true})<CR>', opts)


local actions = require('telescope.actions')
local fb_actions = require('telescope').extensions.file_browser.actions

require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<CR>'] = actions.select_default,
                ['<C-h>'] = actions.select_horizontal,
                ['<C-v>'] = actions.select_vertical,
                ['<C-t>'] = actions.select_tab,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<C-b>"] = actions.results_scrolling_up,
                ["<C-f>"] = actions.results_scrolling_down,
                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
                ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
                ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
            },
            n = {
                ['q'] = actions.close,

                ['l'] = actions.select_default,
                ['<CR>'] = actions.select_default,
                ['<C-h>'] = actions.select_horizontal,
                ['<C-v>'] = actions.select_vertical,
                ['<C-t>'] = actions.select_tab,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<C-b>"] = actions.results_scrolling_up,
                ["<C-f>"] = actions.results_scrolling_down,
                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ['<'] = actions.toggle_selection,
                ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
                ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
                ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
            }
        },
        layout_config = {
            horizontal = {
                height = 0.9,
                width = 0.9,
                preview_cutoff = 100,
                preview_width = 0.6,
            }
        },
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    },
    extensions = {
        file_browser = {
            hijack_netrw = true,
            mappings = {
                ['i'] = {
                    ['<C-w>'] = function() vim.cmd('normal vbd') end,
                },
                ['n'] = {
                    ['h'] = fb_actions.goto_parent_dir,
                    ['/'] = function()
                        vim.cmd('startinsert')
                    end
                }
            }
        }
    }
})

require('telescope').load_extension('file_browser')
