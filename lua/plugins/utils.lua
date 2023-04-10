return {
    { -- https://github.com/nvim-lua/plenary.nvim
        'nvim-lua/plenary.nvim',
        module = true,
    },
    { -- https://github.com/WhoIsSethDaniel/toggle-lsp-diagnostics.nvim
        'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
        event = 'BufReadPost',
        keys = {
            vim.keymap.set('n', 'vd', '<Plug>(toggle-lsp-diag)'),
        },
        config = function()
            require('toggle_lsp_diagnostics').init(vim.diagnostic.config())
        end,
    },
    { -- https://github.com/haringsrob/nvim_context_vt
        'haringsrob/nvim_context_vt',
        event = 'VeryLazy',
        config = function()
            require('nvim_context_vt').setup {
                prefix = '',
                highlight = 'ContextVt',
                min_rows_ft = { 'css' },
                disable_virtual_lines = true,
            }
        end,
    },
    -- { -- https://github.com/j-hui/fidget.nvim
    --     'j-hui/fidget.nvim',
    --     event = 'VeryLazy',
    --     config = function()
    --         require('fidget').setup {
    --             text = { spinner = 'dots_snake', done = '' },
    --             align = { bottom = false },
    --             window = { blend = 0 },
    --         }
    --     end,
    -- },
    { -- https://github.com/ellisonleao/glow.nvim
        'ellisonleao/glow.nvim',
        event = 'VeryLazy',
        keys = {
            vim.keymap.set('n', 'gl', '<CMD>Glow<CR>'),
            vim.keymap.set('n', 'cg', '<CMD>Glow!<CR>'),
        },
        config = function()
            require('glow').setup { border = 'none', style = 'dark', width = 150, height = 150 }
        end,
    },
    {
        'Pocco81/HighStr.nvim',
        event = 'VeryLazy',
        keys = {
            vim.keymap.set('v', '<Leader>h', ':<c-u>HSHighlight 1<CR>'),
            vim.keymap.set('v', '<Leader>y', ':<c-u>HSRmHighlight<CR>'),
        },
        config = function()
            require('high-str').setup {
                verbosity = 0,
                saving_path = '/tmp/highstr/',
                highlight_colors = {
                    color_0 = { '#0c0d0e', 'smart' }, -- Cosmic charcoal
                    color_1 = { '#e5c07b', 'smart' }, -- Pastel yellow
                    color_2 = { '#7FFFD4', 'smart' }, -- Aqua menthe
                    color_3 = { '#8A2BE2', 'smart' }, -- Proton purple
                    color_4 = { '#FF4500', 'smart' }, -- Orange red
                    color_5 = { '#008000', 'smart' }, -- Office green
                    color_6 = { '#0000FF', 'smart' }, -- Just blue
                    color_7 = { '#FFC0CB', 'smart' }, -- Blush pink
                    color_8 = { '#FFF9E3', 'smart' }, -- Cosmic latte
                    color_9 = { '#7d5c34', 'smart' }, -- Fallow brown
                },
            }
        end,
    },
    { -- https://github.com/onsails/lspkind.nvim
        'onsails/lspkind.nvim',
        event = 'VeryLazy',
    },
    { -- https://github.com/vigoux/notifier.nvim
        'vigoux/notifier.nvim',
        event = 'VeryLazy',
        config = function()
            require('notifier').setup {
                components = { 'nvim', 'lsp' },
                notify = { clear_time = 9999, min_level = vim.log.levels.INFO },
                component_name_recall = false,
                zindex = 50,
            }
        end,
    },
    {
        'rcarriga/nvim-notify',
        event = 'VeryLazy',
        config = function()
            require('notify').setup {
                minimum_width = 20,
                render = 'compact',
                stages = 'static',
                top_down = true,
                on_open = function(win)
                    -- vim.api.nvim_win_set_option(win, 'winblend', 50)
                    vim.api.nvim_win_set_config(win, { zindex = 200 })
                end,
            }
        end,
    },
    { -- https://github.com/epwalsh/obsidian.nvim
        'epwalsh/obsidian.nvim',
        -- event = 'VeryLazy',
        keys = {
            vim.keymap.set('n', 'vs', '<CMD>ObsidianSearch<CR>'),
        },
        config = function()
            require('obsidian').setup {
                dir = '~/@fausto/dev/Obsidian-Vault',
                completion = { nvim_cmp = true },
            }
        end,
    },
    { -- https://github.com/tyru/open-browser.vim
        'tyru/open-browser.vim',
        event = 'VeryLazy',
        keys = {
            vim.keymap.set('n', 'ob', '<Plug>(openbrowser-open)<CR>'),
            vim.keymap.set('n', 'sw', '<Plug>(openbrowser-search) <cword><CR>'),
            vim.keymap.set('n', 'sb', '<Plug>(openbrowser-smart-search)<CR>'),
        },
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
    { -- https://github.com/folke/zen-mode.nvim
        'folke/zen-mode.nvim',
        event = 'VeryLazy',
        config = function()
            require('zen-mode').setup {}
        end,
    },
    { -- https://github.com/nvim-tree/nvim-web-devicons
        'kyazdani42/nvim-web-devicons',
        event = 'VeryLazy',
    },
}
