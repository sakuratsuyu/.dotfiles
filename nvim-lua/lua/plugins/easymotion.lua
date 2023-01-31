local keymap = vim.keymap
local opt = { noremap = true, silent = true }

keymap.set('n', '<Leader>', '<Plug>(easymotion-prefix)', opt)
