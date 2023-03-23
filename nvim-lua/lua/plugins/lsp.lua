-- Keymap
local keymap = vim.keymap

local opts = { noremap = true, silent = true }
keymap.set('n', '<LEADER>e', vim.diagnostic.open_float, opts)
keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
keymap.set('n', '<LEADER>q', vim.diagnostic.setloclist, opts)

-- Use an `on_attach` function to only map the following keys after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

    keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    keymap.set('n', 'gd', ':Telescope lsp_definitions<CR>', bufopts)
    keymap.set('n', '<LEADER>D', ':Telescope lsp_type_definitions<CR>', bufopts)
    keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>', bufopts)
    keymap.set('n', 'gr', ':Telescope lsp_references<CR>', bufopts)

    keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

    keymap.set('n', '<LEADER>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    keymap.set('n', '<LEADER>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    keymap.set('n', '<LEADER>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)

    keymap.set('n', '<LEADER>rn', vim.lsp.buf.rename, bufopts)

    keymap.set('n', '<LEADER>ca', vim.lsp.buf.code_action, bufopts)

    keymap.set('n', '<LEADER>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require('mason').setup({
    ui = {
        check_outdated_packages_on_open = true, -- Whether to automatically check for new versions when opening the :Mason window.
        border = 'solid', -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        width = 0.8,
        height = 0.8,
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗'
        }
    },
    keymaps = {
        toggle_package_expand   = '<CR>', -- expand a package
        install_package         = 'i', -- install a package
        update_package          = 'u', -- reinstall/update a package
        check_package_version   = 'c', -- check for new version
        update_all_packages     = 'U', -- update all installed packages
        check_outdated_packages = 'C', -- check which installed packeages are outdated
        uninstall_package       = 'X', -- uninstall a package
        cancel_installation     = '<C-c>', -- cancel a package installation
        apply_language_filter   = '<C-f>', -- apply language filter
    },
})

require('mason-lspconfig').setup({
    ensure_installed = {},
    automatic_installation = true
})

local server = { 'clangd', 'pyright', 'tsserver', 'rust_analyzer', 'lua_ls', 'cmake' }

local lsp_flags = {
    debounce_text_changes = 50,
}

-- cmp-nvim-lsp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, lsp in ipairs(server) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities
    }
end

require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

require('lspconfig').cmake.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    init_options = {
        buildDirectory = "build"
    }
}
