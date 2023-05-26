vim.g.mapleader =  ' '

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

function BatchifyKeymap(maps)
    for _, map in pairs(maps) do
        keymap.set(map[1], map[2], map[3], map[4])
    end
end

BatchifyKeymap({
    { 'n', '<LEADER><CR>', ':nohlsearch<CR>', opts },
    { 'v', '<LEADER><CR>', ':nohlsearch<CR>', opts },

    { 'n', 'E', 'b', opts },
    { 'v', 'E', 'b', opts },

    -- Repeat Macro
    { 'n', ',', '@q', opts },
    { 'v', ',', '@q', opts },

    -- Cut and make a new line
    { 'n', '<C-j>', 'a<CR><ESC>k$', opts },
    { 'v', '<C-j>', '<ESC>a<CR><ESC>k$', opts },

    -- Move line up and down
    { 'n', '<C-S-UP>', ':move .-2<CR>', opts },
    { 'n', '<C-K>', ':move .-2<CR>', opts },
    { 'n', '<C-S-DOWN>', ':move .+1<CR>', opts },
    { 'n', '<C-J>', ':move .+1<CR>', opts },
    { 'v', '<C-S-UP>', '<ESC>:move .-2<CR>', opts },
    { 'v', '<C-K>', ':move .-2<CR>', opts },
    { 'v', '<C-S-DOWN>', '<ESC>:move .+1<CR>', opts },
    { 'v', '<C-J>', ':move .+1<CR>', opts },
    { 'i', '<C-S-UP>', '<ESC>:move .-2<CR>i', opts },
    { 'i', '<C-K>', '<ESC>:move .-2<CR>i', opts },
    { 'i', '<C-S-DOWN>', '<ESC>:move .+1<CR>i', opts },
    { 'i', '<C-J>', '<ESC>:move .+1<CR>i', opts },

    -- Save and exit
    { 'n', 'Q', ':q<CR>', opts },
    { 'n', 'S', ':w<CR>', opts },
    { 'v', 'Q', ':q<CR>', opts },
    { 'n', 'S', ':w<CR>', opts },

    -- Indentation
    -- { 'n', '<S-TAB>', '<<', opts },
    -- { 'n', '<TAB>', '>>', opts },
    { 'n', '<', '<<', opts },
    { 'n', '>', '>>', opts },
    { 'v', '<', '<gv', opts },
    { 'v', '>', '>gv', opts },
    { 'v', '<S-TAB>', '<gv', opts },
    { 'v', '<TAB>', '>gv', opts },

    -- Split Buffer
    { 'n', 's', '<NOP>', opts },
    { 'n', 'sl', ':set splitright<CR>:vsplit<CR>', opts },
    { 'n', 'sh', ':set nosplitright<CR>:vsplit<CR>', opts },
    { 'n', 'sk', ':set nosplitbelow<CR>:split<CR>', opts },
    { 'n', 'sj', ':set splitbelow<CR>:split<CR>', opts },
    { 'v', 's', '<NOP>', opts },
    { 'v', 'sl', '<ESC>:set splitright<CR>:vsplit<CR>', opts },
    { 'v', 'sh', '<ESC>:set nosplitright<CR>:vsplit<CR>', opts },
    { 'v', 'sk', '<ESC>:set nosplitbelow<CR>:split<CR>', opts },
    { 'v', 'sj', '<ESC>:set splitbelow<CR>:split<CR>', opts },

    -- Split Strategy
    { 'n', 'sv', '<C-w>t<C-w>H', opts },
    { 'n', 'sh', '<C-w>t<C-w>K', opts },
    { 'v', 'sv', '<C-w>t<C-w>H', opts },
    { 'v', 'sh', '<C-w>t<C-w>K', opts },

    -- Select Buffer
    { 'n', '<LEADER>l', '<C-w>l', opts },
    { 'n', '<LEADER>h', '<C-w>h', opts },
    { 'n', '<LEADER>k', '<C-w>k', opts },
    { 'n', '<LEADER>j', '<C-w>j', opts },
    { 'v', '<LEADER>l', '<C-w>l', opts },
    { 'v', '<LEADER>h', '<C-w>h', opts },
    { 'v', '<LEADER>k', '<C-w>k', opts },
    { 'v', '<LEADER>j', '<C-w>j', opts },

    -- Resize
    { 'n', '<UP>', ':resize +5<CR>', opts },
    { 'n', '<DOWN>', ':resize -5<CR>', opts },
    { 'n', '<LEFT>',':vertical resize+5<CR>', opts },
    { 'n', '<RIGHT>',':vertical resize-5<CR>', opts },
    { 'v', '<UP>', '<ESC>:resize +5<CR>', opts },
    { 'v', '<DOWN>', '<ESC>:resize -5<CR>', opts },
    { 'v', '<LEFT>','<ESC>:vertical resize+5<CR>', opts },
    { 'v', '<RIGHT>','<ESC>:vertical resize-5<CR>', opts },

    -- Tab
    { 'n', 'U', ':tabnew<CR>', opts },
    { 'n', 'W', ':tabclose<CR>', opts },
    { 'n', '<M-h>', ':tabprev<CR>', opts },
    { 'n', '<M-l>', ':tabnext<CR>', opts },
    { 'v', 'tu', '<ESC>:tabnew<CR>', opts },
    { 'v', 'W', '<ESC>:tabclose<CR>', opts },
    { 'v', '<M-h>', '<ESC>:tabprev<CR>', opts },
    { 'v', '<M-l>', '<ESC>:tabnext<CR>', opts },

    { 'n', '<M-1>', '1gt', opts },
    { 'n', '<M-2>', '2gt', opts },
    { 'n', '<M-3>', '3gt', opts },
    { 'n', '<M-4>', '4gt', opts },
    { 'n', '<M-5>', '5gt', opts },
    { 'n', '<M-6>', '6gt', opts },
    { 'n', '<M-7>', '7gt', opts },
    { 'n', '<M-8>', '8gt', opts },
    { 'n', '<M-9>', '9gt', opts },
    { 'v', '<M-1>', '1gt', opts },
    { 'v', '<M-2>', '2gt', opts },
    { 'v', '<M-3>', '3gt', opts },
    { 'v', '<M-4>', '4gt', opts },
    { 'v', '<M-5>', '5gt', opts },
    { 'v', '<M-6>', '6gt', opts },
    { 'v', '<M-7>', '7gt', opts },
    { 'v', '<M-8>', '8gt', opts },
    { 'v', '<M-9>', '9gt', opts },

    -- Spell Check
    { 'n', '<LEADER>sp', ':set spell!<CR>', opts },
    { 'v', '<LEADER>sp', '<ESC>:set spell!<CR>', opts },
})
