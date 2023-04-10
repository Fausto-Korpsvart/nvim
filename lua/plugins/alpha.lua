return {
    { -- https://github.com/goolord/alpha-nvim
        'goolord/alpha-nvim',
        config = function()
            -- Variables
            local alpha = require 'alpha'
            local plenary_path = require 'plenary.path'
            local dashboard = require 'alpha.themes.dashboard'
            local cdir = vim.fn.getcwd()
            local if_nil = vim.F.if_nil

            local nvim_web_devicons = {
                enabled = true,
                highlight = true,
            }

            -- Header
            local function pick_color()

                local colors = { 'String', 'Identifier', 'Keyword', 'Number' }
                return colors[math.random(#colors)]

            end

            local header = {

                type = 'text',
                val = {
                    [[                                 ]],
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

            -- More Recent Used
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

                local cd_cmd = (autocd and ' | cd %:h:t' or '')

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

                local target_width = 40

                local tbl = {}

                for i, fn in ipairs(oldfiles) do

                    local short_fn

                    if cwd then
                        short_fn = vim.fn.fnamemodify(fn, ':p:.')
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
                    opts = { hl = pick_color() },
                }
            end

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
                        opts = {
                            hl = pick_color(),
                            shrink_margin = false
                        },
                    },
                },
            }

            -- Buttons
            local button = {
                type = 'group',
                val = {
                    { type = 'text', val = 'Quick links', opts = { hl = pick_color(), position = 'center' } },
                    { type = 'padding', val = 1 },
                    dashboard.button('n', '  New File', ':ene <BAR> startinsert<CR>'),
                    dashboard.button('r', 'ﭯ  Recent Files', ':lua require"telescope.builtin".oldfiles()<CR>'),
                    dashboard.button('f', '  Find Files', ':Telescope find_files<CR>'),
                    dashboard.button('g', '  Grep Code', ':Telescope live_grep<CR>'),
                    dashboard.button('T', '  Terminal', ':ToggleTerm<CR>'),
                    dashboard.button('S', '  Git Status', ':lua require("telescope.builtin").git_status()<CR>'),
                    dashboard.button('C', '  Git Commits', ':lua require("telescope.builtin").git_commits()<CR>'),
                    dashboard.button('t', '  Colorschemes', ':e ~/.config/nvim/lua/schemes/init.lua<CR>'),
                    dashboard.button('u', '  Lazy Manager', ':Lazy check<CR>'),
                    dashboard.button('n', '  Neovim Init', ':e ~/.config/nvim/init.lua<CR>'),
                    dashboard.button('h', '  Neovim Health', ':checkhealth<CR>'),
                    dashboard.button('q', '  Exit Neovim', ':qa<CR>'),
                },
                position = 'center',
            }

            -- Footer
            local footer = function()
                local datetime = os.date '  﨟%a %d,%b %y '
                local version = ' nvim '
                    .. vim.version().major
                    .. '.'
                    .. vim.version().minor
                    .. '.'
                    .. vim.version().patch
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

            local opts = {
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
                opts = { margin = 5 },
            }

            alpha.setup(opts)
        end,
    },
}
