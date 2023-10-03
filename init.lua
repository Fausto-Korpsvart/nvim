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

vim.opt.runtimepath:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'core-nv'

require('lazy').setup {
	name = 'Lazy Nvim',
	lazy = true,
	spec = { import = 'modules' },
	keys = { vim.keymap.set('n', '<Leader>lz', '<CMD>Lazy<CR>') },
	performance = { cache = { enabled = true } },
	change_detection = { enabled = true, notify = true },
	ui = { border = 'single', size = { width = 0.85, height = 0.80 } },
	install = { colorscheme = { 'tokyonight-night' } },
}

require 'colors'
