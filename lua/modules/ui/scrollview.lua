-- require('scrollview.contrib.gitsigns').setup()

require('scrollview').setup {
	always_show = false,
	base = 'auto', -- right
	column = 1,
	hover = true,
	winblend = 10,
	zindex = 40,

	signs_column = 0, -- 1
	signs_max_per_row = 1,
	signs_overflow = 'right',
	signs_show_in_folds = true,
	signs_on_startup = { 'diagnostics', 'folds', 'search', 'spell' },
	signs_zindex = 45,

	cursor_symbol = '·',
	diagnostics_error_symbol = { '·', '⠊', '⠋' },
	diagnostics_hint_symbol = { '·', '⠊', '⠋' },
	diagnostics_info_symbol = { '·', '⠊', '⠋' },
	diagnostics_warn_symbol = { '·', '⠊', '⠋' },
	folds_symbol = '·',
	search_symbol = '·',
	spell_symbol = '·',

	excluded_filetypes = { 'alpha' },
}

vim.keymap.set('n', '<Leader>sv', '<CMD>ScrollViewToggle<CR>')
vim.keymap.set('n', '<Leader>svf', '<CMD>ScrollViewFirst<CR>')
vim.keymap.set('n', '<Leader>svl', '<CMD>ScrollViewLast<CR>')
vim.keymap.set('n', '<Leader>svn', '<CMD>ScrollViewNext<CR>')
vim.keymap.set('n', '<Leader>svp', '<CMD>ScrollViewPrev<CR>')
