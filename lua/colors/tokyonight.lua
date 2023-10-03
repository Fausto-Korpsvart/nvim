require('tokyonight').setup {
	style = 'night', -- night|moon|storm|day
	transparent = false,
	dim_inactive = false,
	lualine_bold = false,
	sidebars = { 'qf', 'help', 'vista_kind', 'neo-tree' },
	styles = {
		sidebars = 'dark', -- dark|transparent|normal
		floats = 'dark',
	},
}

vim.cmd 'colorscheme tokyonight'
