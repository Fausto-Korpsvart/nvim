require('illuminate').configure {
	providers = {
		'lsp',
		'treesitter',
		'regex',
	},
	delay = 200,
	under_cursor = true,
	min_count_to_highlight = 2,
	filetypes_denylist = {
		'alpha',
		'Trouble',
		'toggleterm',
		'neogitstatus',
		'DressingSelect',
		'TelescopePrompt',
	},
}
vim.keymap.set('n', 'nr', '<CMD>lua require("illuminate").goto_next_reference(wrap)<CR>')
vim.keymap.set('n', 'pr', '<CMD>lua require("illuminate").goto_prev_reference(wrap)<CR>')
vim.keymap.set('n', 'iob', '<CMD>lua require("illuminate").textobj_select()<CR>')
