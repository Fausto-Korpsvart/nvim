return {
    -- User Interface
    { -- Alpha<[[[
        -- https://github.com/goolord/alpha-nvim
        'goolord/alpha-nvim',
        config = function()
            -- Variables<[[[
            local alpha_ok, alpha = pcall(require, 'alpha')
            if not alpha_ok then
                return
            end

            local path_ok, plenary_path = pcall(require, 'plenary.path')
            if not path_ok then
                return
            end

            local dashboard = require 'alpha.themes.dashboard'
            local cdir = vim.fn.getcwd()
            local if_nil = vim.F.if_nil

            local nvim_web_devicons = {
                enabled = true,
                highlight = true,
            }
            -- ]]]>
            -- Functions<[[[
            local function get_extension(fn)
                local match = fn:match '^.+(%..+)$'
                local ext = ''
                if match ~= nil then
                    ext = match:sub(2)
                end
                return ext
            end

            local function icon(fn)
                local nwd = require 'nvim-web-devicons'
                local ext = get_extension(fn)
                return nwd.get_icon(fn, ext, { default = true })
            end

            local function file_button(fn, sc, short_fn, autocd)
                short_fn = short_fn or fn
                local ico_txt
                local fb_hl = {}
                if nvim_web_devicons.enabled then
                    local ico, hl = icon(fn)

                    local hl_option_type = type(nvim_web_devicons.highlight)

                    if hl_option_type == 'boolean' then
                        if hl and nvim_web_devicons.highlight then
                            table.insert(fb_hl, { hl, 0, 3 })
                        end
                    end
                    if hl_option_type == 'String' then
                        table.insert(fb_hl, { nvim_web_devicons.highlight, 0, 3 })
                    end
                    ico_txt = ico .. '  '
                else
                    ico_txt = ''
                end

                local cd_cmd = (autocd and ' | cd %:p:h' or '')

                local file_button_el =
                dashboard.button(sc, ico_txt .. short_fn, '<cmd>e ' .. fn .. cd_cmd .. ' <CR>')

                local fn_start = short_fn:match '.*[/\\]'
                if fn_start ~= nil then
                    table.insert(fb_hl, { 'Type', #ico_txt - 2, #fn_start + #ico_txt })
                end
                file_button_el.opts.hl = fb_hl

                return file_button_el
            end

            local default_mru_ignore = { 'gitcommit' }

            local mru_opts = {
                ignore = function(path, ext)
                    return (string.find(path, 'COMMIT_EDITMSG'))
                        or (vim.tbl_contains(default_mru_ignore, ext))
                end,
                autocd = false,
            }

            local function mru(start, cwd, items_number, opts)
                opts = opts or mru_opts
                items_number = if_nil(items_number, 10)
                local oldfiles = {}
                for _, v in pairs(vim.v.oldfiles) do
                    if #oldfiles == items_number then
                        break
                    end
                    local cwd_cond
                    if not cwd then
                        cwd_cond = true
                    else
                        cwd_cond = vim.startswith(v, cwd)
                    end
                    local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
                    if (vim.fn.filereadable(v) == 1) and cwd_cond and not ignore then
                        oldfiles[#oldfiles + 1] = v
                    end
                end

                local target_width = 35

                local tbl = {}

                for i, fn in ipairs(oldfiles) do
                    local short_fn
                    if cwd then
                        short_fn = vim.fn.fnamemodify(fn, ':.')
                    else
                        short_fn = vim.fn.fnamemodify(fn, ':~')
                    end
                    if #short_fn > target_width then
                        short_fn = plenary_path.new(short_fn):shorten(1, { -2, -1 })
                        if #short_fn > target_width then
                            short_fn = plenary_path.new(short_fn):shorten(1, { -1 })
                        end
                    end

                    local shortcut = tostring(i + start - 1)
                    local file_button_el = file_button(fn, shortcut, short_fn, opts.autocd)
                    tbl[i] = file_button_el
                end

                return {
                    type = 'group',
                    val = tbl,
                    opts = { hl = 'Number' },
                }
            end

            -- ]]]>
            -- Header<[[[
            local function pick_color()
                local colors = { 'String', 'Identifier', 'Keyword', 'Number' }
                return colors[math.random(#colors)]
            end

            local header = {

                type = 'text',
                val = {
                    [[                                 ]],
                    [[                                 ]],
                    [[ ▐ ▄ ▄▄▄ .       ▌ ▐·▪  • ▌ ▄ ·. ]],
                    [[•█▌▐█▀▄.▀·▪     ▪█·█▌██ ·██ ▐███▪]],
                    [[▐█▐▐▌▐▀▀▪▄ ▄█▀▄ ▐█▐█•▐█·▐█ ▌▐▌▐█·]],
                    [[██▐█▌▐█▄▄▌▐█▌.▐▌ ███ ▐█▌██ ██▌▐█▌]],
                    [[▀▀ █▪ ▀▀▀  ▀█▄▀▪. ▀  ▀▀▀▀▀  █▪▀▀▀]],
                },
                opts = {
                    position = 'center',
                    hl = pick_color(),
                },
            }
            -- ]]]>
            -- Recent<[[[
            local recent = {
                type = 'group',
                val = {
                    {
                        type = 'text',
                        val = 'Recent files',
                        opts = {
                            hl = pick_color(),
                            shrink_margin = false,
                            position = 'center',
                        },
                    },
                    { type = 'padding', val = 1 },
                    {
                        type = 'group',
                        val = function()
                            return { mru(1, cdir, 9) }
                        end,
                        opts = { shrink_margin = false },
                    },
                },
            }
            -- ]]]>
            -- Buttons<[[[
            local button = {
                type = 'group',
                val = {
                    {
                        type = 'text',
                        val = 'Quick links',
                        opts = { hl = pick_color(), position = 'center' },
                    },
                    { type = 'padding', val = 1 },
                    dashboard.button('n', '  New File', ':ene <BAR> startinsert<CR>'),
                    dashboard.button(
                        'r',
                        'ﭯ  Recent Files',
                        ':lua require"telescope.builtin".oldfiles()<CR>'
                    ),
                    dashboard.button('f', '  Find Files', ':Telescope find_files<CR>'),
                    dashboard.button('g', '  Grep Code', ':Telescope live_grep<CR>'),
                    dashboard.button('T', '  Terminal', ':ToggleTerm<CR>'),
                    dashboard.button(
                        'S',
                        '  Git Status',
                        ':lua require("telescope.builtin").git_status()<CR>'
                    ),
                    dashboard.button(
                        'C',
                        '  Git Commits',
                        ':lua require("telescope.builtin").git_commits()<CR>'
                    ),
                    dashboard.button(
                        't',
                        '  Colorschemes',
                        ':e ~/.config/nvim/lua/schemes/init.lua<CR>'
                    ),
                    dashboard.button('u', '  Lazy Manager', ':Lazy check<CR>'),
                    dashboard.button(
                        'i',
                        '  Lazy Init',
                        ':e ~/.config/nvim/lua/plugins/init.lua<CR>'
                    ),
                    dashboard.button('n', '  Neovim Init', ':e ~/.config/nvim/init.lua<CR>'),
                    dashboard.button(
                        'o',
                        '  Neovim Config',
                        ':e ~/.config/nvim/lua/options/init.lua<CR>'
                    ),
                    dashboard.button('h', '  Neovim Health', ':checkhealth<CR>'),
                    dashboard.button('q', '  Exit Neovim', ':qa<CR>'),
                },
                position = 'center',
            }
            -- ]]]>
            -- Footer<[[[
            local footer = function()
                local datetime = os.date '  﨟%a %d,%b %y '
                local version = ' nvim '
                    .. vim.version().major
                    .. '.'
                    .. vim.version().minor
                    .. '.'
                    .. vim.version().patch
                -- .. datetime
                local lazy_ok, lazy = pcall(require, 'lazy')
                if lazy_ok then
                    local total_plugins = '   ' .. lazy.stats().count .. ' Plugins'
                    return version .. total_plugins .. datetime
                else
                    return version
                end
            end

            local footer = {
                type = 'group',
                val = {
                    {
                        type = 'text',
                        val = footer(),
                        opts = { hl = pick_color(), position = 'center' },
                    },
                },
            }
            -- ]]]>
            local opts = { -- <[[[
                layout = {
                    { type = 'padding', val = 1 },
                    header,
                    { type = 'padding', val = 2 },
                    recent,
                    { type = 'padding', val = 2 },
                    button,
                    { type = 'padding', val = 2 },
                    footer,
                },
                opts = {
                    margin = 5,
                },
            } -- ]]]>

            alpha.setup(opts)
        end,
    }, -- ]]]>
    { -- Dressing<[[[
        'stevearc/dressing.nvim',
        event = 'VeryLazy',
        config = function()
            require('dressing').setup {}
        end,
    }, -- ]]]>
    { -- Fidget<[[[
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
    }, -- ]]]>
    { -- Indentline<[[[
        -- https://github.com/lukas-reineke/indent-blankline.nvim
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
    }, -- ]]]>
    { -- legendary<[[[
        'mrjones2014/legendary.nvim',
        event = 'BufRead',
        config = function()
            -- https://github.com/mrjones2014/legendary.nvim

            local legendary_ok, legendary = pcall(require, 'legendary')
            if not legendary_ok then
                return
            end

            legendary.setup {
                include_builtin = false,
                include_legendary_cmds = false,
                select_prompt = 'keymaps | Commands',
                col_separator_char = '│',
                most_recent_item_at_top = true,
                cache_path = string.format('%s/legendary/', vim.fn.stdpath 'cache'),
                keymaps = {
                    -- LSP & Saga
                    {
                        itemgroup = 'LSP Core & Saga',
                        description = 'Keymaps for Core LSP & Saga',
                        icon = '',
                        keymaps = {
                            -- LSP Saga
                            {
                                'fl',
                                '<CMD>Lspsaga lsp_finder<CR>',
                                description = 'Saga LSP Finder',
                            },
                            {
                                'gd',
                                '<CMD>Lspsaga goto_definition<CR>',
                                description = 'Saga GOTO Definitions',
                            },
                            {
                                'pv',
                                '<CMD>Lspsaga peek_definition<CR>',
                                description = 'Saga Peek Definitions',
                            },
                            {
                                'bd',
                                '<CMD>Lspsaga show_buf_diagnostics<CR>',
                                description = 'Saga Buffer Diagnostics',
                            },
                            {
                                'dl',
                                '<CMD>Lspsaga show_line_diagnostics<CR>',
                                description = 'Saga Line Diagnostics',
                            },
                            {
                                'pd',
                                '<CMD>Lspsaga diagnostic_jump_prev<CR>',
                                description = 'Saga Diagnostic Prev',
                            },
                            {
                                'nd',
                                '<CMD>Lspsaga diagnostic_jump_next<CR>',
                                description = 'Saga Diagnostic Next',
                            },
                            {
                                'pe',
                                '<CMD>lua require("lspsaga.diagnostic").goto_prev { severity = vim.diagnostic.severity.ERROR }<CR>',
                                description = 'Saga Diagnostic Prev Error',
                            },
                            {
                                'ne',
                                '<CMD>lua require("lspsaga.diagnostic").goto_next { severity = vim.diagnostic.severity.ERROR }<CR>',
                                description = 'Saga Diagnostic Next Error',
                            },
                            {
                                'pw',
                                '<CMD>lua require("lspsaga.diagnostic").goto_prev { severity = vim.diagnostic.severity.WARN }<CR>',
                                description = 'Saga Diagnostic Prev WARN',
                            },
                            {
                                'nw',
                                '<CMD>lua require("lspsaga.diagnostic").goto_next { severity = vim.diagnostic.severity.WARN }<CR>',
                                description = 'Saga Diagnostic Next WARN',
                            },
                            {
                                'ph',
                                '<CMD>lua require("lspsaga.diagnostic").goto_prev { severity = vim.diagnostic.severity.HINT }<CR>',
                                description = 'Saga Diagnostic Prev HINT',
                            },
                            {
                                'nh',
                                '<CMD>lua require("lspsaga.diagnostic").goto_next { severity = vim.diagnostic.severity.HINT }<CR>',
                                description = 'Saga Diagnostic Next HINT',
                            },
                            {
                                'pi',
                                '<CMD>lua require("lspsaga.diagnostic").goto_prev { severity = vim.diagnostic.severity.INFO }<CR>',
                                description = 'Saga Diagnostic Prev INFO',
                            },
                            {
                                'ni',
                                '<CMD>lua require("lspsaga.diagnostic").goto_next { severity = vim.diagnostic.severity.INFO }<CR>',
                                description = 'Saga Diagnostic Next INFO',
                            },
                            {
                                'dh',
                                '<CMD>Lspsaga hover_doc<CR>',
                                description = 'Saga Hover Documentation',
                            },
                            {
                                'ca',
                                '<CMD>Lspsaga code_action<CR>',
                                description = 'Saga Code Action',
                            },
                            {
                                'ot',
                                '<CMD>Lspsaga outline<CR>',
                                description = 'Saga Outline Toggle',
                            },
                            {
                                'ci',
                                '<CMD>Lspsaga incoming_calls<CR>',
                                description = 'Saga Incoming Calls',
                            },
                            {
                                'co',
                                '<CMD>Lspsaga outgoing_calls<CR>',
                                description = 'Saga Outgoing Calls',
                            },
                            { 'rn', '<CMD>Lspsaga rename<CR>', description = 'Saga Rename' },
                        },
                    },
                    -- Utilities
                    {
                        itemgroup = 'Utilities',
                        description = 'Keymaps for some Individual Plugins',
                        icon = '',
                        keymaps = {
                            { '<Leader>lz', '<CMD>Lazy<CR>', description = 'Lazy Manageer' },
                            { 'ms', '<CMD>Mason<CR>', description = 'Mason' },
                            { 'nf', '<CMD>Format<CR>', description = 'Format File' },
                            { 'ut', '<CMD>UndotreeToggle<CR>', description = 'Undotree Toggle' },
                            { 'dm', '<CMD>delm!<CR>', description = 'Delete Marks' },
                            { 'gl', '<CMD>Glow<CR>', description = 'Glow MD Preview' },
                            { 'cg', '<CMD>Glow!<CR>', description = 'Close Glow' },
                            { 'tr', '<CMD>TroubleToggle<CR>', description = 'Trouble Toggle' },
                            {
                                'vd',
                                '<Plug>(toggle-lsp-diag)',
                                description = 'Toggle LSP Diagnostics',
                            },
                            { 'vs', '<CMD>ObsidianSearch<CR>', description = 'Obsidian Search' },
                            { 'mi', '<CMD>MindOpenMain<CR>', description = 'Mind Open' },
                            { 'cm', '<CMD>MindClose<CR>', description = 'Mind Close' },
                            { 'nz', '<CMD>ZenMode<CR>', description = 'Zen Mode' },
                        },
                    },
                    -- GIT Intregration
                    {
                        itemgroup = 'Git Plugins',
                        description = 'Keymaps for Git Plugins',
                        icon = '',
                        keymaps = {
                            { 'ng', '<CMD>Neogit<CR>', description = 'NeoGit' },
                            { 'dv', '<CMD>DiffviewOpen<CR>', description = 'DiffView' },
                            { 'gm', '<CMD>GitMessenger<CR>', description = 'Git Messenger' },
                        },
                    },
                    -- NeoTree
                    {
                        itemgroup = 'NeoTree',
                        description = 'Keymaps for NeoTree Files Navigation',
                        icon = '',
                        keymaps = {
                            {
                                '<Leader>r',
                                '<CMD>NeoTreeFocusToggle<CR>',
                                description = 'NeoTree Focus Toggle',
                            },
                            {
                                '<Leader>e',
                                '<CMD>NeoTreeFloatToggle<CR>',
                                description = 'NeoTree Focus Floating',
                            },
                            {
                                '<Leader>g',
                                '<CMD>Neotree float git_status<CR>',
                                description = 'NeoTree Focus Show Git Status',
                            },
                            {
                                '<Leader>b',
                                '<CMD>Neotree toggle show buffers float<CR>',
                                description = 'NeoTree Focus Show Opened Buffers',
                            },
                        },
                    },
                    -- Todo Comment
                    {
                        itemgroup = 'TODO Comment',
                        description = 'Keymaps for Block & Line Comments',
                        icon = '',
                        keymaps = {
                            {
                                'to',
                                '<CMD>TodoTrouble<CR>',
                                description = 'Todo Comments in Trouble',
                            },
                            {
                                'tc',
                                '<CMD>TodoTelescope<CR>',
                                description = 'Todo Comments in Telescope',
                            },
                            {
                                'tq',
                                '<CMD>TodoQuickFix<CR>',
                                description = 'Todo Comments in QuickFix',
                            },
                            {
                                'tl',
                                '<CMD>TodoLocList<CR>',
                                description = 'Todo Comments in LocList',
                            },
                        },
                    },
                    -- Spectre
                    {
                        itemgroup = 'Spectre',
                        description = 'Keymaps for Spectre',
                        icon = '',
                        keymaps = {
                            {
                                'os',
                                '<CMD>lua require("spectre").open()<CR>',
                                description = 'Spectre',
                            },
                            {
                                'sp',
                                '<CMD>lua require("spectre").open_file_search()<CR>',
                                description = 'Spectre File Search',
                            },
                            {
                                'spw',
                                '<CMD>lua require("spectre").open_visual({select_word=true})<CR>',
                                description = 'Spectre Select Word',
                            },
                        },
                    },
                    --Treesitter
                    {
                        itemgroup = 'Treesitter',
                        description = 'Keymaps for Treesitter',
                        icon = '',
                        keymaps = {
                            { 'ts', '<CMD>TSToggle<CR>', description = 'Treesitter Toggle' },
                            {
                                'tu',
                                '<CMD>TSUpdateSync<CR>',
                                description = 'Treesitter UpdateSync',
                            },
                            {
                                'pg',
                                '<CMD>TSPlaygroundToggle<CR>',
                                description = 'Treesitter Playground',
                            },
                        },
                    },
                    -- Hop Easy Move
                    {
                        itemgroup = 'Hop & TreeHopper',
                        description = 'Keymaps for Hop Easy Move',
                        icon = '',
                        keymaps = {
                            {
                                ';l',
                                '<CMD>HopWord<CR>',
                                description = 'Hop by Word',
                                mode = { silent = true },
                            },
                            {
                                ';1',
                                '<CMD>HopChar1<CR>',
                                description = 'Hop by One Characters',
                                mode = { silent = true },
                            },
                            {
                                ';2',
                                '<CMD>HopChar2<CR>',
                                description = 'Hop by Two Characters',
                                mode = { silent = true },
                            },
                            {
                                ';j',
                                '<CMD>HopWordCurrentLine<CR>',
                                description = 'Hop by Hint in current Line',
                            },
                            {
                                ';h',
                                '<CMD>lua require"hop".hint_lines()<CR>',
                                description = 'Hop by Hint in current Column',
                            },
                        },
                    },
                    -- Emmet
                    {
                        itemgroup = 'Emmet',
                        description = 'Keymaps for Emmet',
                        icon = '',
                        keymaps = {
                            {
                                '<Leader>a',
                                '<Plug>(emmet-expand-abbr)<CR>',
                                description = 'Emmet Expand Abbreviation',
                            },
                            {
                                '<Leader>]',
                                '<Plug>(emmet-move-next)<CR>',
                                description = 'Emmet Move Next',
                            },
                            {
                                '<Leader>[',
                                '<Plug>(emmet-move-prev)<CR>',
                                description = 'Emmet Move Prev',
                            },
                        },
                    },
                    -- Bracey Live Server
                    {
                        itemgroup = 'Bracey Live Preview',
                        description = 'Keymaps for Bracey Live Server',
                        icon = '',
                        keymaps = {
                            { 'ss', '<CMD>LiveServerStart<CR>', description = 'Live Server' },
                            { 'SS', '<CMD>LiveServerStop<CR>', description = 'Stop Live Server' },
                        },
                    },
                    -- Markdown Live Preview
                    {
                        itemgroup = 'Markdown Live Preview',
                        description = 'Keymaps for Markdown Live Preview',
                        icon = '',
                        keymaps = {
                            {
                                'mp',
                                '<CMD>MarkdownPreview<CR>',
                                description = 'Markdown Live Server',
                            },
                            {
                                'sm',
                                '<CMD>MarkdownPreviewStop<CR>',
                                description = 'Stop Markdown Live Server',
                            },
                            {
                                'mt',
                                '<CMD>MarkdownPreviewToggle<CR>',
                                description = 'Toggle Markdown Live Server',
                            },
                        },
                    },
                    -- Open Links in Browser
                    {
                        itemgroup = 'Open in Browser',
                        description = 'Keymaps for Open Links in Browser',
                        icon = '',
                        keymaps = {
                            {
                                'ob',
                                '<Plug>(openbrowser-open)<CR>',
                                description = 'Open Link in Browser',
                            },
                            {
                                'oi',
                                '<Plug>(openbrowser-open-incognito)<CR>',
                                description = 'Open Link in Browser incongnito',
                            },
                            {
                                'fw',
                                '<Plug>(openbrowser-search) <cword><CR>',
                                description = 'Search Word under cursor',
                            },
                        },
                    },
                    -- Zen Mode
                    { 'nz', '<CMD>ZenMode<CR>', description = 'Toggle Zen Mode' },

                    -- Telescope
                    {
                        itemgroup = 'Telescope',
                        description = 'Keymaps for Telescope',
                        icon = '',
                        keymaps = {
                            {
                                'nt',
                                '<CMD>lua require"telescope".extensions.noice.noice(require("telescope.themes").get_dropdown({}))<CR>',
                                description = 'Telescope Noice',
                            },
                            {
                                'tg',
                                '<CMD>lua require"telescope.builtin".live_grep()<CR>',
                                description = 'Telescope Live Grep',
                            },
                            {
                                'of',
                                '<CMD>lua require"telescope.builtin".oldfiles()<CR>',
                                description = 'Telescope Recent Files',
                            },
                            {
                                'bt',
                                '<CMD>lua require"telescope.builtin".buffers()<CR>',
                                description = 'Telescope Bufers',
                            },
                            {
                                'sf',
                                '<CMD>lua require"telescope.builtin".find_files()<CR>',
                                description = 'Telescope Find Files',
                            },
                            {
                                'bf',
                                '<CMD>lua require"telescope.builtin".current_buffer_fuzzy_find()<CR>',
                                description = 'Telescope Buffer Fuzzy Find',
                            },
                        },
                    },
                },
                -- Command
                commands = {
                    {
                        itemgroup = 'Commands',
                        description = 'Neovim Default Commands',
                        icon = '',
                        commands = {
                            {
                                ':WriteBuffer',
                                '<CMD>w',
                                description = 'Save changes in current buffer',
                                opts = {},
                            },
                            {
                                ':WriteQuit',
                                '<CMD>wq!',
                                description = 'Write and Quit',
                                opts = {},
                            },
                            {
                                ':WriteAll',
                                '<CMD>wa',
                                description = 'Write all buffers',
                                opts = {},
                            },
                            {
                                ':QuitBuffer',
                                '<CMD>q',
                                description = 'Quit current buffer',
                                opts = {},
                            },
                            {
                                ':QuitNoWrite',
                                '<CMD>q!',
                                description = 'Quit buffer Without Write',
                                opts = {},
                            },
                            {
                                ':DeleteBuffer',
                                '<CMD>Bdelete',
                                description = 'Buffer Delete',
                                opts = {},
                            },
                            {
                                ':SourceFile',
                                ':source %',
                                description = 'Source Current File',
                            },
                            {
                                ':ListChar',
                                '<CMD>set list! list?',
                                description = 'Toogle EOL List Character',
                            },
                            {
                                ':LineNumber',
                                '<CMD>set nu! rnu!',
                                description = 'Toogle Line Numbers',
                            },
                            { ':Terminal', '<CMD>ToggleTerm', description = 'Run Terminal' },
                            {
                                ':SearchReplace',
                                '<CMD>EasyReplaceWord',
                                description = 'Search and Replace',
                            },
                            {
                                ':ReplaceWord',
                                '<CMD>EasyReplaceCword',
                                description = 'Search and Replace word under cursor',
                            },
                        },
                    },
                },
                scratchpad = {
                    view = 'float',
                    results_view = 'float',
                    float_border = 'rounded',
                    keep_contents = true,
                },
            }
        end,
    }, -- ]]]>
    { -- Lualine<[[[
        -- https://github.com/nvim-lualine/lualine.nvim
        'nvim-lualine/lualine.nvim',
        event = 'BufRead',
        config = function()
            local lualine = require 'lualine'

            local hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end

            -- Left Side<[[[
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
                symbols = {
                    modified = ' ',
                    readonly = '',
                    unnamed = '凜',
                    newfile = ' ',
                },
            }

            local filetype = {
                'filetype',
                colored = true,
                icon_only = true,
                icons_enabled = true,
                color = { gui = 'bold' },
                padding = { right = 1, left = 0 },
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
            }

            local progress = {
                'progress',
                color = { gui = 'bold', fg = '#89ddff' },
                padding = { left = 1, right = 1 },
            }

            -- Inactive Section<[[[
            local filetype_short = {
                'filetype',
                icon_only = true,
                icons_enabled = true,
                color = { gui = 'bold' },
                padding = { right = 0, left = 1 },
            }

            local filename_short = {
                'filename',
                file_status = true,
                color = { gui = 'bold', fg = '#c0caf5' },
                symbols = {
                    modified = ' ',
                    readonly = '',
                    unnamed = '凜',
                    newfile = ' ',
                },
            } -- ]]]>
            -- ]]]>

            -- Right Side<[[[
            local diagnostics = {
                'diagnostics',
                sources = {
                    'nvim_lsp',
                    'nvim_diagnostic',
                    'nvim_workspace_diagnostic',
                    'vim_lsp',
                },
                diagnostics_color = {
                    error = { fg = '#f7768e', gui = 'bold' },
                    warn = { fg = '#ff9e64', gui = 'bold' },
                    info = { fg = '#0db9d7', gui = 'bold' },
                    hint = { fg = '#bb9af7', gui = 'bold' },
                },
                symbols = { error = '  ', warn = '  ', info = '  ', hint = '  ' },
                update_in_insert = true,
                cond = hide_in_width,
            }

            local diff = {
                'diff',
                symbols = { added = ' 烙', modified = '  ', removed = '  ' },
                diff_color = {
                    added = { fg = '#4fd6be', gui = 'bold' },
                    modified = { fg = '#c3e88d', gui = 'bold' },
                    removed = { fg = '#f7768e', gui = 'bold' },
                },
                cond = hide_in_width,
            }

            local branch = {
                'branch',
                icons_enabled = true,
                icon = '',
                color = { bg = '#f34f29', gui = 'bold' },
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

                    local s = require 'null-ls.sources'
                    local available_sources = s.get_available(buf_ft)
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
            -- Inactive Section<[[[
            local lsp_servers_short = {
                function()
                    local buf_ft = vim.bo.filetype
                    local clients = vim.lsp.buf_get_clients()
                    local client_names = {}

                    for _, client in pairs(clients) do
                        if client.name ~= 'null-ls' then
                            table.insert(client_names, client.name)
                        end
                    end

                    local s = require 'null-ls.sources'
                    local available_sources = s.get_available(buf_ft)
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
                color = { gui = 'bold', fg = '#4fd6be' },
            } -- ]]]>
            -- ]]]>

            -- Decorations<[[[
            local bar = {
                function()
                    return '▊'
                end,
                color = { bg = '#f7768e', fg = '#f7768e' },
                padding = { left = 0, right = 0 },
            } -- ]]]>

            lualine.setup {
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
                    lualine_b = { filename, filetype },
                    lualine_c = { spaces, location, filesize, searchcount },
                    lualine_x = { diagnostics, diff },
                    lualine_y = { branch },
                    lualine_z = { lsp_servers },
                },
                inactive_sections = {
                    lualine_c = {
                        bar,
                        filetype_short,
                        filename_short,
                        filesize,
                        progress,
                        searchcount,
                    },
                    lualine_x = { lsp_servers_short, bar },
                },
            }
        end,
    }, -- ]]]>
    { -- Neo-Tree<[[[
        -- https://github.com/nvim-neo-tree/neo-tree.nvim
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v2.x',
        event = 'BufRead',
        dependencies = {
            's1n7ax/nvim-window-picker',
            config = function()
                require('window-picker').setup {
                    fg_color = '#16161e',
                    current_win_hl_color = '#ff007c',
                    other_win_hl_color = '#4fd6be',
                }
            end,
        },
        config = function()
            local neotree = require 'neo-tree'

            neotree.setup {
                close_if_last_window = true,
                popup_border_style = 'rounded',
                default_component_configs = {
                    indent = {
                        padding = 0,
                        indent_marker = '', -- │
                        last_indent_marker = '⏵', -- ⏵└
                    },
                    icon = {
                        folder_closed = '',
                        folder_open = '⏷',
                        folder_empty = '🗀',
                    },
                    modified = {
                        symbol = '',
                    },
                    name = {
                        use_git_status_colors = false,
                    },
                    git_status = {
                        symbols = {
                            added = '✚',
                            deleted = '✖',
                            modified = '•',
                            renamed = '﮺',
                            staged = '•',
                            unstaged = '○',
                            untracked = '',
                            conflict = '',
                            ignored = '×',
                        },
                    },
                },
                window = {
                    position = 'right',
                    width = 35,
                    popup = {
                        position = { col = '50%', row = '10' },
                        size = function(state)
                            local root_name = vim.fn.fnamemodify(state.path, ':~')
                            local root_len = string.len(root_name) + 4
                            return {
                                width = math.max(root_len, 60),
                                height = vim.o.lines - 30,
                            }
                        end,
                    },
                    mappings = {
                        ['?'] = 'show_help',
                        ['T'] = 'toggle_node',
                        ['l'] = 'open',
                        ['h'] = 'close_node',
                        ['s'] = 'split_with_window_picker',
                        ['v'] = 'vsplit_with_window_picker',
                    },
                },
                filesystem = {
                    follow_current_file = true,
                    group_empty_dirs = true,
                    use_libuv_file_watcher = true,
                    filtered_items = {
                        visible = true,
                        hide_dotfiles = false,
                        hide_gitignored = false,
                        hide_hidden = false,
                        hide_by_name = {
                            '.DS_Store',
                            'thumbs.db',
                            'node_modules',
                        },
                    },
                    commands = {
                        -- Override delete to use trash instead of rm
                        delete = function(state)
                            local path = state.tree:get_node().path
                            vim.fn.system { 'trash', vim.fn.fnameescape(path) }
                            require('neo-tree.sources.manager').refresh(state.name)
                        end,
                    },
                    window = {
                        mappings = {
                            ['u'] = 'navigate_up',
                            ['cf'] = 'clear_filter',
                        },
                    },
                },
                buffers = {
                    window = {
                        mappings = {
                            ['h'] = 'navigate_up',
                        },
                    },
                },
                -- event_handlers = {<[[[
                --   {
                --     -- Close when open files
                --     event = 'file_opened',
                --     handler = function(file_path)
                --       require('neo-tree').close_all()
                --     end,
                --   },
                -- },]]]>
            }
        end,
    }, -- ]]]>
    { -- Noice<[[[
        'folke/noice.nvim',
        event = 'VimEnter',
        config = function()
            -- https://github.com/folke/noice.nvim

            local noice = require 'noice'

            noice.setup {
                cmdline = {
                    view = 'cmdline',
                    format = {
                        cmdline = { icon = ' Command:' },
                        search_up = { icon = ' Search⮭:' },
                        search_down = { icon = ' Search⮯:' },
                    },
                },
                messages = {
                    view = 'mini',
                    view_error = 'mini',
                    view_warn = 'mini',
                },
                views = {
                    mini = {
                        win_options = {
                            winblend = 0,
                        },
                    },
                },
                routes = {
                    {
                        filter = {
                            event = 'msg_show',
                            kind = 'search_count',
                        },
                        opts = { skip = true },
                    },
                },
            }
        end,
    }, -- ]]]>
    { -- Notifier<[[[
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
    }, -- ]]]>
    { -- NUI<[[[
        'MunifTanjim/nui.nvim',
        event = 'VeryLazy',
    }, -- ]]]>
    { -- Scrollview<[[[
        -- https://github.com/dstein64/nvim-scrollview
        'dstein64/nvim-scrollview',
        event = 'BufRead',
        config = function()
            require('scrollview').setup {
                excluded_filetypes = { 'neo-tree' },
                current_only = true,
                winblend = 50,
                base = 'right',
            }
        end,
    }, -- ]]]>
    { -- Telescope<[[[
        'nvim-telescope/telescope.nvim',
        module = true,
        cmd = 'Telescope',
        config = function()
            -- https://github.com/nvim-telescope/telescope.nvim

            local telescope = require 'telescope'
            local actions = require 'telescope.actions'

            telescope.setup {
                defaults = {
                    prompt_prefix = '    ',
                    selection_caret = '⯈ ',
                    path_display = { 'absolute' }, -- hidden, tail, absolute, smart, shorten, truncate
                    mappings = {
                        n = {
                            ['q'] = actions.close,
                            ['l'] = actions.select_default,
                            ['s'] = actions.select_horizontal,
                            ['v'] = actions.select_vertical,

                            ['j'] = actions.move_selection_next,
                            ['k'] = actions.move_selection_previous,
                            ['H'] = actions.move_to_top,
                            ['M'] = actions.move_to_middle,
                            ['L'] = actions.move_to_bottom,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        theme = 'dropdown',
                        previewer = false,
                        border = true,
                    },
                    live_grep = {
                        theme = 'dropdown',
                    },
                    oldfiles = {
                        theme = 'dropdown',
                        previewer = false,
                        border = true,
                    },
                    buffers = {
                        theme = 'dropdown',
                        previewer = false,
                        border = true,
                    },
                    current_buffer_fuzzy_find = {
                        theme = 'dropdown',
                    },
                },
                extensions = {
                    ['bookmarks'] = {
                        selected_browser = 'brave',
                        url_open_plugin = 'open_browser',
                        full_path = true,
                    },
                },
            }
            telescope.load_extension 'noice'
        end,
    }, -- ]]]>
    { -- Todo Comments<[[[
        'folke/todo-comments.nvim',
        event = 'BufRead',
        config = function()
            local fix = '#db4b4b'
            local hack = '#ff9e64'
            local note = '#1abc9c'
            local todo = '#0db9d7'
            local warn = '#ffc777'
            local perf = '#bb9af7'
            local test = '#3e68d7'
            require('todo-comments').setup {
                keywords = {
                    FIX = { icon = ' ', color = fix },
                    HACK = { icon = ' ', color = hack },
                    NOTE = { icon = ' ', color = note },
                    PERF = { icon = ' ', color = perf },
                    TODO = { icon = ' ', color = todo },
                    WARN = { icon = ' ', color = warn },
                    TEST = { icon = 'ﭧ ', color = test },
                },
            }
        end,
    }, -- ]]]>
    { -- Trouble<[[[
        -- https://github.com/folke/trouble.nvim
        'folke/trouble.nvim',
        config = function()
            local trouble = require 'trouble'

            trouble.setup {
                width = 35,
                height = 10,
                mode = 'workspace_diagnostics', -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
                fold_open = '',
                fold_closed = '⊙',
                action_keys = {
                    jump = { 'l', '<tab>' },
                },
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
    }, -- ]]]>
    { -- Undo Tree<[[[
        'mbbill/undotree',
        event = 'BufRead',
        config = function()
            -- https://github.com/mbbill/undotree

            vim.g.undotree_RelativeTampstamp = 1
            vim.g.undotree_ShortIndocators = 1
            vim.g.undotree_HelpLine = 1
            vim.g.undotree_WindowLayout = 3
            vim.g.undotree_SplitWidth = 35
            vim.g.undotree_DiffpanelHeight = 15
            vim.g.undotree_SetFocusWhenToggle = 1

            vim.cmd [[
                if has("persistent_undo")
                set hid
                set undodir=~/.cache/nvim/undodir
                set undofile
                endif
            ]]
        end,
    }, -- ]]]>
    { -- Web Dev Icons<[[[
        'kyazdani42/nvim-web-devicons',
        event = 'BufRead',
    }, -- ]]]>
}
