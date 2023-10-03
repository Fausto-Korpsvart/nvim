require('mini.surround').setup {
	custom_surroundings = nil,
	highlight_duration = 500,
	mappings = {
		add = 'ss',
		delete = 'ssd',
		find = 'ssf',
		find_left = 'ssF',
		highlight = 'ssh',
		replace = 'ssr',
		update_n_lines = 'ssn',
		suffix_last = 'l',
		suffix_next = 'n',
	},

	n_lines = 30,

	respect_selection_type = false,

	search_method = 'cover',

	silent = false,
}
