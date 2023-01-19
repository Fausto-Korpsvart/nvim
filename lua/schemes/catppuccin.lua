-- https://github.com/catppuccin/nvim

local catppuccin = require 'catppuccin'

catppuccin.setup {
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
        cmp = true,
        gitsigns = true,
        hop = true,
        markdown = true,
        neogit = true,
        neotree = true,
        notify = true,
        telescope = true,
        treesitter = true,
        lsp_trouble = true,
        ts_rainbow = true,
    },
}

vim.g.catppuccin_flavour = 'mocha' -- mocha|macchiato|frappe|latte
vim.cmd 'colorscheme catppuccin'
