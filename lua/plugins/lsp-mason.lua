return {
    { -- https://github.com/williamboman/mason.nvim -- https://github.com/williamboman/mason-lspconfig.nvim
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup {
                ui = {
                    border = 'none',
                    icons = {
                        package_installed = '',
                        package_pending = '﯀',
                        package_uninstalled = '',
                    },
                    keymaps = {
                        toggle_package_expand = 'l',
                        uninstall_package = 'x',
                    },
                },
                log_level = vim.log.levels.INFO,
            }

            local servers = {
                'cssls',
                'eslint',
                'html',
                'jsonls',
                'lemminx',
                'pyright',
                'remark_ls',
                'sumneko_lua',
                'tsserver',
                'yamlls',
            }

            require('mason-lspconfig').setup {
                ensure_installed = servers,
                automatic_installation = true,
            }
        end,
    },
}
