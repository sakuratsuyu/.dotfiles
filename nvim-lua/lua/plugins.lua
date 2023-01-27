-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- Theme
    use 'sainnhe/everforest'
    -- AIRLINE
    use 'theniceboy/eleline.vim'
    use 'mg979/vim-xtabline'
    -- LSP
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    -- CMP
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    -- SNIPPETS
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'onsails/lspkind-nvim'
    -- TREESITTER
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TsUpdate'
--[[
        run =   function()
                    local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                    ts_update()
                end,
--]]
    }
    -- TELESCOPE
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = {
            "nvim-lua/plenary.nvim", -- Lua development module
            "BurntSushi/ripgrep", -- characters finding
            "sharkdp/fd" -- file search
        },
        config = function()
                    require('telescope').setup{}
                 end
    }
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'kyazdani42/nvim-web-devicons'
    -- AUTO-PAIRS
    use 'jiangmiao/auto-pairs'
    -- UNDOTREE
    use 'mbbill/undotree'
    -- MULTIPLE CURSORS
    use 'mg979/vim-visual-multi'
    -- SURROUND
    use 'machakann/vim-sandwich'
    -- TABLE
    use 'dhruvasagar/vim-table-mode'
    -- EASYMOTION
    use 'easymotion/vim-easymotion'
    -- START PAGE
    use 'mhinz/vim-startify'
end)
