return {
    -- Git Integration
    { -- Git Diff View<[[[
        'sindrets/diffview.nvim',
        event = 'BufRead',
        config = function()
            -- https://github.com/sindrets/diffview.nvim

            local diffview_ok, diffview = pcall(require, 'diffview')
            if not diffview_ok then
                return
            end

            local cb = require('diffview.config').diffview_callback

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
                        ['l'] = cb 'select_entry',
                        ['R'] = cb 'refresh_files',
                        ['L'] = cb 'open_commit_log',
                    },
                    file_history_panel = {
                        ['l'] = cb 'select_entry',
                    },
                },
            }
        end,
    }, -- ]]]>
    { -- Git Messenger <[[[
        'rhysd/git-messenger.vim',
        event = 'BufRead',
        config = function()
            vim.g.git_messenger_always_into_popup = true
            vim.g.git_messenger_include_diff = 'current'
            vim.g.git_messenger_date_format = '%b %d %Y %X'
            vim.g.git_messenger_floating_win_opts = { border = 'none' }
        end,
    }, -- ]]]>
    { -- Neo Git <[[[
        -- https://github.com/TimUntersberger/neogit
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
                    untracked = {
                        folded = false,
                    },
                    unstaged = {
                        folded = false,
                    },
                    staged = {
                        folded = false,
                    },
                    stashes = {
                        folded = false,
                    },
                    unpulled = {
                        folded = false,
                    },
                    unmerged = {
                        folded = false,
                    },
                    recent = {
                        folded = false,
                    },
                },
            }
        end,
    }, -- ]]]>
    { -- Git Signs <[[[
        'lewis6991/gitsigns.nvim',
        event = 'BufRead',
        config = function()
            -- https://github.com/lewis6991/gitsigns.nvim
            local gitsigns = require 'gitsigns'

            gitsigns.setup {
                signs = {
                    -- text = '▎', -- text = ▎',' '🢒', text = '‾', text = '_'
                    add = {
                        hl = 'GitSignsAdd',
                        text = '▏',
                        numhl = 'GitSignsAddNr',
                        linehl = 'GitSignsAddLn',
                    },
                    change = {
                        hl = 'GitSignsChange',
                        text = '▏',
                        numhl = 'GitSignsChangeNr',
                        linehl = 'GitSignsChangeLn',
                    },
                    delete = {
                        hl = 'GitSignsDelete',
                        text = '▏',
                        numhl = 'GitSignsDeleteNr',
                        linehl = 'GitSignsDeleteLn',
                    },
                    topdelete = {
                        hl = 'GitSignsDelete',
                        text = '▏',
                        numhl = 'GitSignsDeleteNr',
                        linehl = 'GitSignsDeleteLn',
                    },
                    changedelete = {
                        hl = 'GitSignsChange',
                        text = '▏',
                        numhl = 'GitSignsChangeNr',
                        linehl = 'GitSignsChangeLn',
                    },
                    untracked = {
                        hl = 'GitSignsAdd',
                        text = '▏',
                        numhl = 'GitSignsAddNr',
                        linehl = 'GitSignsAddLn',
                    },
                },
                signcolumn = true,
                numhl = true,
                word_diff = false,
                current_line_blame_formatter = '<author>-<author_time:%b-%m,%Y>-<summary>',
                preview_config = {
                    border = 'none',
                },
                trouble = true,
            }
        end,
    }, -- ]]]>
}
