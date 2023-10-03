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

	custom_colors = function(colors)
		colors.editor.bg = '#090b10'
	end,
}

vim.g.material_style = 'deep ocean' -- deep ocean|palenight
