local actions = require 'diffview.actions'

require('diffview').setup {
	diff_binaries = false,
	enhanced_diff_hl = true,
	use_icons = true,
	icons = { folder_closed = '', folder_open = '󰝰' },
	signs = { fold_closed = '⏵', fold_open = '⏷', done = '✓' },
	view = {
		default = { winbar_info = true },
		merge_tool = { disable_diagnostics = false },
	},
	file_panel = { win_config = { position = 'right', width = 40 } },
	keymaps = {
		disable_defaults = false,
		file_panel = {
			{ 'n', 'l', actions.select_entry },
		},
		file_history_panel = {
			{ 'n', 'l', actions.select_entry },
		},
	},
}

vim.keymap.set('n', 'dv', '<CMD>DiffviewOpen<CR>')
vim.keymap.set('n', 'dfh', '<CMD>DiffviewFileHistory<CR>')
