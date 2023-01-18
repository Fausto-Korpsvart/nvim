-- https://github.com/folke/tokyonight.nvim

local tokyonight_ok, tokyonight = pcall(require 'tokyonight')
if not tokyonight_ok then
    return
end

tokyonight.setup {
    style = 'moon', -- night|moon|storm|day
    terminal_colors = true,
    transparent = false,
    dim_inactive = false,
    lualine_bold = true,
    hide_inactive_statusline = false,
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
