return {
    { -- https://github.com/VonHeikemen/lsp-zero.nvim
        -- Dependencies
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'b0o/schemastore.nvim',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            { 'tzachar/cmp-tabnine', build = './install.sh' },
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        },

        config = function()
            local zero = require 'lsp-zero'
            zero.preset 'recommended' -- lsp-only

            -- CMP Integration
            local kind_icons = { -- <[[[
                Text = '',
                Method = 'm',
                Function = '',
                Constructor = '',
                Field = '',
                Variable = '',
                Class = 'ﴯ',
                Interface = ' ',
                Module = '',
                Property = '',
                Unit = '',
                Value = ' ',
                Enum = '',
                Keyword = '',
                Snippet = '',
                Color = '',
                File = '',
                Reference = '',
                Folder = '',
                EnumMember = '',
                Constant = '',
                Struct = 'פּ',
                Event = '',
                Operator = '',
                TypeParameter = '',
            } -- ]]]>

            local luasnip = require 'luasnip'
            local cmp = require 'cmp'
            require('luasnip/loaders/from_vscode').lazy_load()
            local cmp_mappings = zero.defaults.cmp_mappings {
                ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's', 'c' }),
                ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's', 'c' }),
                ['<C-l>'] = cmp.mapping(cmp.mapping.confirm { select = true }, { 'i', 's', 'c' }),
                ['<C-c>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
                ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
                ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
                ['<C-e>'] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
            }
            -- Disable Tab completion & confirm with Enter
            cmp_mappings['<Tab>'] = nil
            cmp_mappings['<S-Tab>'] = nil
            cmp_mappings['<CR>'] = nil

            zero.setup_nvim_cmp {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp_mappings,
                formatting = {
                    fields = { 'abbr', 'kind', 'menu' },
                    format = function(entry, vim_item)
                        vim_item.kind =
                            string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                        if entry.source.name == 'cmp_tabnine' then
                            vim_item.kind = ' tabnine'
                            vim.api.nvim_set_hl(0, 'CmpItemKindTabnine', { fg = '#ff9e64' })
                            vim_item.kind_hl_group = 'CmpItemKindTabnine'
                        end
                        vim_item.menu = ({
                            nvim_lsp = 'lsp',
                            cmp_tabnine = 'tbn',
                            nvim_lua = 'lua',
                            luasnip = 'snp',
                            path = 'pth',
                            buffer = 'buf',
                            nvim_lsp_signature_help = 'snh',
                        })[entry.source.name]
                        return vim_item
                    end,
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'cmp_tabnine' },
                    { name = 'nvim_lua' },
                    { name = 'luasnip' },
                    { name = 'path' },
                    { name = 'buffer' },
                    { name = 'nvim_lsp_signature_help' },
                },
                confirm_opts = {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
            }
            cmp.setup.cmdline({ ':', '/', '?' }, {
                sources = {
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'cmdline' },
                },
            })

            -- ON ATTACH
            zero.on_attach(function(client, bufnr)
                local bufopt = { noremap = true, silent = true, buffer = bufnr }
                local keymap = vim.keymap.set
                local silent = { silent = true }
                -- LSP Saga Keymaps
                keymap('n', 'fl', '<CMD>Lspsaga lsp_finder<CR>', bufopt)
                keymap('n', 'gd', '<CMD>Lspsaga goto_definition<CR>', bufopt)
                keymap('n', 'pv', '<CMD>Lspsaga peek_definition<CR>', bufopt)
                keymap('n', 'bd', '<CMD>Lspsaga show_buf_diagnostics<CR>', bufopt)
                keymap('n', 'dl', '<CMD>Lspsaga show_line_diagnostics<CR>', bufopt)
                keymap('n', 'pd', '<CMD>Lspsaga diagnostic_jump_prev<CR>', bufopt)
                keymap('n', 'nd', '<CMD>Lspsaga diagnostic_jump_next<CR>', bufopt)
                keymap('n', 'pe', '<CMD>lua require("lspsaga.diagnostic").goto_prev { severity = vim.diagnostic.severity.ERROR }<CR>', silent)
                keymap('n', 'ne', '<CMD>lua require("lspsaga.diagnostic").goto_next { severity = vim.diagnostic.severity.ERROR }<CR>', silent)
                keymap('n', 'pw', '<CMD>lua require("lspsaga.diagnostic").goto_prev { severity = vim.diagnostic.severity.WARN }<CR>', silent)
                keymap('n', 'nw', '<CMD>lua require("lspsaga.diagnostic").goto_next { severity = vim.diagnostic.severity.WARN }<CR>', silent)
                keymap('n', 'ph', '<CMD>lua require("lspsaga.diagnostic").goto_prev { severity = vim.diagnostic.severity.HINT }<CR>', silent)
                keymap('n', 'nh', '<CMD>lua require("lspsaga.diagnostic").goto_next { severity = vim.diagnostic.severity.HINT }<CR>', silent)
                keymap('n', 'pi', '<CMD>lua require("lspsaga.diagnostic").goto_prev { severity = vim.diagnostic.severity.INFO }<CR>', silent)
                keymap('n', 'ni', '<CMD>lua require("lspsaga.diagnostic").goto_next { severity = vim.diagnostic.severity.INFO }<CR>', silent)
                keymap('n', 'dh', '<CMD>Lspsaga hover_doc<CR>', bufopt)
                keymap('n', 'ca', '<CMD>Lspsaga code_action<CR>', bufopt)
                keymap('v', 'va', '<CMD>Lspsaga code_action<CR>', bufopt)
                keymap('n', 'ot', '<CMD>Lspsaga outline<CR>', bufopt)
                keymap('n', 'ci', '<CMD>Lspsaga incoming_calls<CR>', bufopt)
                keymap('n', 'co', '<CMD>Lspsaga outgoing_calls<CR>', bufopt)
                keymap({ 'n', 't' }, '<Leader>t', '<CMD>Lspsaga term_toggle<CR>', bufopt)
                keymap('n', 'rn', '<CMD>Lspsaga rename<CR>', bufopt)
                keymap('n', 'nf', function()
                    vim.lsp.buf.format { async = true }
                end, bufopt)
                vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]]

            end)

            -- Languages Settings
            -- CSSLS<[[[
            zero.configure('cssls', {
                filename = {
                    'css',
                    'less',
                    'sass',
                    'scss',
                },
                settings = {
                    css = {
                        lint = {
                            unknownAtRules = 'ignore',
                        },
                    },
                    scss = {
                        lint = {
                            unknownAtRules = 'ignore',
                        },
                    },
                },
            })
            -- ]]]>
            -- ESLINT<[[[
            zero.configure('eslint', {
                filetype = {
                    'javascript',
                    'javascriptreact',
                    'javascript.jsx',
                    'react',
                    'typescript',
                    'typescriptreact',
                    'typescript.tsx',
                    'vue',
                },
                settings = {
                    codeAction = {
                        disableRuleComment = {
                            enable = true,
                            location = 'separateLine',
                        },
                        showDocumentation = {
                            enable = true,
                        },
                    },
                    codeActionOnSave = {
                        enable = false,
                        mode = 'all',
                    },
                    format = true,
                    nodePath = '',
                    onIgnoredFiles = 'off',
                    packageManager = 'npm',
                    quiet = false,
                    rulesCustomizations = {},
                    run = 'onType',
                    useESLintClass = false,
                    validate = 'on',
                    workingDirectory = {
                        mode = 'location',
                    },
                },
            })
            -- ]]]>
            -- JSONLS<[[[
            local status_ok, schemastore = pcall(require, 'schemastore')
            if not status_ok then
                return
            end
            zero.configure('jsonls', {
                init_options = {
                    provideFormatter = false,
                },
                settings = {
                    json = {
                        schemas = schemastore.json.schemas(),
                    },
                },
                setup = {
                    commands = {
                        Format = {
                            function()
                                vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line '$', 0 })
                            end,
                        },
                    },
                },
            })
            -- ]]]>
            -- PYRIGHT<[[[
            zero.configure('pyright', {
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = 'basic',
                            diagnosticMode = 'workspace',
                            inlayHints = {
                                variableTypes = true,
                                functionReturnTypes = true,
                            },
                        },
                    },
                },
            })
            -- ]]]>
            -- SUMNEKO<[[[
            zero.configure('sumneko_lua', {
                settings = {
                    Lua = {
                        hint = {
                            enable = true,
                            arrayIndex = 'Enable', -- "Enable", "Auto", "Disable"
                            await = true,
                            paramName = 'All', -- "All", "Literal", "Disable"
                            paramType = true,
                            semicolon = 'All', -- "All", "SameLine", "Disable"
                            setType = true,
                        },
                        diagnostics = {
                            globals = { 'vim' },
                        },
                    },
                },
            })
            -- ]]]>
            -- TSSERVER<[[[
            zero.configure('tsserver', {
                settings = {
                    disable_formatting = true,
                    settings = {
                        javascript = {
                            inlayHints = {
                                includeInlayEnumMemberValueHints = true,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayFunctionParameterTypeHints = true,
                                includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all';
                                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                                includeInlayPropertyDeclarationTypeHints = true,
                                includeInlayVariableTypeHints = true,
                            },
                        },
                        typescript = {
                            inlayHints = {
                                includeInlayEnumMemberValueHints = true,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayFunctionParameterTypeHints = true,
                                includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all';
                                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                                includeInlayPropertyDeclarationTypeHints = true,
                                includeInlayVariableTypeHints = true,
                            },
                        },
                    },
                },
            })
            -- ]]]>
            -- YAMLLS<[[[
            zero.configure('yamlls', {
                yaml = {
                    schemaStore = {
                        enable = true,
                    },
                },
            })
            -- ]]]>

            zero.set_preferences {
                suggest_lsp_servers = false,
                setup_servers_on_start = true,
                set_lsp_keymaps = false,
                configure_diagnostics = true,
                cmp_capabilities = true,
                manage_nvim_cmp = true,
                call_servers = 'local',
                sign_icons = {
                    error = '•',
                    warn = '•',
                    hint = '•',
                    info = '•',
                },
            }

            zero.setup()
        end,
    },
}