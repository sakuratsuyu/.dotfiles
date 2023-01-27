vim.keymap.set("n", "<M-u>", "<Cmd>UndotreeToggle<CR>")

os.execute('mkdir -p ~/.config/nvim/tmp/backup')
os.execute('mkdir -p ~/.config/nvim/tmp/undo')
vim.api.nvim_command('set backupdir=~/.config/nvim/tmp/backup')
vim.api.nvim_command('set directory=~/.config/nvim/tmp/backup')
if vim.fn.has('persistent_undo') then
	vim.opt.undofile = true
    vim.api.nvim_command('set undodir=~/.config/nvim/top/undo')
end
