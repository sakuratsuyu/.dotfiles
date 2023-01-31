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

    -- Repeat Macro
    { 'n', ',', '@q', opts },
    { 'v', ',', '@q', opts },

    -- Delete a word
    -- { 'n', '<BS>', '"_ciw', opt },

    -- Cut and make a new line
    { 'n', '<C-j>', 'a<CR><ESC>k$', opts },
    { 'v', '<C-j>', '<ESC>a<CR><ESC>k$', opts },

    -- Move line up and down
    { 'n', '<C-S-UP>', ':move .-2<CR>', opts },
    { 'n', '<C-S-DOWN>', ':move .+1<CR>', opts },
    { 'v', '<C-S-UP>', ':move .-2<CR>', opts },
    { 'v', '<C-S-DOWN>', ':move .+1<CR>', opts },
    { 'i', '<C-S-UP>', '<ESC>:move .-2<CR>i', opts },
    { 'i', '<C-S-DOWN>', '<ESC>:move .+1<CR>i', opts },

    -- Save and exit
    { 'n', 'Q', ':q<CR>', opts },
    { 'n', 'S', ':w<CR>', opts },
    { 'v', 'Q', ':q<CR>', opts },
    { 'n', 'S', ':w<CR>', opts },

    -- Indentation
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
    { 'v', 'sl', ':set splitright<CR>:vsplit<CR>', opts },
    { 'v', 'sh', ':set nosplitright<CR>:vsplit<CR>', opts },
    { 'v', 'sk', ':set nosplitbelow<CR>:split<CR>', opts },
    { 'v', 'sj', ':set splitbelow<CR>:split<CR>', opts },

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
    { 'v', '<UP>', ':resize +5<CR>', opts },
    { 'v', '<DOWN>', ':resize -5<CR>', opts },
    { 'v', '<LEFT>',':vertical resize+5<CR>', opts },
    { 'v', '<RIGHT>',':vertical resize-5<CR>', opts },

    -- Tab
    { 'n', 'tu', ':tabnew<CR>', opts },
    { 'n', '<C-h>', ':tabprev<CR>', opts },
    { 'n', '<C-l>', ':tabnext<CR>', opts },
    { 'v', 'tu', ':tabnew<CR>', opts },
    { 'v', '<C-h>', ':tabprev<CR>', opts },
    { 'v', '<C-l>', ':tabnext<CR>', opts },

    -- Spell Check
    { 'n', '<LEADER>sp', ':set spell!<CR>', opts },
    { 'v', '<LEADER>sp', ':set spell!<CR>', opts },
})
