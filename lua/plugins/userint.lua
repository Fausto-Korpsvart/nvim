return {
    { -- https://github.com/stevearc/dressing.nvim
        'stevearc/dressing.nvim',
        event = 'BufEnter',
        config = function()
            require('dressing').setup {
                select = {
                    get_config = function(opts)
                        if opts.kind == 'legendary.nvim' then
                            return {
                                telescope = {
                                    layout_strategy = 'vertical',
                                    sorter = require('telescope.sorters').fuzzy_with_index_bias {},
                                },
                            }
                        else
                            return {}
                        end
                    end,
                },
            }
        end,
    },
    { -- https://github.com/b0o/incline.nvim
        'b0o/incline.nvim',
        event = 'VeryLazy',
        config = function()
            require('incline').setup {
                render = function(props)
                    local filedir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':h:t')
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
                    local icon, color = require('nvim-web-devicons').get_icon_color(filename)
                    if vim.api.nvim_buf_get_option(props.buf, 'modified') then
                        filedir = filedir
                        filename = filename
                        icon = icon .. ' ... '
                    end
                    return {
                        { ' ', filedir },
                        { ' ▸ ', filename, ' ', icon, guifg = color },
                    }
                end,
                hide = { cursorline = false, focused_win = false, only_win = false },
                highlight = {
                    groups = {
                        InclineNormal = { gui = 'bold', guifg = '#ffc777', guibg = '#16161e' },
                        InclineNormalNC = { gui = 'bold', guifg = '#41a6b5', guibg = '#16161e' },
                    },
                },
                window = {
                    margin = { vertical = 0, horizontal = 0 },
                    options = { signcolumn = 'no', wrap = true },
                },
            }
        end,
    },
    { -- https://github.com/folke/noice.nvim
        'folke/noice.nvim',
        event = 'BufEnter',
        keys = {
            vim.keymap.set('n', 'no', '<CMD>Noice<CR>'),
        },
        config = function()
            require('noice').setup {
                cmdline = {
                    view = 'cmdline',
                    format = {
                        cmdline = { icon = 'Command:' },
                        search_up = { icon = 'Search⭫:' },
                        search_down = { icon = 'Search:' },
                    },
                },
                messages = {
                    enabled = true,
                    view = 'mini',
                    view_error = 'mini',
                    view_warn = 'mini',
                    view_history = 'popup',
                    view_search = 'virtualtext',
                },
                commands = {
                    history = { view = 'popup' },
                    last = { view = 'popup' },
                    errors = { view = 'popup' },
                },
                notify = {
                    enabled = false,
                    view = 'notify',
                },

                views = {
                    popup = {
                        border = { style = 'single' },
                        win_options = { winblend = 5 },
                        position = '50%',
                        size = { width = '130', height = '20' },
                    },
                    mini = { timeout = 5000 },
                },
                routes = {
                    {
                        filter = { event = 'msg_show', kind = 'search_count' },
                        opts = { skip = true },
                    },
                    {
                        filter = {
                            event = 'msg_show',
                            min_height = 10,
                            ['not'] = { kind = { 'search_count', 'echo' } },
                        },
                        view = 'popup',
                    },
                },
            }
        end,
    },
    { -- https://github.com/MunifTanjim/nui.nvim
        'MunifTanjim/nui.nvim',
        event = 'VeryLazy',
    },
    { -- https://github.com/petertriho/nvim-scrollbar
        'petertriho/nvim-scrollbar',
        event = 'VeryLazy',
        dependencies = { -- https://github.com/kevinhwang91/nvim-hlslens
            'kevinhwang91/nvim-hlslens',
            keys = {
                vim.keymap.set('n', 'thl', '<CMD>HlSearchLensToggle<CR>'),
            },
            config = function()
                require('hlslens').setup {
                    nearest_only = true,
                    nearest_float_when = 'never', -- auto|always|never
                    float_shadow_blend = 0,
                    virt_priority = 0,
                    build_position_cb = function(plist, _, _, _)
                        require('scrollbar.handlers.search').handler.show(plist.start_pos)
                    end,
                    override_lens = function(render, posList, nearest, idx, relIdx)
                        local sfw = vim.v.searchforward == 1
                        local indicator, text, chunks
                        local absRelIdx = math.abs(relIdx)
                        if absRelIdx > 1 then
                            indicator = ('%d%s'):format(
                                absRelIdx,
                                sfw ~= (relIdx > 1) and '▲' or '▼'
                            )
                        elseif absRelIdx == 1 then
                            indicator = sfw ~= (relIdx == 1) and '▲' or '▼'
                        else
                            indicator = ''
                        end

                        local lnum, col = unpack(posList[idx])
                        if nearest then
                            local cnt = #posList
                            if indicator ~= '' then
                                text = ('[%s %d/%d]'):format(indicator, idx, cnt)
                            else
                                text = ('[%d/%d]'):format(idx, cnt)
                            end
                            chunks = { { ' ', 'Ignore' }, { text, 'HlSearchLensNear' } }
                        else
                            text = ('[%s %d]'):format(indicator, idx)
                            chunks = { { ' ', 'Ignore' }, { text, 'HlSearchLens' } }
                        end
                        render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
                    end,
                }
            end,
        },
        config = function()
            require('scrollbar').setup {
                handlers = {
                    cursor = false,
                    gitsigns = true,
                    search = true,
                    diagnostic = true,
                },
                marks = {
                    cursor = { text = '•', color = '#ff007c' },
                    Search = { text = { '│', '' }, color = '#0db9d7' },
                    Error = { text = { '│', '' }, color = '#ff757f' },
                    Warn = { text = { '│', '' }, color = '#ff966c' },
                    Info = { text = { '│', '' }, color = '#7aa2f7' },
                    Hint = { text = { '│', '' }, color = '#bb9af7' },
                    Misc = { text = { '🢒', '🢐' }, color = '#3d59a1' },
                    GitAdd = { text = '│', color = '#4fd6be' },
                    GitDelete = { text = '│', color = '#ff007c' },
                    GitChange = { text = '│', color = '#ffc777' },
                },
                excluded_buftypes = {
                    'terminal',
                },
                excluded_filetypes = {
                    'noice',
                    'lazy',
                    'prompt',
                    'TelescopePrompt',
                },
            }
        end,
    },
    { -- https://github.com/folke/todo-comments.nvim
        'folke/todo-comments.nvim',
        event = 'VeryLazy',
        config = function()
            local fix  = '#db4b4b'
            local hack = '#ff9e64'
            local note = '#1abc9c'
            local todo = '#0db9d7'
            local warn = '#ffc777'
            local perf = '#bb9af7'
            local test = '#3e68d7'
            require('todo-comments').setup {
                keywords = {
                    FIX  = { icon = ' ', color = fix },
                    HACK = { icon = ' ', color = hack },
                    NOTE = { icon = ' ', color = note },
                    PERF = { icon = ' ', color = perf },
                    TODO = { icon = ' ', color = todo },
                    WARN = { icon = ' ', color = warn },
                    TEST = { icon = 'ﭧ ', color = test },
                },
            }
        end,
    },
    { -- https://github.com/folke/trouble.nvim
        'folke/trouble.nvim',
        event = 'VeryLazy',
        config = function()
            require('trouble').setup {
                width = 40,
                height = 10,
                mode = 'workspace_diagnostics',
                fold_open = '⏷',
                fold_closed = '⏵',
                action_keys = { jump = { 'l', '<tab>' } },
                auto_close = true,
                auto_preview = true,
                auto_fold = true,
                signs = {
                    error = '',
                    warning = '',
                    hint = '',
                    information = '',
                    other = '﫠',
                },
                use_diagnostic_signs = true,
            }
        end,
    },
}
