return {
    { -- https://github.com/haringsrob/nvim_context_vt
        'haringsrob/nvim_context_vt',
        event = 'BufRead',
        config = function()
            require('nvim_context_vt').setup {
                prefix = '',
                highlight = 'ContextVt',
                min_rows_ft = { 'css' },
                disable_virtual_lines = true,
            }
        end,
    },
    { -- https://github.com/editorconfig/editorconfig-vim
        'editorconfig/editorconfig-vim',
        event = 'BufRead',
        config = function()
            local g = vim.g
            local b = vim.b

            b.EditorConfig_disable = 0
            g.EditorConfig_exec_path = '/usr/bin/editorconfig'
            g.EditorConfig_core_mode = 'external_command'
            g.EditorConfig_exclude_patterns = { 'scp://.*' }
            g.EditorConfig_max_line_indicator = 'line' -- fill|exceeding|none
            g.EditorConfig_preserve_formatoptions = 1
            g.EditorConfig_verbose = 0
        end,
    },
    { -- https://github.com/j-hui/fidget.nvim
        'j-hui/fidget.nvim',
        event = 'BufRead',
        config = function()
            require('fidget').setup {
                text = {
                    spinner = 'dots_snake',
                    done = '',
                },
                align = {
                    bottom = false,
                },
                window = {
                    blend = 0,
                },
            }
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
            local indentline = require 'indent_blankline'

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

            indentline.setup {
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
                    'packer',
                    'TelescopePrompt',
                    'Trouble',
                    'vista',
                },
            }
        end,
    },
    { -- https://github.com/phaazon/mind.nvim/
        'phaazon/mind.nvim',
        branch = 'v2.2',
        event = 'BufRead',
        config = function()
            local mind = require 'mind'

            mind.setup {
                persistence = {
                    state_path = '~/.local/share/mind.nvim/mind.json',
                    data_dir = '~/.local/share/mind.nvim/data',
                },
            }
        end,
    },
    { -- https://github.com/vigoux/notifier.nvim
        'vigoux/notifier.nvim',
        config = function()
            require('notifier').setup {
                components = {
                    'nvim',
                    'lsp',
                },
                notify = {
                    clear_time = 9999,
                    min_level = vim.log.levels.INFO,
                },
                component_name_recall = false,
                zindex = 50,
            }
        end,
    },
    { -- https://github.com/epwalsh/obsidian.nvim
        'epwalsh/obsidian.nvim',
        event = 'BufRead',
        config = function()
            require('obsidian').setup {
                dir = '~/@fausto/dev/Obsidian-Vault',
                completion = {
                    nvim_cmp = true,
                },
            }
        end,
    },
    { -- https://github.com/nvim-pack/nvim-spectre
        'windwp/nvim-spectre',
        event = 'BufRead',
        config = function()
            local spectre = require 'spectre'

            spectre.setup {
                line_sep_start = '',
                result_padding = '',
                line_sep = '',
                highlight = {
                    ui = 'String',
                    search = 'DiffChange',
                    replace = 'DiffDelete',
                },
                mapping = {
                    ['enter_file'] = {
                        map = 'l',
                        cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
                        desc = 'goto current file',
                    },
                    ['send_to_qf'] = {
                        map = '<leader>sf',
                        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
                        desc = 'send all item to quickfix',
                    },
                },
            }
        end,
    },
    { -- https://github.com/tpope/vim-surround
        'tpope/vim-surround',
    },
    { -- https://github.com/folke/zen-mode.nvim
        'folke/zen-mode.nvim',
        config = function()
            require('zen-mode').setup {}
        end,
    },
}
