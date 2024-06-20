local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath,
	}
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
	name = 'Lazy Nvim',
	lazy = true,
	spec = 'theuser.lazy',
	performance = { cache = { enabled = true } },
	change_detection = { enabled = true, notify = true },
	checker = { enabled = true, notify = true },
	install = { colorscheme = { 'tokyonight-night' } },
	ui = {
		border = 'single',
		title = ' Plugin Manager ',
		title_pos = 'right',
		size = { width = 0.85, height = 0.85 },
	},
	keys = {
		vim.keymap.set('n', '<Leader>lz', '<CMD>Lazy update<CR>'),
		vim.keymap.set('n', '<Leader>ft', '<CMD>lua require("lazy.util").float_term()<CR>'),
	},
}
