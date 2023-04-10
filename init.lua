-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if vim.fn.isdirectory(lazypath) == 0 then
    print "Installing lazy\n\nClose and reopen neovim when it's done..."
    vim.fn.system { 'git', 'clone', 'https://github.com/folke/lazy.nvim.git', lazypath }
end

vim.opt.runtimepath:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup {
    keys = { vim.keymap.set('n', '<Leader>lz', '<CMD>Lazy check<CR>') },
    spec = { { import = 'plugins' } },
    install = { colorscheme = { 'tokyonight' } },
    performance = { cache = { enabled = true } },
    ui = {
        size = { width = 0.9, height = 0.8 },
        border = 'single',
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