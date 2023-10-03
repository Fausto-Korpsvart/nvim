require('gitsigns').setup {
	signs = {
		add = { text = '' },
		change = { text = '' },
		delete = { text = '' },
		topdelete = { text = '' },
		changedelete = { text = '' },
		untracked = { text = '' },
	},
	signcolumn = false,
	numhl = true,
	trouble = true,
	preview_config = { border = 'single' },
	current_line_blame_formatter = '<author>-<author_time:%b-%m,%Y>-<summary>',
}

vim.keymap.set('n', 'tgs', '<CMD>Gitsigns toggle_signs<CR>')
vim.keymap.set('n', 'tph', '<CMD>Gitsigns preview_hunk<CR>')
vim.keymap.set('n', 'thi', '<CMD>Gitsigns preview_hunk_inline<CR>')
vim.keymap.set('n', 'tlb', '<CMD>Gitsigns toggle_current_line_blame<CR>')
