vim.g.mapleader =  ' '

local keymap = vim.keymap

function BatchifyKeymap(maps)
    for _, map in pairs(maps) do
        keymap.set(map[1], map[2], map[3], map[4])
    end
end

BatchifyKeymap({
    { 'n', '<LEADER><CR>', ':nohlsearch<CR>', {} },

    { 'n', ';', ':', {} },
    { 'v', ';', ':', {} },

    -- Repeat Macro
    { 'n', ',', '@q', { noremap = true } },

    -- Delete a word
    -- { 'n', '<BS>', '"_ciw', { noremap = true } },

    -- Cut and make a new line
    { 'n', '<C-j>', 'a<CR><ESC>k$', { noremap = true } },

    -- Move line up and down
    { 'n', '<C-S-UP>', ':move .-2<CR>', { noremap = true } },
    { 'n', '<C-S-DOWN>', ':move .+1<CR>', { noremap = true } },
    { 'v', '<C-S-UP>', ':move .-2<CR>', { noremap = true } },
    { 'v', '<C-S-DOWN>', ':move .+1<CR>', { noremap = true } },
    { 'i', '<C-S-UP>', '<ESC>:move .-2<CR>i', { noremap = true } },
    { 'i', '<C-S-DOWN>', '<ESC>:move .+1<CR>i', { noremap = true } },

    -- Save and exit
    { 'n', 'Q', ':q<CR>', { noremap = true } },
    { 'n', 'S', ':w<CR>', { noremap = true } },

    -- Indentation
    { 'v', '<', '<gv', { noremap = true } },
    { 'v', '>', '>gv', { noremap = true } },
    { 'v', '<S-TAB>', '<gv', { noremap = true } },
    { 'v', '<TAB>', '>gv', { noremap = true } },

    -- Split Buffer
    { 'n', 's', '<nop>', {} },
    { 'n', 'sl', ':set splitright<CR>:vsplit<CR>', { noremap = true } },
    { 'n', 'sh', ':set nosplitright<CR>:vsplit<CR>', { noremap = true } },
    { 'n', 'sk', ':set nosplitbelow<CR>:split<CR>', { noremap = true } },
    { 'n', 'sj', ':set splitbelow<CR>:split<CR>', { noremap = true } },

    -- Split Strategy
    { 'n', 'sv', '<C-w>t<C-w>H', { noremap = true } },
    { 'n', 'sh', '<C-w>t<C-w>K', { noremap = true } },
    
    -- Select Buffer
    { 'n', '<LEADER>l', '<C-w>l', { noremap = true } },
    { 'n', '<LEADER>h', '<C-w>h', { noremap = true } },
    { 'n', '<LEADER>k', '<C-w>k', { noremap = true } },
    { 'n', '<LEADER>j', '<C-w>j', { noremap = true } },
   
    -- Resize
    { 'n', '<UP>', ':resize +5<CR>', { noremap = true } },
    { 'n', '<DOWN>', ':resize -5<CR>', { noremap = true } },
    { 'n', '<LEFT>',':vertical resize+5<CR>', { noremap = true } },
    { 'n', '<RIGHT>',':vertical resize-5<CR>', { noremap = true } },
  
    -- Tab
    { 'n', 'tu', ':tabnew<CR>', { noremap = true } },
    { 'n', '<C-h>', ':tabprev<CR>', { noremap = true } },
    { 'n', '<C-l>', ':tabnext<CR>', { noremap = true } },
 
    -- Spell Check
    { 'n', '<LEADER>sp', ':set spell!<CR>', { noremap = true } },
})
