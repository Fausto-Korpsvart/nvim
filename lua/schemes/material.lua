-- https://github.com/marko-cerovac/material.nvim

require('material').setup {
    styles = {
        comments = { italic = true },
        strings = { bold = true },
        keywords = { bold = true },
        functions = { bold = true },
        variables = {},
        operators = {},
        types = {},
    },
    plugins = {
        'gitsigns',
        'hop',
        'indent-blankline',
        'lspsaga',
        'neogit',
        'nvim-cmp',
        'nvim-web-devicons',
        'telescope',
        'trouble',
    },
    lualine_style = 'stealth',
}

vim.g.material_style = 'deep ocean' -- deep ocean|palenight
