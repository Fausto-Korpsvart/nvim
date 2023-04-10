return {
    {
        -- https://github.com/sindrets/diffview.nvim
        'sindrets/diffview.nvim',
        event = 'BufReadPre',
        keys = {
            vim.keymap.set('n', 'dv', '<CMD>DiffviewOpen<CR>'),
        },
        config = function()
            local actions = require 'diffview.actions'
            require('diffview').setup {
                diff_binaries    = false,
                enhanced_diff_hl = false,
                use_icons  = true,
                icons      = { folder_closed = '', folder_open = '⏷' },
                signs      = { fold_closed = '⏵', fold_open = '⏷', done = '✓' },
                view       = { default = { winbar_info = true }, merge_tool = { disable_diagnostics = false } },
                file_panel = { win_config = { position = 'right', width = 40 } },
                keymaps = {
                    disable_defaults = false,
                    file_panel = {
                        { 'n', 'l', actions.select_entry },
                    },
                    file_history_panel = {
                        { 'n', 'l', actions.select_entry },
                    },
                },
            }
        end,
    },
    {
        -- https://github.com/TimUntersberger/neogit
        'TimUntersberger/neogit',
        event = 'BufReadPre',
        keys = {
            vim.keymap.set('n', 'ng', '<CMD>Neogit<CR>'),
        },
        config = function()
            require('neogit').setup {
                disable_commit_confirmation = true,
                signs = {
                    section = { '▸', '▾' },
                    item    = { '│', '▾' },
                    hunk    = { '│', '▾' },
                },
                integrations = { diffview = true },
                sections = {
                    untracked = { folded = false },
                    unstaged  = { folded = false },
                    staged    = { folded = false },
                    stashes   = { folded = false },
                    unpulled  = { folded = false },
                    unmerged  = { folded = false },
                    recent    = { folded = false },
                },
            }
        end,
    },
    {
        -- https://github.com/lewis6991/gitsigns.nvim
        'lewis6991/gitsigns.nvim',
        event = 'BufReadPre',
        keys = {
            vim.keymap.set('n', 'tgs', '<CMD>Gitsigns toggle_signs<CR>'),
            vim.keymap.set('n', 'tcb', '<CMD>Gitsigns toggle_current_line_blame<CR>'),
        },
        config = function()
            require('gitsigns').setup {
                signs = {
                    add          = { text = '│' },
                    change       = { text = '│' },
                    delete       = { text = '│' },
                    topdelete    = { text = '│' },
                    changedelete = { text = '│' },
                    untracked    = { text = '│' },
                },
                signcolumn = false,
                numhl = true,
                current_line_blame_formatter = '<author>-<author_time:%b-%m,%Y>-<summary>',
                preview_config = { border = 'single' },
                trouble = true,
            }
        end,
    },
}
