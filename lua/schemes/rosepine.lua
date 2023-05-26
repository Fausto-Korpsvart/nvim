-- https://github.com/rose-pine/neovim

require('rose-pine').setup {
	dark_variant = 'main', -- main|moon|dawn
	dim_nc_background = true,
	disable_italics = true,
}

vim.cmd 'colorscheme rose-pine'
