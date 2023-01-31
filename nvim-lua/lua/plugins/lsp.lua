-- Keymap
local keymap = vim.keymap

local opts = { noremap = true, silent = true }
keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an `on_attach` function to only map the following keys after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    
    -- Mappings.
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require("mason").setup({
    ui = {
        -- Whether to automatically check for new versions when opening the :Mason window.
        check_outdated_packages_on_open = true,

        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "solid",

        -- Width of the window. Accepts:
        -- - Integer greater than 1 for fixed width.
        -- - Float in the range of 0-1 for a percentage of screen width.
        width = 0.8,

        -- Height of the window. Accepts:
        -- - Integer greater than 1 for fixed height.
        -- - Float in the range of 0-1 for a percentage of screen height.
        height = 0.8,

        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    keymaps = {
        toggle_package_expand   = "<CR>",       -- expand a package
        install_package         = "i",          -- install a package
        update_package          = "u",          -- reinstall/update a package
        check_package_version   = "c",          -- check for new version
        update_all_packages     = "U",          -- update all installed packages
        check_outdated_packages = "C",          -- check which installed packeages are outdated
        uninstall_package       = "X",          -- uninstall a package
        cancel_installation     = "<C-c>",      -- cancel a package installation
        apply_language_filter   = "<C-f>",      -- apply language filter
    },
})

require("mason-lspconfig").setup({
    ensure_installed = {},
    automatic_installation = true
})

local server = { 'clangd', 'pyright', 'tsserver', 'rust_analyzer', 'sumneko_lua' }

local lsp_flags = {
    debounce_text_changes = 150,
}

-- cmp-nvim-lsp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, lsp in ipairs(server) do
    require('lspconfig')[lsp].setup{
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities
    }
end
