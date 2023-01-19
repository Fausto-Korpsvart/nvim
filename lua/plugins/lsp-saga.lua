return {
    { -- https://github.com/glepnir/lspsaga.nvim
        'glepnir/lspsaga.nvim',
        event = 'BufRead',
        config = function()
            require('lspsaga').setup {
                finder = {
                    edit = { 'l' },
                    vsplit = 'v',
                    split = 's',
                    tabe = 't',
                },
                definition = {
                    edit = '<C-o>',
                    vsplit = '<C-v>',
                    split = '<C-s>',
                    tabe = '<C-t>',
                },
                rename = {
                    quit = 'q',
                    exec = '<CR>',
                    in_select = true,
                    whole_project = false,
                },
                outline = {
                    win_width = 35,
                    auto_preview = false,
                    auto_close = false,
                },
                callhierarchy = {
                    show_detail = true,
                    keys = {
                        vsplit = 'v',
                        split = 's',
                        jump = 'n',
                    },
                },
                symbol_in_winbar = {
                    separator = '  ',
                    color_mode = true,
                },
                ui = {
                    title = false,
                    expand = '▸',
                    collaspe = '▾',
                    code_action = '',
                    diagnostic = ' ',
                    colors = {
                        normal_bg = '#191726',
                        title_bg = '#191726',
                        red = '#ff757f',
                        magenta = '#c099ff',
                        orange = '#ff966c',
                        yellow = '#ffc777',
                        green = '#c3e88d',
                        cyan = '#86e1fc',
                        blue = '#7ca1f2',
                        purple = '#fca7ea',
                        white = '#c8d3f5',
                        black = '#191726', --1e2030
                    },
                },
            }
        end,
    },
}
