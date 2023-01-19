return {
    { -- https://github.com/NvChad/nvim-colorizer.lua
        'NvChad/nvim-colorizer.lua',
        config = function()
            local colorizer = require 'colorizer'

            colorizer.setup {
                filetypes = { '*' },
                user_default_options = {
                    mode = 'background',
                    RGB = true,
                    RRGGBB = true,
                    names = true,
                    RRGGBBAA = true,
                    AARRGGBB = true,
                    rgb_fn = true,
                    hsl_fn = true,
                    css = true,
                    css_fn = true,
                    tailwind = true,
                    sass = { enable = true, parsers = { 'css' } },
                    virtualtext = 'ﱢﱢﱢﱢﱢﱢ', --   ﱢ
                },
                buftypes = {},
            }
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
                pager = false,
                width = 150,
                height = 150,
            }
        end,
    },
    { -- https://github.com/aurum77/live-server.nvim
        'aurum77/live-server.nvim',
        config = function()
            require('live_server.util').install()
            require('live_server').setup {
                port = 8080,
                browser_command = '',
                quiet = false,
                no_css_inject = true,
            }
        end,
        cmd = { 'LiveServer', 'LiveServerStart', 'LiveServerStop' },
    },
    { -- https://github.com/iamcco/markdown-preview.nvim
        'iamcco/markdown-preview.nvim',
        build = function()
            vim.fn['mkdp#util#install']()
        end,
        ft = 'markdown',
    },
    { -- https://github.com/MunifTanjim/prettier.nvim
        -- https://prettier.io/docs/en/options.html
        'MunifTanjim/prettier.nvim',
        event = 'BufRead',
        config = function()
            local prettier_ok, prettier = pcall(require, 'prettier')
            if not prettier_ok then
                return
            end

            prettier.setup {
                bin = 'prettierd', -- or prettierd -> https://github.com/fsouza/prettierd | npm install -g @fsouza/prettierd
                filetypes = {
                    'css',
                    'html',
                    'javascript',
                    'javascriptreact',
                    'typescript',
                    'typescriptreact',
                    'json',
                    'less',
                    'markdown',
                    'scss',
                    'yaml',
                },
                cli_options = {
                    arrow_parens = 'avoid',
                    single_quote = true,
                    bracketSameLine = true,
                    html_whitespace_sensitivty = 'strict',
                    singleAttributePerLine = true,
                    trailing_comma = 'none',
                    semi = false,
                    proseWrap = 'always',
                },
                ['null-ls'] = {
                    condition = function()
                        return prettier.config_exists {
                            check_package_json = true,
                        }
                    end,
                    runtime_condition = function(params)
                        return true
                    end,
                    timeout = 5000,
                },
            }
        end,
    },
}
