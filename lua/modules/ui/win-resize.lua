vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = false

require('windows').setup {
	autowidth = {
		enable = true,
		winwidth = 0,
		filetype = {
			help = 2,
		},
	},
	ignore = {
		buftype = { 'quickfix' },
		filetype = { 'neo-tree' },
	},
	animation = {
		enable = true,
		duration = 50,
		fps = 60,
		easing = 'in_out_sine',
	},
}

vim.keymap.set('n', '<Leader>wt', '<CMD>WindowsToggleAutowidth<CR>')
vim.keymap.set('n', '<Leader>ew', '<CMD>WindowsEnableAutowidth<CR>')
vim.keymap.set('n', '<Leader>dw', '<CMD>WindowsDisableAutowidth<CR>')

vim.keymap.set('n', '<Leader>we', '<CMD>WindowsEqualize<CR>')
vim.keymap.set('n', '<Leader>wm', '<CMD>WindowsMaximize<CR>')
vim.keymap.set('n', '<Leader>wv', '<CMD>WindowsMaximizeVertically<CR>')
vim.keymap.set('n', '<Leader>wh', '<CMD>WindowsMaximizeHorizontally<CR>')
