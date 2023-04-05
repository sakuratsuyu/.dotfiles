-- Create Command for packer.nvim
local create_cmd = vim.api.nvim_create_user_command

create_cmd('PackerInstall', function()
    vim.cmd([[packadd packer.nvim]])
    require('plugins').install()
end, {})
create_cmd('PackerUpdate', function()
    vim.cmd([[packadd packer.nvim]])
    require('plugins').update()
end, {})
create_cmd('PackerSync', function()
    vim.cmd([[packadd packer.nvim]])
    require('plugins').sync()
end, {})
create_cmd('PackerClean', function()
    vim.cmd([[packadd packer.nvim]])
    require('plugins').clean()
end, {})
create_cmd('PackerCompile', function()
    vim.cmd([[packadd packer.nvim]])
    require('plugins').compile()
end, {})
create_cmd('PackerStatus', function()
    vim.cmd([[packadd packer.nvim]])
    require('plugins').status()
end, {})

-- BootStrap
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()


-- Packer Config
local packer = nil

local function InitPacker()
    if packer == nil then
        packer = require('packer')
        packer.init({
            disable_commands = true,
            display = {
                -- Floating Window Config
                open_fn = function()
                    local result, win, buf = require('packer.util').float({
                        border = 'solid'
                    })
                    vim.api.nvim_win_set_option(win, 'winhighlight', 'NormalFloat:Normal')
                    return result, win, buf
                end,

                -- Symbols
                working_sym = '⟳', -- The symbol for a plugin being installed/updated
                error_sym   = '✗', -- The symbol for a plugin with an error in installation/updating
                done_sym    = '✓', -- The symbol for a plugin which has completed installation/updating
                removed_sym = '-', -- The symbol for an unused plugin which was removed
                moved_sym   = '→', -- The symbol for a plugin which was moved (e.g. from opt to start)
                header_sym  = '━', -- The symbol for the header line in packer's display

                -- Keybindings for the display window
                keybindings = {
                    quit = '<ESC>',
                    toggle_update = 'u', -- only in preview
                    continue = 'c', -- only in preview
                    toggle_info = '<CR>',
                    diff = 'd',
                    prompt_revert = 'r',
                }
            },
        })
    end

    packer.reset()
    local use = packer.use

    use { 'wbthomason/packer.nvim' }

    -- STARTUP TIME ANALYSIS
    use { 'dstein64/vim-startuptime', cmd = "StartUpTime" }

    -- START PAGE
    use { 'mhinz/vim-startify' }

    -- COLOR SCHEME
    use { 'sainnhe/everforest' }

    -- AIRLINE
--    use { 'theniceboy/eleline.vim' }
    use { 'mg979/vim-xtabline' }
    use { 'nvim-lualine/lualine.nvim' }
--    use {'akinsho/bufferline.nvim', tag = 'v3.*'}

    -- LSP
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }
    use { 'neovim/nvim-lspconfig' }

    -- CMP
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' } -- ?
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'mtoohey31/cmp-fish', ft = 'fish' }
    use { 'onsails/lspkind-nvim' }

    -- TREESITTER
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use {
        'nvim-treesitter/playground',
        after = 'nvim-treesitter'
    }
    use {
        'windwp/nvim-ts-autotag',
        after = 'nvim-treesitter'
    }

    -- AUTO-PAIRS
    -- use { 'jiangmiao/auto-pairs' }
    use { "windwp/nvim-autopairs" }

    -- MULTIPLE CURSORS
    use { 'mg979/vim-visual-multi' }

    -- SURROUNDING
    use { 'machakann/vim-sandwich' }

    -- SNIPPETS
    use { 'L3MON4D3/LuaSnip' }


    -- FILE EXPLORER
    use { 'nvim-tree/nvim-tree.lua', tag = 'nightly' }
    use { 'nvim-tree/nvim-web-devicons' }
    -- SYMBOLS
    use { 'simrat39/symbols-outline.nvim' }

    -- UNDOTREE
    use { 'mbbill/undotree' }

    -- TELESCOPE
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            "nvim-lua/plenary.nvim", -- Lua development module
        }
    }
--    use { 'nvim-telescope/telescope-file-browser.nvim' }

    -- FLOAT TERMINAL
    use { 'voldikss/vim-floaterm' }

    -- NOICE
    use({
        "folke/noice.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    })

    -- FOLD
    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
    use { 'lukas-reineke/indent-blankline.nvim' }

    -- DATABSE VISUALIZATION
    use { 'tpope/vim-dadbod' }
    use { 'kristijanhusak/vim-dadbod-ui', after = 'vim-dadbod' }
    use { 'kristijanhusak/vim-dadbod-completion', after = 'vim-dadbod' }

    -- EASYMOTION
    use { 'easymotion/vim-easymotion' }

    -- TABLE MODE
    use { 'dhruvasagar/vim-table-mode' }

    -- VIMTEX
    use { 'lervag/vimtex' }

    -- GIT
    use { 'airblade/vim-gitgutter' }
    -- GITHUB COPILOT
    use { 'github/copilot.vim' }

end

local plugins = setmetatable({}, {
    __index = function(_, key)
        InitPacker()
        return packer[key]
    end,
})

if packer_bootstrap then
    vim.cmd([[packadd packer.nvim]])
    plugins.sync()
end

return plugins
