local g = vim.g

g.floaterm_title = 'Terminal'

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local fn = vim.fn
local nvim_cmd = vim.api.nvim_command
function FloatermToggle(name, cmd)
    if fn['floaterm#terminal#get_bufnr'](name) ~= -1 then
        nvim_cmd(string.format('exec "FloatermToggle %s"', name))
    else
        nvim_cmd(string.format('FloatermNew --name=%s %s', name, cmd))
    end
end

keymap.set('n', '<M-t>', string.format(":call v:lua.FloatermToggle('%s', '%s')<cr>", 'term', ''), opts)
keymap.set('t', '<M-t>', '<C-\\><C-n>:FloatermToggle<CR>', opts)
keymap.set('t', '<M-b>', '<C-\\><C-n>:FloatermKill<CR>', opts)
