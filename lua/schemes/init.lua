if vim.fn.has 'termguicolors' == 1 then
    vim.go.t_8f = '[[38;2;%lu;%lu;%lum'
    vim.go.t_8b = '[[48;2;%lu;%lu;%lum'
    vim.opt.termguicolors = true
    vim.opt.background = 'dark'
end

require 'schemes.catppuccin'
require 'schemes.everforest'
require 'schemes.gruvbox'
require 'schemes.kanagawa'
require 'schemes.material'
require 'schemes.nightfox'
require 'schemes.rosepine'
require 'schemes.tokyonight'

local colorscheme = 'duskfox'
local colorscheme_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)

if not colorscheme_ok then
    local notify = require 'notify'
    local messange = '/n Back to Tokyonight'
    notify('colorscheme ' .. colorscheme .. ' Not found' .. messange, 'hint')
    return vim.cmd('colorscheme ' .. 'tokyonight')
end

require 'options.hilights'
