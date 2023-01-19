return {
    { -- https://github.com/jose-elias-alvarez/null-ls.nvim
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require('null-ls').setup {
                sources = {
                    require('null-ls').builtins.diagnostics.tidy,
                    require('null-ls').builtins.diagnostics.flake8,
                    require('null-ls').builtins.diagnostics.eslint,
                    require('null-ls').builtins.formatting.prettier,
                    require('null-ls').builtins.formatting.eslint,
                    require('null-ls').builtins.formatting.stylua,
                    require('null-ls').builtins.formatting.black,
                    require('null-ls').builtins.formatting.beautysh,
                },
            }
        end,
    },
}
