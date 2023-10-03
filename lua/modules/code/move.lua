require('mini.move').setup {
	mappings = {
		-- Move visual selection in Visual mode.
		left = '<C-S-y>',
		right = '<C-S-o>',
		down = '<C-S-u>',
		up = '<C-S-i>',
		-- Move current line in Normal mode
		line_left = '<C-S-y>',
		line_right = '<C-S-o>',
		line_down = '<C-S-u>',
		line_up = '<C-S-i>',
	},
	options = {
		reindent_linewise = true,
	},
}
