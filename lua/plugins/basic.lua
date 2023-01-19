return {
    { -- https://github.com/windwp/nvim-autopairs
        'windwp/nvim-autopairs',
        event = 'BufRead',
        config = function()
            local autopairs = require 'nvim-autopairs'
            local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
            local cmp = require 'cmp'

            autopairs.setup {
                check_ts = true,
                ts_config = {
                    lua = { 'string', 'source' },
                    javascript = { 'string', 'template_string' },
                },
                disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
            }

            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
        end,
    },
    { -- https://github.com/famiu/bufdelete.nvim
        'famiu/bufdelete.nvim',
        event = 'BufRead',
    },
    { -- https://github.com/chrisbra/changesplugin
        'chrisbra/changesplugin',
        event = 'BufRead',
        config = function()
            local g = vim.g

            g.changes_autocmd = 1
            g.changes_use_icons = 1
            g.changes_add_sign = '▸'
            g.changes_delete_sign = '▸'
            g.changes_modified_sign = '▸'
            g.ChangesLineOverview = 1
            g.changes_vcs_system = 'git'
            g.changes_vcs_check = 0
            g.changes_diff_preview = 0
            g.changes_linehi_diff = 0
            g.changes_respect_SignColumn = 1
            g.changes_fixed_sign_column = 1
        end,
    },
    { -- https://github.com/numToStr/Comment.nvim
        'numToStr/Comment.nvim',
        event = 'BufRead',
        config = function()
            local comment = require 'Comment'

            comment.setup {
                sticky = true,
                ignore = '^$',
                pre_hook = function(ctx)
                    require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()

                    if vim.bo.filetype == 'javascript' or vim.bo.filetype == 'typescript' then
                        local U = require 'Comment.utils'

                        local type = ctx.ctype == U.ctype.linewise and '__default' or '__multiline'

                        local location = nil
                        if ctx.ctype == U.ctype.blockwise then
                            location =
                            require('ts_context_commentstring.utils').get_cursor_location()
                        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                            location =
                            require('ts_context_commentstring.utils').get_visual_start_location()
                        end

                        return require('ts_context_commentstring.internal').calculate_commentstring {
                            key = type,
                            location = location,
                        }
                    end
                end,
            }
            local comment_ft = require 'Comment.ft'
            comment_ft.set('json', { '// %s', '/* %s */' })
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
    { -- https://github.com/andymass/vim-matchup
        'andymass/vim-matchup',
        config = function()
            vim.g.matchup_matchparen_offscreen = { method = 'popup', fullwidth = 1 }
        end,
    },
    { -- https://github.com/tyru/open-browser.vim
        'tyru/open-browser.vim',
        event = 'BufRead',
        config = function()
            vim.cmd [[
                let g:openbrowser_fix_hosts = {"google.com": "search.brave.com"}
                let g:openbrowser_fix_schemes = {"http": "https"}
                let g:openbrowser_search_engines = {
                    \ 'brave': 'https://search.brave.com/search?q={query}',
                    \ 'fedora': 'https://fedoramagazine.org/search?q={query}',
                    \ 'neovim': 'https://neovim.io/',
                    \ 'github': 'https://github.com/search?q={query}',
                    \ 'python': 'https://docs.python.org/dev/search.html?q={query}&check_keywords=yes&area=default',
                    \ 'twitter-search': 'https://twitter.com/search/{query}',
                    \ 'twitter-user': 'https://twitter.com/{query}',
                    \ 'devdocs': 'https://devdocs.io/#q={query}',
                    \ 'fileformat': 'https://www.fileformat.info/info/unicode/char/{query}/',
                    \}
                let g:openbrowser_default_search = "brave"
            ]]
        end,
    },
    { -- https://github.com/akinsho/toggleterm.nvim
        'akinsho/toggleterm.nvim',
        config = function()
            local toggleterm = require 'toggleterm'

            toggleterm.setup {
                size = 15,
                shading_factor = 1,
                direction = 'horizontal', -- 'horizontal' | 'tab' | 'float'
                float_opts = {
                    border = 'rounded',
                    height = 35,
                    width = 120,
                    winblend = 0,
                    highlights = {
                        border = 'Normal',
                        background = 'Background',
                    },
                },
            }
        end,
    },
}
