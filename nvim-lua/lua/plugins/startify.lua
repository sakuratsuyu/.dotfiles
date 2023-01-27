vim.g.startify_custom_header = "startify#center(split(system('figlet -w 100 neovim'), '\n'))"

vim.g.startify_session_dir = '~/.config/nvim/session'

-- returns all modified files of the current git repo
-- `2>/dev/null` makes the command fail quietly, so that when we are not
-- in a git repo, the list will be empty
--function gitModified()
--    vim.o.files = systemlist('git ls-files -m 2>/dev/null')
--    return vim.fn.map(files, "{'line': v:val, 'path': v:val}")
--end

-- same as above, but show untracked files, honouring .gitignore
--function gitUntracked()
--    vim.o.files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
--    return vim.fn.map(files, "{'line': v:val, 'path': v:val}")
--end

vim.g.startify_lists = {
    {type = 'files',        header = {'	Recent Files'}},
    {type = 'dir',          header = {'    Current Directory '..io.popen('pwd'):read("*all")}},
    {type = 'sessions',     header = {'	Sessions'}},
    {type = 'bookmarks',    header = {'	Bookmarks'}},
--    {type = gitModified,    header = {' git modified'}},
--    {type = gitUntracked,   header = {' git untracked'}},
    {type = 'commands',     header = {' Commands'}},
}

vim.g.startify_bookmarks = {
    {c = '~/.config/i3/config'},
    {i = '~/.config/nvim'},
    {f = '~/.config/fish'},
}

vim.g.startify_files_number = 10
vim.g.startify_fortune_use_unicode = 1
vim.g.startify_session_autoload = 1
vim.g.startify_session_persistence = 1
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_enable_special = 0
