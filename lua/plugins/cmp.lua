return {
    { -- https://github.com/hrsh7th/nvim-cmp
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'lukas-reineke/cmp-rg',
            { 'tzachar/cmp-tabnine', build = './install.sh' },
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            local cmp = require 'cmp'
            cmp.setup {
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ['<C-p>'] = cmp.mapping(require('cmp').mapping.select_prev_item(), { 'i', 's', 'c' }),
                    ['<C-n>'] = cmp.mapping(require('cmp').mapping.select_next_item(), { 'i', 's', 'c' }),
                    ['<C-l>'] = cmp.mapping(require('cmp').mapping.confirm({ select = false }), { 'i', 's', 'c' }),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'cmp_tabnine' },
                    { name = 'nvim_lua' },
                    { name = 'path' },
                    { name = 'buffer' },
                    { name = 'rg' },
                },
                formatting = {
                    fields = { 'abbr', 'kind', 'menu' },
                    format = function(entry, vim_item)
                        vim_item.kind =
                        require('lspkind').symbolic(vim_item.kind, { mode = 'symbol_text' })
                        vim_item.menu = ({
                            nvim_lsp = 'lsp',
                            luasnip = 'snp',
                            cmp_tabnine = 'tbn',
                            nvim_lua = 'lua',
                            path = 'pth',
                            buffer = 'buf',
                            rg = 'rip',
                        })[entry.source.name]
                        if entry.source.name == 'cmp_tabnine' then
                            local detail = (entry.completion_item.data or {}).detail
                            vim_item.kind = ' tabnine'
                            if detail and detail:find '.*%%.*' then
                                vim_item.kind = vim_item.kind .. ' ' .. detail
                            end

                            if (entry.completion_item.data or {}).multiline then
                                vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
                            end
                        end
                        local maxwidth = 800
                        vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
                        return vim_item
                    end,
                },
                window = {
                    completion = { border = 'single' },
                    documentation = { border = 'single' },
                },
            }
            require('cmp').setup.cmdline({ '/', '?' }, {
                sources = { { name = 'buffer' } },
            })
            require('cmp').setup.cmdline(':', {
                sources = cmp.config.sources {
                    { name = 'cmdline' },
                    { name = 'path' },
                },
            })
        end,
    },
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            'rafamadriz/friendly-snippets',
            config = function()
                require('luasnip.loaders.from_vscode').lazy_load()
            end,
        },
        opts = {
            history = true,
            delete_check_events = 'TextChanged',
        },
    },
}
