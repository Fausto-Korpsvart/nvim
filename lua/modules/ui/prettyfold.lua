require('pretty-fold').setup {
	sections = {
		left = {
			function()
				return string.rep('', vim.v.foldlevel)
			end,
			'content',
		},
		right = {
			'number_of_folded_lines',
			': ',
			'percentage',
		},
	},
	fill_char = ' ',
	remove_fold_markers = true,
	keep_indentation = true,
	process_comment_signs = false,
	add_close_pattern = true,
	matchup_patterns = {
		{ '{', '}' },
		{ '%(', ')' },
		{ '%[', ']' },
	},
	ft_ignore = { 'neorg' },
}
