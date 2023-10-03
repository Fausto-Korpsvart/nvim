require('hlchunk').setup {
	chunk = {
		enable = true,
		use_treesitter = true,
		support_filetypes = {
			'*.ts',
			'*.tsx',
			'*.js',
			'*.jsx',
			'*.json',
			'*.html',
			'*.sass',
			'*.css',
			'*.py',
			'*.lua',
		},
		chars = {
			horizontal_line = '─',
			vertical_line = '│',
			left_top = '┌',
			left_bottom = '└',
			right_arrow = '─',
		},
		style = {
			{ fg = '#f52a65' },
			{ fg = '#b15c00' },
		},
		error_sign = true,
	},

	indent = {
		enable = false,
		use_treesitter = false,
		chars = { '│' },
	},

	line_num = { enable = false },
	blank = { enable = false },
}
