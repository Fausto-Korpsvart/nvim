-- https://github.com/marko-cerovac/material.nvim

require('material').setup {
    contrast = {
        sidebars = true,
        floating_windows = true,
        non_current_windows = true,
    },
    plugins = {
        'gitsigns',
        'hop',
        'indent-blankline',
        'lspsaga',
        'mini',
        'neogit',
        'nvim-cmp',
        'nvim-web-devicons',
        'telescope',
        'trouble',
    },
    disable = {
        colored_cursor = true,
        borders = true,
    },

    high_visibility = {
        darker = true,
    },
    lualine_style = 'stealth',
}

vim.g.material_style = 'deep ocean' -- deep ocean|palenight

