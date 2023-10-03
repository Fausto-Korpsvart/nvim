local iron = require 'iron.core'

iron.setup {
	config = {
		scratch_repl = true,
		repl_definition = {
			sh = {
				command = { 'zsh' },
			},
		},
		-- repl_open_cmd = 'vertical botright 50 split',
		-- repl_open_cmd = require('iron.view').bottom(20),
		repl_open_cmd = require('iron.view').right(50),
	},
	keymaps = {
		send_motion = '<space>sc',
		visual_send = '<space>sc',
		send_file = '<space>sf',
		send_line = '<space>sl',
		send_until_cursor = '<space>su',
		send_mark = '<space>sm',
		mark_motion = '<space>mc',
		mark_visual = '<space>mc',
		remove_mark = '<space>md',
		cr = '<space>s<cr>',
		interrupt = '<space>s<space>',
		exit = '<space>sq',
		clear = '<space>cl',
	},
	highlight = {
		italic = true,
	},
	ignore_blank_lines = true,
}

vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')
