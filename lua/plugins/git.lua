return {
    { -- https://github.com/sindrets/diffview.nvim
        'sindrets/diffview.nvim',
        event = 'BufRead',
        config = function()
            local diffview = require 'diffview'
            local callback = require('diffview.config').diffview_callback

            diffview.setup {
                enhanced_diff_hl = true,
                use_icons = true,
                icons = {
                    folder_closed = '',
                    folder_open = '',
                },
                signs = {
                    fold_closed = '»',
                    fold_open = '',
                },
                file_panel = {
                    win_config = {
                        position = 'right',
                        width = 35,
                    },
                },
                key_bindings = {
                    disable_defaults = false,
                    file_panel = {
                        ['l'] = callback 'select_entry',
                        ['R'] = callback 'refresh_files',
                        ['L'] = callback 'open_commit_log',
                    },
                    file_history_panel = {
                        ['l'] = callback 'select_entry',
                    },
                },
            }
        end,
    },
    { -- https://github.com/rhysd/git-messenger.vim
        'rhysd/git-messenger.vim',
        event = 'BufRead',
        config = function()
            vim.g.git_messenger_always_into_popup = true
            vim.g.git_messenger_include_diff = 'current'
            vim.g.git_messenger_date_format = '%b %d %Y %X'
            vim.g.git_messenger_floating_win_opts = { border = 'none' }
        end,
    },
    { -- https://github.com/TimUntersberger/neogit
        'TimUntersberger/neogit',
        event = 'BufRead',
        config = function()
            local neogit = require 'neogit'

            neogit.setup {
                disable_commit_confirmation = true,
                signs = {
                    section = { '▸', '▾' },
                    item = { '▎', '▾' },
                    hunk = { '▎', '▾' },
                },
                integrations = {
                    diffview = true,
                },
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
    { -- https://github.com/lewis6991/gitsigns.nvim
        'lewis6991/gitsigns.nvim',
        event = 'BufRead',
        config = function()
            local gitsigns = require 'gitsigns'

            gitsigns.setup {
                signs = {
                    add          = { text = '▏' },
                    change       = { text = '▏' },
                    delete       = { text = '▏' },
                    topdelete    = { text = '▏' },
                    changedelete = { text = '▏' },
                    untracked    = { text = '▏' },
                },
                signcolumn = true,
                numhl = true,
                current_line_blame_formatter = '<author>-<author_time:%b-%m,%Y>-<summary>',
                preview_config = {
                    border = 'none',
                },
                trouble = true,
            }
        end,
    },
}
