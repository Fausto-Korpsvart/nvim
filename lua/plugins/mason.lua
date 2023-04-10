return {
    { -- MASON LSP https://github.com/williamboman/mason.nvim
        -- https://github.com/williamboman/mason-lspconfig.nvim
        'williamboman/mason.nvim',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'jay-babu/mason-null-ls.nvim',
        },
        keys = {
            vim.keymap.set('n', 'ms', '<CMD>Mason<CR>'),
        },
        config = function()
            require('mason').setup {
                ui = {
                    border = 'single',
                    icons = {
                        package_installed = '',
                        package_pending = '﯀',
                        package_uninstalled = '',
                    },
                    keymaps = { toggle_package_expand = 'l', uninstall_package = 'x' },
                },
                log_level = vim.log.levels.INFO,
            }
            require('mason-lspconfig').setup {
                ensure_installed = {
                    'cssls',
                    -- 'cssmodules_ls',
                    'eslint',
                    'html',
                    'jsonls',
                    'lemminx',
                    'lua_ls',
                    'pyright',
                    'remark_ls',
                    'tsserver',
                    'yamlls',
                },
                automatic_installation = true,
            }
            require('mason-null-ls').setup {
                ensure_installed = {
                    'black',
                    'eslint',
                    'flake8',
                    'prettier',
                    'shellcheck',
                    'shfmt',
                    'stylua',
                },
            }
        end,
    },
}
