local g = vim.g
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<M-g>', ':GitGutterLineHighlightsToggle<CR>', opts)
keymap.set('v', '<M-g>', ':GitGutterLineHighlightsToggle<CR>', opts)
keymap.set('i', '<M-g>', '<ESC>:GitGutterLineHighlightsToggle<CR>a', opts)

g.gitgutter_map_keys = 0
keymap.set('n', '[c', '<Plug>(GitGutterPrevHunk)', opts)
keymap.set('n', ']c', '<Plug>(GitGutterNextHunk)', opts)

g.blamer_enabled = 1
g.blamer_delay = 500
g.blamer_prefix = ' '
g.blamer_template = '<committer> • <committer-time> • <summary>'
g.blamer_date_format = '%Y-%m-%d %H:%M:%S'

keymap.set('n', '<M-b>', ':BlamerToggle<CR>', opts)
