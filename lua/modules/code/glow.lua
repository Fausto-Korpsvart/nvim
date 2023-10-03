require('glow').setup {
	border = 'single',
	style = 'dark',
	width = 150,
	height = 150,
}

vim.keymap.set('n', 'gl', '<CMD>Glow<CR>')
vim.keymap.set('n', 'cg', '<CMD>Glow!<CR>')
