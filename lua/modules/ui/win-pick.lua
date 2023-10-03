require('window-picker').setup {
	hint = 'statusline-winbar',
	selection_chars = 'fjdksla;cmrueiwoqp',
	show_prompt = false,
	filter_rules = {
		autoselect_one = true,
		include_current_win = false,
		bo = {
			filetype = { 'neo-tree', 'notify' },
			buftype = { 'terminal' },
		},
	},
	highlights = {
		statusline = {
			focused = {
				fg = '#c8d3f5',
				bg = '#545c7e',
				bold = true,
			},
			unfocused = {
				fg = '#c8d3f5',
				bg = '#394b70',
				bold = true,
			},
		},
		winbar = {
			focused = {
				fg = '#c8d3f5',
				bg = '#545c7e',
				bold = true,
			},
			unfocused = {
				fg = '#c8d3f5',
				bg = '#394b70',
				bold = true,
			},
		},
	},
}
