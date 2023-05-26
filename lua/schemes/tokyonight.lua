-- https://github.com/folke/tokyonight.nvim

require('tokyonight').setup {
	style = 'night', -- night|moon|storm|day
	transparent = true,
	dim_inactive = false,
	lualine_bold = true,
	sidebars = { 'qf', 'help', 'vista_kind' },
	styles = {
		sidebars = 'transparent', -- dark|transparent|normal
		floats = 'normal',
	},
}

vim.cmd 'colorscheme tokyonight'
