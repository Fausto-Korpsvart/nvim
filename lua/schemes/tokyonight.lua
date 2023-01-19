-- https://github.com/folke/tokyonight.nvim

require('tokyonight').setup {
    style = 'moon', -- night|moon|storm|day
    lualine_bold = true,
    sidebars = { 'neo-tree', 'qf', 'help', 'vista_kind' },
    styles = {
        comments = { bold = true },
        keywords = { bold = true },
        functions = { bold = true },
        variables = { bold = true },
        sidebars = 'transparent',
        floats = 'transparent',
    },
}

vim.cmd 'colorscheme tokyonight'
