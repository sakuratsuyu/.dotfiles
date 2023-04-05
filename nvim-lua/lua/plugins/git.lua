local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<M-g>', ':GitGutterLineHighlightsToggle<CR>', opts)
keymap.set('v', '<M-g>', ':GitGutterLineHighlightsToggle<CR>', opts)
keymap.set('i', '<M-g>', '<ESC>:GitGutterLineHighlightsToggle<CR>a', opts)
