-- local has_words_before = function()
--   unpack = unpack or table.unpack
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

local opt = vim.opt
opt.completeopt='menu,menuone,noselect'

vim.cmd([[
    highlight! default link CmpItemKind CmpItemMenuDefault
]])

local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
--                elseif has_words_before() then
--                    cmp.complete()
                else
                    fallback()
                end
            end, {"i", "s"}),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, {"i", "s"}),

        -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        {
            name = 'nvim_lsp',   -- cmp-nvim-lsp
--            entry_filter = function(entry, _)
--                return require('cmp.types').lsp.CompletionItemKind[entry:get_kind()] ~= 'Text'
--            end
        },
        { name = 'path' },      -- cmp-path
        { name = 'luasnip' },   -- cmp_luasnip
        { name = 'fish' },      -- cmp-fish
    }, {
        { name = 'buffer' },
    }),
    view = {
        entries = 'custom'
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',       -- 'symbol', 'text', 'symbol_text', 'text_symbol'
            maxwidth = 50,              -- prevent the popup from showing more than provided characters
            ellipsis_char = '...',      -- when popup menu exceed maxwidth, the truncated part would show `ellipsis_char` instead

            menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]",
            })
        })
  }
})

-- cmp-cmdline
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
            { name = 'cmdline' }
        })
})
