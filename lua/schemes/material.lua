-- https://github.com/marko-cerovac/material.nvim

local material_ok, material = pcall(require, 'material')
if not material_ok then
    return
end

material.setup {
    contrast = {
        terminal = false,
        sidebars = false,
        floating_windows = false,
        cursor_line = false,
        non_current_windows = false,
        filetypes = {},
    },

    styles = { -- Give comments style such as bold, italic, underline etc.
        comments = { italic = true },
        strings = { bold = true },
        keywords = { bold = true },
        functions = { bold = true },
        variables = {},
        operators = {},
        types = {},
    },

    plugins = {
        'dap',
        'dashboard',
        'gitsigns',
        'hop',
        'indent-blankline',
        'lspsaga',
        'neogit',
        'nvim-cmp',
        'nvim-tree',
        'nvim-web-devicons',
        'telescope',
        'trouble',
    },

    disable = {
        colored_cursor = false,
        borders = false,
        background = false,
        term_colors = false,
        eob_lines = false,
    },

    high_visibility = {
        lighter = false,
        darker = false,
    },

    lualine_style = 'stealth', -- default

    async_loading = true,
}

vim.g.material_style = 'deep ocean' -- deep ocean|palenight
-- vim.cmd 'colorscheme material'
