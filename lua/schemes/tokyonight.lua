-- https://github.com/folke/tokyonight.nvim

require('tokyonight').setup {
    style = 'moon', -- night|moon|storm|day
    lualine_bold = true,
    sidebars = { 'neo-tree', 'qf', 'help', 'vista_kind' },
}

vim.cmd 'colorscheme tokyonight'
