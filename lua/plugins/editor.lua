return {
    { -- https://github.com/famiu/bufdelete.nvim
        'famiu/bufdelete.nvim',
        event = 'BufRead',
    },
    { -- https://github.com/chrisbra/changesplugin
        'chrisbra/changesplugin',
        event = 'BufRead',
        config = function()
            vim.g.changes_add_sign = '▸'
            vim.g.changes_delete_sign = '▸'
            vim.g.changes_modified_sign = '▸'
            vim.g.changes_vcs_system = 'git'
            vim.g.ChangesLineOverview = 1
            vim.g.changes_respect_SignColumn = 1
            vim.g.changes_fixed_sign_column = 1
        end,
    },
    { -- https://github.com/NvChad/nvim-colorizer.lua
        'NvChad/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup {
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
            }
        end,
    },
    { -- https://github.com/editorconfig/editorconfig-vim
        'editorconfig/editorconfig-vim',
        event = 'BufRead',
        config = function()
            vim.g.EditorConfig_exec_path = '/usr/bin/editorconfig'
            vim.g.EditorConfig_core_mode = 'external_command'
            vim.g.EditorConfig_preserve_formatoptions = 1
            vim.g.EditorConfig_verbose = 0
        end,
    },
    { -- https://github.com/phaazon/hop.nvim
        'phaazon/hop.nvim',
        event = 'BufRead',
        config = function()
            require('hop').setup()
        end,
    },
    { -- https://github.com/lukas-reineke/indent-blankline.nvim
        'lukas-reineke/indent-blankline.nvim',
        event = 'BufRead',
        dependencies = {
            {
                'echasnovski/mini.indentscope',
                config = function()
                    require('mini.indentscope').setup {
                        options = { try_as_border = true },
                        symbol = '▏',
                    }
                end,
            },
        },
        config = function()
            local hl = vim.api.nvim_set_hl
            local hi_colors = { enable_colors = true }
            local function hi_lines()
                if hi_colors.enable_colors then
                    hl(0, 'IndentBlanklineIndent1', { fg = '#E06C75', blend = 0 })
                    hl(0, 'IndentBlanklineIndent2', { fg = '#E5C07B', blend = 0 })
                    hl(0, 'IndentBlanklineIndent3', { fg = '#98C379', blend = 0 })
                    hl(0, 'IndentBlanklineIndent4', { fg = '#56B6C2', blend = 0 })
                    hl(0, 'IndentBlanklineIndent5', { fg = '#61AFEF', blend = 0 })
                    hl(0, 'IndentBlanklineIndent6', { fg = '#C678DD', blend = 0 })
                    return {
                        'IndentBlanklineIndent1',
                        'IndentBlanklineIndent2',
                        'IndentBlanklineIndent3',
                        'IndentBlanklineIndent4',
                        'IndentBlanklineIndent5',
                        'IndentBlanklineIndent6',
                    }
                else
                    return
                end
            end

            require('indent_blankline').setup {
                char_list = { '', '', '', '' },
                char_highlight_list = hi_lines(),
                use_treesitter = true,
                show_current_context = false,
                show_current_context_start = false,
                indent_blankline_indent_level = 4,
                buftype_exclude = {
                    'nofile',
                    'quickfix',
                    'telescope',
                    'terminal',
                },
                filetype_exclude = {
                    'alpha',
                    'git',
                    'gitcommit',
                    'help',
                    'log',
                    'neogitstatus',
                    'TelescopePrompt',
                    'Trouble',
                },
            }
        end,
    },
    { -- https://github.com/andymass/vim-matchup
        'andymass/vim-matchup',
        config = function()
            vim.g.matchup_matchparen_offscreen = { method = 'popup', fullwidth = 1 }
        end,
    },
    { -- https://github.com/MunifTanjim/prettier.nvim
        -- https://prettier.io/docs/en/options.html
        'MunifTanjim/prettier.nvim',
        event = 'BufRead',
        config = function()
            require('prettier').setup {
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
