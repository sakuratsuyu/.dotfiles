local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<LEADER>m', ':MarkdownPreviewToggle<CR>', opts)
