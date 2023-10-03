require('nightfox').setup {
	options = {
		transparent = false,
		dim_inactive = false,
		modules = {
			cmp = true,
			diagnostic = true,
			fidget = true,
			gitsigns = true,
			hop = false,
			illuminate = true,
			lsp_trouble = true,
			neogit = true,
			neotree = true,
			telescope = true,
		},
	},
	palettes = {
		duskfox = {
			bg1 = '#1a182c',
		},
	},
}

vim.cmd 'colorscheme duskfox' -- nightfox|dayfox|dawnfox|duskfox|nordfox|terafox
