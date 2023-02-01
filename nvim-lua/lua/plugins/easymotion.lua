local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<Leader>', '<Plug>(easymotion-prefix)', opts)
