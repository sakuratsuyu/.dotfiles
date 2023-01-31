local keymap = vim.keymap
local opt = { noremap = true, silent = true }

keymap.set("x", "is", "<Plug>(textobj-sandwich-query-i", opt)
keymap.set("x", "as", "<Plug>(textobj-sandwich-query-a", opt)
keymap.set("o", "is", "<Plug>(textobj-sandwich-query-i", opt)
keymap.set("o", "as", "<Plug>(textobj-sandwich-query-a", opt)

keymap.set("x", "im", "<Plug>(textobj-sandwich-literal-query-i", opt)
keymap.set("x", "am", "<Plug>(textobj-sandwich-literal-query-a", opt)
keymap.set("o", "im", "<Plug>(textobj-sandwich-literal-query-i", opt)
keymap.set("o", "am", "<Plug>(textobj-sandwich-literal-query-a", opt)
