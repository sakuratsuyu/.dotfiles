local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<M-e>', ':NvimTreeToggle<CR>', opts)
keymap.set('v', '<M-e>', '<ESC>:NvimTreeToggle<CR>', opts)

-- Disable netrw, the builtin file explorer
local g = vim.g
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- When to open nvim tree
local function open_nvim_tree(data)
    -- local is_real_file = vim.fn.filereadable(data.file) == 1
    local is_a_directory = vim.fn.isdirectory(data.file) == 1

    -- Open nvim tree when open a directory
    if is_a_directory then
        vim.cmd.cd(data.file)
        require('nvim-tree.api').tree.open()
        return
    end

    -- Open nvim tree when open a file
    -- if is_real_file then
    --     require('nvim-tree.api').tree.toggle { focus = false, find_file = true }
    --     return
    -- end
end

local autocmd = vim.api.nvim_create_autocmd
autocmd({ 'VimEnter' }, { callback = open_nvim_tree })

require('nvim-tree').setup {
    auto_reload_on_write = true,                -- Reloads the explorer every time a buffer is written to.
    sort_by = 'case_sensitive',
    on_attach = 'disable',
    remove_keymaps = false,                     -- Remove default keymaps
    view = {
        adaptive_size = false,                  -- Resize the window on each draw based on the longest line.
        centralize_selection = false,           -- When entering nvim-tree, reposition the view so that the current node is initially centralized.
        cursorline = true,
        debounce_delay = 15,
        width = 40,
        hide_root_folder = false,
        side = 'left',
        number = true,
        relativenumber = true,
        signcolumn = 'yes',
        mappings = {
            custom_only = true,
            list = {
                { key = { '<CR>', '<2-LeftMouse>' },      action = 'edit' },
                { key = 'to',                             action = 'edit_in_place' },
                { key = 'O',                              action = 'edit_no_picker' },
                { key = { '<C-]>', '<2-RightMouse>' },    action = 'cd' },
                { key = '<C-v>',                          action = 'vsplit' },
                { key = '<C-h>',                          action = 'split' },
                { key = { '<C-t>', 'o' },                 action = 'tabnew' },
                { key = 'K',                              action = 'prev_sibling' },
                { key = 'J',                              action = 'next_sibling' },
                { key = 'P',                              action = 'parent_node' },
                { key = '<BS>',                           action = 'close_node' },
                { key = '<Tab>',                          action = 'preview' },
                { key = 'H',                              action = 'first_sibling' },
                { key = 'L',                              action = 'last_sibling' },
                { key = 'tc',                             action = 'toggle_git_clean' },
                { key = 'ti',                             action = 'toggle_git_ignored' },
                { key = 'th',                             action = 'toggle_dotfiles' },
                { key = 'tb',                             action = 'toggle_no_buffer' },
                { key = 'tt',                             action = 'toggle_custom' },
                { key = 'R',                              action = 'refresh' },
                { key = 'a',                              action = 'create' },
                { key = 'd',                              action = 'remove' },
                { key = 'D',                              action = 'trash' },
                { key = 'r',                              action = 'rename' },
                { key = '<C-r>',                          action = 'full_rename' },
                { key = 'e',                              action = 'rename_basename' },
                { key = 'x',                              action = 'cut' },
                { key = 'y',                              action = 'copy' },
                { key = 'p',                              action = 'paste' },
                { key = 'c',                              action = 'copy_name' },
                { key = 'C',                              action = 'copy_path' },
                { key = 'gc',                             action = 'copy_absolute_path' },
                { key = '[d',                             action = 'prev_diag_item' },
                { key = '[g',                             action = 'prev_git_item' },
                { key = ']d',                             action = 'next_diag_item' },
                { key = ']g',                             action = 'next_git_item' },
                { key = '-',                              action = 'dir_up' },
                { key = 's',                              action = 'system_open' },
                { key = 'f',                              action = 'live_filter' },
                { key = 'F',                              action = 'clear_live_filter' },
--                { key = 'q',                               action = 'close' },
                { key = 'W',                              action = 'collapse_all' },
                { key = 'E',                              action = 'expand_all' },
                { key = 'S',                              action = 'search_node' },
                { key = '.',                              action = 'run_file_command' },
                { key = '<C-k>',                          action = 'toggle_file_info' },
                { key = 'g?',                             action = 'toggle_help' },
                { key = 'm',                              action = 'toggle_mark' },
--                { key = 'bmv',                            action = 'bulk_move' },
            },
        },
        float = {
            enable = false,
            quit_on_focus_loss = true,
            open_win_config = {
                relative = 'editor',
                border = 'single',
                width = 30,
                height = 30,
                row = 1,
                col = 1,
            },
        },
    },
    renderer = {
        group_empty = true,                     -- Compact folders that only contain a single folder into one node in the file tree.
        highlight_git = false,
        full_name = false,
        highlight_opened_files = 'none',
        highlight_modified = 'none',
        root_folder_label = ':p:~',
        indent_width = 2,
        indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
                corner = '└',
                edge = '│',
                item = '│',
                bottom = '─',
                none = ' ',
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = 'after',
            modified_placement = 'signcolumn',
            padding = ' ',
            symlink_arrow = ' ➛ ',
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
                modified = true,
            },
            glyphs = {
                default = '',
                symlink = '',
                bookmark = '',
                modified = '●',
                folder = {
                    arrow_closed = '',
                    arrow_open = '',
                    default = '',
                    open = '',
                    empty = '',
                    empty_open = '',
                    symlink = '',
                    symlink_open = '',
                },
                git = {
                    unstaged = '',
                    staged = '✓',
                    unmerged = '',
                    renamed = '',
                    untracked = '',
                    deleted = '',
                    ignored = '',
                },
            },
        },
        special_files = { 'Cargo.toml', 'makefile', 'Makefile', 'README.md', 'readme.md' }, -- A list of filenames that gets highlighted with `NvimTreeSpecialFile`.
        symlink_destination = true,
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = false,
        update_root = false,
        ignore_list = {},
    },
    ignore_ft_on_setup = {},
    system_open = {
        cmd = '',
        args = {},
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
        },
        icons = {
            hint = '',
            info = '',
            warning = '',
            error = '',
        },
    },
    filters = {
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = { '^.git$' },
        exclude = {},
    },
    filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
        ignore_dirs = {},
    },
    git = {
        enable = true,
        ignore = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 400,
    },
    modified = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
        },
        expand_all = {
            max_folder_discovery = 300,
            exclude = {'.git', '.vscode', 'site'},
        },
        file_popup = {
            open_win_config = {
                col = 1,
                row = 1,
                relative = 'cursor',
                border = 'shadow',
                style = 'minimal',
            },
        },
        open_file = {
            quit_on_open = false,                   -- Closes the explorer when opening a file.
            resize_window = true,                   -- Resizes the tree when opening a file.
            window_picker = {
                enable = true,
                picker = 'default',
                chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
                exclude = {
                    filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
                    buftype = { 'nofile', 'terminal', 'help' },
                },
            },
        },
        remove_file = {
            close_window = true,                    -- Close any window displaying a file when removing the file from the tree.
        },
    },
    live_filter = {
        prefix = ': ',
        always_show_folders = true,
    },
    tab = {
        sync = {                                    -- Configuration for syncing nvim-tree across tabs.
            open = true,
            close = true,
            ignore = {},
        },
    },
}
