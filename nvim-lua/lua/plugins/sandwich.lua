local keymap = vim.keymap

keymap.set("x", "is", "<Plug>(textobj-sandwich-query-i")
keymap.set("x", "as", "<Plug>(textobj-sandwich-query-a")
keymap.set("o", "is", "<Plug>(textobj-sandwich-query-i")
keymap.set("o", "as", "<Plug>(textobj-sandwich-query-a")

keymap.set("x", "im", "<Plug>(textobj-sandwich-literal-query-i")
keymap.set("x", "am", "<Plug>(textobj-sandwich-literal-query-a")
keymap.set("o", "im", "<Plug>(textobj-sandwich-literal-query-i")
keymap.set("o", "am", "<Plug>(textobj-sandwich-literal-query-a")
