local keymap = vim.keymap
local fn = vim.fn
local cmd = vim.api.nvim_command

keymap.set("n", "<M-u>", ":UndotreeToggle<CR>")
keymap.set("v", "<M-u>", ":UndotreeToggle<CR>")

fn.system('mkdir -p ~/.config/nvim/tmp/backup')
fn.system('mkdir -p ~/.config/nvim/tmp/undo')
cmd('set backupdir=~/.config/nvim/tmp/backup')
cmd('set directory=~/.config/nvim/tmp/backup')
if fn.has('persistent_undo') then
	vim.opt.undofile = true
    cmd('set undodir=~/.config/nvim/tmp/undo')
end
