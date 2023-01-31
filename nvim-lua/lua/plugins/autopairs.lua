local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<M-p>', ':lua require("nvim-autopairs").toggle()<CR>', opts)
keymap.set('v', '<M-p>', ':lua require("nvim-autopairs").toggle()<CR>', opts)
keymap.set('i', '<M-p>', '<ESC>:lua require("nvim-autopairs").toggle()<CR>a', opts)

local npairs = require('nvim-autopairs') local Rule = require('nvim-autopairs.rule')

-- Based on tree-sitter
npairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string', 'identifier'},         -- the treesitter node where it won't add a pair
        -- java = false,                            -- don't check treesitter on java
    },
    enable_check_bracket_line = true,           -- Don't add pairs if it already has a close pair in the same line
    ignored_next_char = '[%w%.]',               -- Don't add pairs if the next char is alphanumeric
    fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey='Comment'
    },
})

local ts_conds = require('nvim-autopairs.ts-conds')

-- press % => %% only while inside a comment or string
npairs.add_rules({
    Rule("%", "%", "lua")
        :with_pair(ts_conds.is_ts_node({'string','comment'})),
    Rule("$", "$", "lua")
        :with_pair(ts_conds.is_not_ts_node({'function'}))
})

-- Based on cmp
local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

-- Add spaces between parentheses
local brackets = { --[[ { '(', ')' }, { '[', ']' }, --]] { '{', '}' } }
npairs.add_rules {
    Rule(' ', ' ')
        :with_pair(function (opt)
            local pair = opt.line:sub(opt.col - 1, opt.col)
            local tbl = {}
            for _, bracket in pairs(brackets) do
                table.insert(tbl, bracket[1]..bracket[2])
            end
            return vim.tbl_contains(tbl, pair)
        end)
}
for _, bracket in pairs(brackets) do
    npairs.add_rules {
        Rule(bracket[1]..' ', ' '..bracket[2])
            :with_pair(function() return false end)
            :with_move(function(opt)
                return opt.prev_char:match('.%'..bracket[2]) ~= nil
            end)
            :use_key(bracket[2])
    }
end

-- Expand multiple pairs on enter key, similar to `vim-closer`
-- https://github.com/rstacruz/vim-closer/blob/master/autoload/closer.vim
local get_closing_for_line = function (line)
    local i = -1
    local clo = ''

    while true do
        i, _= string.find(line, "[%(%)%{%}%[%]]", i + 1)
        if i == nil then break end
        local ch = string.sub(line, i, i)
        local st = string.sub(clo, 1, 1)

        if ch == '{' then
            clo = '}' .. clo
        elseif ch == '}' then
            if st ~= '}' then return '' end
            clo = string.sub(clo, 2)
        elseif ch == '(' then
            clo = ')' .. clo
        elseif ch == ')' then
            if st ~= ')' then return '' end
            clo = string.sub(clo, 2)
        elseif ch == '[' then
            clo = ']' .. clo
        elseif ch == ']' then
            if st ~= ']' then return '' end
            clo = string.sub(clo, 2)
        end
    end

    return clo
end

npairs.add_rule(Rule("[%(%{%[]", "")
    :use_regex(true)
    :replace_endpair(function(opt)
        return get_closing_for_line(opt.line)
    end)
    :end_wise(function(opt)
        -- Do not endwise if there is no closing
        return get_closing_for_line(opt.line) ~= ""
    end))
