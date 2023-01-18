return {
    -- Code Utilities
    {
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
    {
        'editorconfig/editorconfig-vim',
        event = 'BufRead',
        config = function()
            -- https://github.com/editorconfig/editorconfig-vim

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
    {
        'phaazon/hop.nvim',
        event = 'BufRead',
        config = function()
            require('hop').setup()
        end,
    },
    {
        -- https://github.com/phaazon/mind.nvim/
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
    {
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
    {
        'windwp/nvim-spectre',
        event = 'BufRead',
        config = function()
            -- https://github.com/nvim-pack/nvim-spectre

            local spectre_ok, spectre = pcall(require, 'spectre')
            if not spectre_ok then
                return
            end

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
    {
        'tpope/vim-surround',
    },
    {
        'folke/zen-mode.nvim',
        config = function()
            require('zen-mode').setup {}
        end,
    },
}
