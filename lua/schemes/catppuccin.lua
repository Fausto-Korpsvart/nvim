-- https://github.com/catppuccin/nvim

local catppuccin_ok, catppuccin = pcall(require, 'catppuccin')
if not catppuccin_ok then
    return
end

catppuccin.setup {
    dim_inactive = {
        enabled = false,
        shade = 'dark',
        percentage = 0.15,
    },
    transparent_background = false,
    term_colors = false,
    compile = {
        enabled = false,
        path = vim.fn.stdpath 'cache' .. '/catppuccin',
    },
    styles = {
        booleans = { 'bold' },
        comments = { 'bold' },
        conditionals = { 'bold' },
        functions = { 'bold' },
        keywords = { 'bold' },
        loops = {},
        number = { 'bold' },
        operators = {},
        properties = { 'bold' },
        strings = {},
        types = { 'bold' },
        variables = {},
    },
    integrations = {
        treesitter = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { 'bold' },
                hints = { 'bold' },
                warnings = { 'bold' },
                information = { 'bold' },
            },
            underlines = {
                errors = { 'underline' },
                hints = { 'underline' },
                warnings = { 'underline' },
                information = { 'underline' },
            },
        },
        lsp_trouble = true,
        cmp = true,
        gitsigns = true,
        telescope = true,
        neotree = {
            enabled = true,
            show_root = true,
            transparent_panel = true,
        },
        dap = {
            enabled = false,
            enable_ui = false,
        },
        indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
        },
        neogit = true,
        markdown = true,
        ts_rainbow = true,
        hop = true,
        notify = true,
    },
}

vim.g.catppuccin_flavour = 'mocha' -- mocha|macchiato|frappe|latte
vim.cmd 'colorscheme catppuccin'
