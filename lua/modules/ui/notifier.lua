vim.notify = require 'notifier'

require('notifier').setup {
	ignore_messages = {},
	-- status_width = something, -- Computed using 'columns' and 'textwidth'
	components = {
		'nvim',
		'lsp',
	},
	notify = {
		clear_time = 5000,
		min_level = vim.log.levels.INFO,
	},
	component_name_recall = false,
	zindex = 50,
}

vim.keymap.set('n', '<Leader>nr', '<CMD>NotifierReplay<CR>')
vim.keymap.set('n', '<Leader>nc', '<CMD>NotifierClear<CR>')
