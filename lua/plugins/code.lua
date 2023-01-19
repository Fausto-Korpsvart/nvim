return {
    { -- https://github.com/windwp/nvim-autopairs
        'windwp/nvim-autopairs',
        event = 'BufRead',
        config = function()
            require('nvim-autopairs').setup {
                check_ts = true,
                ts_config = {
                    lua = { 'string', 'source' },
                    javascript = { 'string', 'template_string' },
                },
                disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
            }
            require('cmp').event:on(
                'confirm_done',
                require('nvim-autopairs.completion.cmp').on_confirm_done { map_char = { tex = '' } }
            )
        end,
    },
    { -- https://github.com/numToStr/Comment.nvim
        'numToStr/Comment.nvim',
        event = 'BufRead',
        config = function()
            require('Comment').setup {
                ignore = '^$',
                pre_hook = function()
                    require('ts_context_commentstring.internal').update_commentstring {}
                end,
            }
            require('Comment.ft').set('json', { '// %s', '/* %s */' })
        end,
    },
    { -- https://github.com/kqito/vim-easy-replace
        'kqito/vim-easy-replace',
        event = 'BufRead',
        config = function()
            vim.g.easy_replace_highlight_ctermbg = 'lightgreen'
            vim.g.easy_replace_highlight_guibg = '#c53b53'
        end,
    },
    { -- https://github.com/mattn/emmet-vim
        'mattn/emmet-vim',
        event = 'BufRead',
        config = function()
            vim.g.user_emmet_mode = 'a'
        end,
    },
    { -- https://github.com/ellisonleao/glow.nvim
        'ellisonleao/glow.nvim',
        event = 'BufRead',
        config = function()
            require('glow').setup {
                border = 'none',
                style = 'dark',
                width = 150,
                height = 150,
            }
        end,
    },
    { -- https://github.com/aurum77/live-server.nvim
        'aurum77/live-server.nvim',
        config = function()
            require('live_server.util').install()
            require('live_server').setup {}
        end,
        cmd = { 'LiveServer', 'LiveServerStart', 'LiveServerStop' },
    },
    { -- https://github.com/iamcco/markdown-preview.nvi
        'iamcco/markdown-preview.nvim',
        build = function()
            vim.fn['mkdp#util#install']()
        end,
        ft = 'markdown',
    },
    { -- https://github.com/nvim-pack/nvim-spectre
        'windwp/nvim-spectre',
        event = 'BufRead',
        config = function()
            require('spectre').setup {
                line_sep_start = '',
                result_padding = '',
                line_sep = '',
                mapping = {
                    ['enter_file'] = { map = 'l' },
                    ['send_to_qf'] = { map = '<leader>sf' },
                },
            }
        end,
    },
    { -- https://github.com/tpope/vim-surround
        'tpope/vim-surround',
    },
    { -- https://github.com/akinsho/toggleterm.nvim
        'akinsho/toggleterm.nvim',
        config = function()
            require('toggleterm').setup {
                size = 15,
                direction = 'horizontal',
            }
        end,
    },
}
