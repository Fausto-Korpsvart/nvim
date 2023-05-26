-- https://github.com/folke/lazy.nvim
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

require('lazy').setup {
	keys = { vim.keymap.set('n', '<Leader>lz', '<CMD>Lazy check<CR>') },
	spec = { import = 'plugins' },
	install = { colorscheme = { 'tokyonight' } },
	performance = { cache = { enabled = true } },
	ui = {
		border = 'single',
		size = { width = 0.9, height = 0.8 },
		icons = {
			cmd = ' ',
			confit = ' ',
			event = '',
			ft = ' ',
			init = ' ',
			import = ' ',
			keys = ' ',
			lazy = '  ',
			loaded = ' ',
			not_loaded = ' ',
			plugin = ' ',
			runtime = ' ',
			source = ' ',
			start = ' ',
			task = ' ',
		},
	},
}

require 'options'
require 'schemes'
