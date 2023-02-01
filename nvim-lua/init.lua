require('base')
require('keymaps')
require('color')
require('plugins')

-- PLUGINS --

-- TODO
-- lualine
-- noice.nvim
-- nvim-ufo
-- dashboard-nvim
-- LuaSnip

require('plugins.startify')
require('plugins.line')

require('plugins.lsp')
require('plugins.cmp')
require('plugins.autopairs')

-- require('plugins.snip')

require('plugins.treesitter')
require('plugins.ufo')

require('plugins.tree')
require('plugins.telescope')
require('plugins.undotree')

require('plugins.noice')

require('plugins.multi-cursor')
require('plugins.sandwich')
require('plugins.easymotion')
