require('muren').setup {
	create_commands = true,
	filetype_in_preview = true,
	two_step = false,
	all_on_line = true,
	preview = true,
	cwd = false,
	files = '**/*',
	keys = {
		close = 'q',
		toggle_side = '<C-l>',
		toggle_options_focus = 'op',
		toggle_option_under_cursor = '<Space>',
		scroll_preview_up = '<Up>',
		scroll_preview_down = '<Down>',
		do_replace = '<CR>',
		do_undo = 'U',
		do_redo = 'R',
	},
	patterns_width = 25,
	patterns_height = 10,
	options_width = 15,
	preview_height = 10,
	order = {
		'buffer',
		'dir',
		'files',
		'two_step',
		'all_on_line',
		'preview',
	},
}

vim.keymap.set('n', 'mt', '<CMD>MurenToggle<CR>')
vim.keymap.set('n', 'mr', '<CMD>MurenRefresh<CR>')
vim.keymap.set('n', 'mu', '<CMD>MurenUnique<CR>')
