require("ibl").setup {
    indent = { char = "▏" },
    exclude = {
        filetypes = {
            'startify', 'packer', 'mason', 'lspinfo',
            'Nvimtree', 'Outline',
            'help', 'terminal'
        },
        buftypes = { 'terminal' }
    }
}
