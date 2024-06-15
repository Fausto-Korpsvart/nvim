require('clear-action').setup {
	silent = true,
	signs = {
		enable = true,
		combine = false,
		position = 'eol', -- right_align | overlay | eol
		separator = ' ',
		show_count = true,
		show_label = true,
		label_fmt = function(actions) return actions[1].title end,
		update_on_insert = false,
		icons = {
			quickfix = '󰌵   ',
			refactor = '   ',
			source = '󰿨   ',
			combined = '󱠂   ',
		},
		highlights = {
			label = 'SymbolUsageContent',
			quickfix = 'RainbowDelimiterBlue',
			refactor = 'RainbowDelimiterRed',
			source = 'RainbowDelimiterGreen',
			combined = 'RainbowDelimiterYellow',
		},
	},
	popup = {
		enable = true,
		center = false,
		border = 'single',
		hide_cursor = false,
		highlights = {
			header = 'CodeActionHeader',
			label = 'CodeActionLabel',
			title = 'CodeActionTitle',
		},
	},
	mappings = {
		code_action = '<leader>ca',
		apply_first = nil,
		quickfix = '<Leader>qf',
		quickfix_next = 'qfn',
		quickfix_prev = 'qfp',
		refactor = '<Leader>rf',
		refactor_inline = 'rfi',
		refactor_extract = 'rfe',
		refactor_rewrite = 'rfr',
		source = '<Leader>so',
	},
	quickfix_filters = {
		['lua_ls'] = {
			['unused-local'] = 'Disable diagnostics on this line',
		},
	},
}
