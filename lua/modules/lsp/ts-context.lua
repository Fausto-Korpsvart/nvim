require('treesitter-context').setup {
	enable = true,
	max_lines = 2,
	min_window_height = 2,
}
vim.keymap.set('n', '[c', function()
	require('treesitter-context').go_to_context()
end, { silent = true })
vim.keymap.set('n', 'co', '<CMD>TSContextToggle<CR>')
