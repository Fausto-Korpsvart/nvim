return {
    { -- Lualine
        -- https://github.com/nvim-lualine/lualine.nvim
        'nvim-lualine/lualine.nvim',
        event = 'BufRead',
        config = function()
            local hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end

            -- Left Side
            local fileformat = {
                'fileformat',
                symbols = { unix = ' ' }, --        
                color = { gui = 'bold' },
                padding = { left = 1, right = 0 },
            }

            local filename = {
                'filename',
                newfile_status = true,
                color = { gui = 'bold' },
                symbols = { modified = ' ', readonly = '', unnamed = '凜', newfile = ' ' },
            }

            local filetype = {
                'filetype',
                colored = true,
                icon_only = true,
                icons_enabled = true,
                color = { gui = 'bold' },
                padding = { right = 0, left = 1 },
            }

            local spaces = {
                function()
                    return ' ↹ ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
                end,
                color = { gui = 'bold', fg = '#bb9af7' },
                padding = { left = 1, right = 1 },
                cond = hide_in_width,
            }

            local location = {
                'location',
                color = { gui = 'bold', fg = '#89ddff' },
                padding = { left = 1, right = 1 },
                cond = hide_in_width,
            }

            local filesize = {
                'filesize',
                color = { gui = 'bold', fg = '#4fd6be' },
                padding = { left = 1, right = 1 },
                cond = hide_in_width,
            }

            local searchcount = {
                'searchcount',
                color = { gui = 'bold', fg = '#0db9d7' },
                padding = { left = 1, right = 1 },
                cond = hide_in_width,
            }

            local progress = {
                'progress',
                color = { gui = 'bold', fg = '#89ddff' },
                padding = { left = 1, right = 1 },
                cond = hide_in_width,
            }

            -- Right Side
            local diagnostics = {
                'diagnostics',
                diagnostics_color = {
                    error = { fg = '#f7768e', gui = 'bold' },
                    warn = { fg = '#ff9e64', gui = 'bold' },
                    info = { fg = '#0db9d7', gui = 'bold' },
                    hint = { fg = '#bb9af7', gui = 'bold' },
                },
                symbols = { error = '  ', warn = '  ', info = '  ', hint = '  ' },
                update_in_insert = true,
            }

            local diff = {
                'diff',
                symbols = { added = ' 烙', modified = '  ', removed = '  ' },
                diff_color = {
                    added = { fg = '#4fd6be', gui = 'bold' },
                    modified = { fg = '#c3e88d', gui = 'bold' },
                    removed = { fg = '#f7768e', gui = 'bold' },
                },
            }

            local branch = {
                'branch',
                icons_enabled = true,
                icon = '',
                color = { gui = 'bold' },
            }

            local lsp_servers = {
                function()
                    local buf_ft = vim.bo.filetype
                    local clients = vim.lsp.buf_get_clients()
                    local client_names = {}

                    for _, client in pairs(clients) do
                        if client.name ~= 'null-ls' then
                            table.insert(client_names, client.name)
                        end
                    end

                    local sources = require 'null-ls.sources'
                    local available_sources = sources.get_available(buf_ft)
                    local registered = {}

                    for _, source in ipairs(available_sources) do
                        for method in pairs(source.methods) do
                            registered[method] = registered[method] or {}
                            table.insert(registered[method], source.name)
                        end
                    end

                    local formatter = registered['NULL_LS_FORMATTING']

                    if formatter ~= nil then
                        vim.list_extend(client_names, formatter)
                    end

                    local client_names_str = table.concat(client_names, ' ')
                    local language_servers = ''
                    local client_names_str_len = #client_names_str

                    if client_names_str_len ~= 0 then
                        language_servers = client_names_str .. '  '
                        return language_servers
                    end
                end,

                padding = { left = 1, right = 1 },
                color = { gui = 'bold' },
            }
            -- Inactive Section
            local lsp = {
                function()
                    local names = {}
                    for _, server in pairs(vim.lsp.get_active_clients { bufnr = 0 }) do
                        table.insert(names, server.name)
                    end
                    return '' .. table.concat(names, ' ') .. '  '
                end,
                padding = { left = 1, right = 1 },
                color = { gui = 'bold', fg = '#4fd6be' },
            }

            -- Decorations
            local bar = {
                function()
                    return '▊'
                end,
                color = { bg = '#f7768e', fg = '#f7768e' },
                padding = { left = 0, right = 0 },
            }

            require('lualine').setup {
                options = {
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = {
                            'alpha',
                            'DiffviewFiles',
                            'diffpanel',
                            'mind',
                            'neo-tree',
                            'toggleterm',
                            'Trouble',
                            'undotree',
                        },
                    },
                },
                sections = {
                    lualine_a = { fileformat },
                    lualine_b = { branch },
                    lualine_c = { spaces, location, filesize, searchcount },
                    lualine_x = { diagnostics, diff },
                    lualine_y = {},
                    lualine_z = { lsp_servers },
                },
                inactive_sections = {
                    lualine_c = {
                        bar,
                        filetype,
                        filename,
                        filesize,
                        progress,
                        searchcount
                    },
                    lualine_x = { lsp, bar },
                },
            }
        end,
    },
}
