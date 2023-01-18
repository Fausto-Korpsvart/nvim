-- https://github.com/folke/lazy.nvim

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if vim.fn.isdirectory(lazypath) == 0 then
    print "Installing lazy\n\nClose and reopen neovim when it's done..."
    vim.fn.system {
        'git',
        'clone',
        'https://github.com/folke/lazy.nvim.git',
        lazypath,
    }
end

vim.opt.runtimepath:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup('plugins', {
    install = {
        colorscheme = { 'tokyonight' },
    },
    ui = {
        size = { width = 0.9, height = 0.8 },
        border = 'none',
        icons = {
            cmd = ' ',
            config = '',
            event = '',
            ft = ' ',
            init = ' ',
            import = ' ',
            keys = ' ',
            lazy = '  ',
            loaded = '',
            not_loaded = '',
            plugin = ' ',
            runtime = ' ',
            source = ' ',
            start = '',
            task = ' ',
        },
    },
})

require 'options'
require 'schemes'
