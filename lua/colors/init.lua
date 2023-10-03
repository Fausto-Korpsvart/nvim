if vim.fn.has 'termguicolors' == 1 then
	vim.go.t_8f = '[[38;2;%lu;%lu;%lum'
	vim.go.t_8b = '[[48;2;%lu;%lu;%lum'
	vim.opt.termguicolors = true
	vim.opt.background = 'dark'
end

require 'colors.catppuccin'
require 'colors.everforest'
require 'colors.gruvbox'
require 'colors.kanagawa'
require 'colors.material'
require 'colors.nightfox'
require 'colors.rosepine'
require 'colors.tokyonight'

local colorscheme = 'tokyonight'
local colorscheme_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)

if not colorscheme_ok then
	local messange = '/n Back to Tokyonight'
	vim.notify('colorscheme ' .. colorscheme .. ' Not found' .. messange, 'hint')
	return vim.cmd('colorscheme ' .. 'tokyonight')
end

require 'colors.highlights'
