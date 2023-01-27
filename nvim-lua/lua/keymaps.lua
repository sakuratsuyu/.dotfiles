vim.g.mapleader =  " "

local keymap = vim.keymap

keymap.set("n", "<LEADER><CR>", "<Cmd>nohlsearch<CR>")

keymap.set("n", ";", ":")

keymap.set("n", "Q", "<Cmd>q<CR>")
keymap.set("n", "S", "<Cmd>w<CR>")

keymap.set("n", "s", "<nop>")
keymap.set("n", "sl", "<Cmd>set splitright<CR><Cmd>vsplit<CR>")
keymap.set("n", "sh", "<Cmd>set nosplitright<CR><Cmd>vsplit<CR>")
keymap.set("n", "sk", "<Cmd>set nosplitbelow<CR><Cmd>split<CR>")
keymap.set("n", "sj", "<Cmd>set splitbelow<CR><Cmd>split<CR>")

keymap.set("n", "<LEADER>l", "<C-w>l")
keymap.set("n", "<LEADER>h", "<C-w>h")
keymap.set("n", "<LEADER>k", "<C-w>k")
keymap.set("n", "<LEADER>j", "<C-w>j")

keymap.set("n", "<up>", "<Cmd>res +5<CR>")
keymap.set("n", "<down>", "<Cmd>res -5<CR>")
keymap.set("n", "<left>","<Cmd>vertical resize+5<CR>")
keymap.set("n", "<right>","<Cmd>vertical resize-5<CR>")

keymap.set("n", "tu", "<Cmd>tabnew<CR>")
keymap.set("n", "<S-TAB>", "<Cmd>tabnext<CR>")

keymap.set("n", "sv", "<C-w>t<C-w>H")
keymap.set("n", "sh", "<C-w>t<C-w>K")

keymap.set("n", "<LEADER>sp", "<Cmd>set spell!<CR>")
