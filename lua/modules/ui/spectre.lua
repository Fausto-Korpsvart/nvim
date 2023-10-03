require('spectre').setup {
	line_sep = '',
	line_sep_start = '',
	result_padding = '',
	mapping = {
		['enter_file'] = { map = 'l' },
		['send_to_qf'] = { map = '<leader>sf' },
	},
}

vim.keymap.set('n', 'os', '<CMD>lua require("spectre").open()<CR>')
vim.keymap.set('n', 'sp', '<CMD>lua require("spectre").open_file_search()<CR>')
