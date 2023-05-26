local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- keymap.set('n', '<Leader>', '<Plug>(easymotion-prefix)', opts)

require('leap').add_default_mappings()

keymap.set('n', 'b', '<Plug>(leap-forward-to)', opts);
keymap.set('n', 'B', '<Plug>(leap-backward-to)', opts);
keymap.set('v', 'b', '<Plug>(leap-forward-to)', opts);
keymap.set('v', 'B', '<Plug>(leap-backward-to)', opts);

require('flit').setup {
    keys = { f = 'f', F = 'F', t = 't', T = 'T' },
    labeled_modes = "v",
    multiline = true,
    opts = {}
}
