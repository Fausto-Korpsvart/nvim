require('catppuccin').setup {
	dim_inactive = {
		enabled = false,
		shade = 'dark',
		percentage = 0.10,
	},
	integrations = {
		cmp = true,
		fidget = true,
		gitsigns = true,
		hop = true,
		illuminate = true,
		lsp_saga = true,
		markdown = true,
		mason = true,
		mini = true,
		neogit = true,
		neotree = true,
		notify = true,
		noice = true,
		telescope = true,
		treesitter = true,
		lsp_trouble = true,
		ts_rainbow = true,
	},
}

vim.g.catppuccin_flavour = 'macchiato' -- mocha|macchiato|frappe|latte
vim.cmd 'colorscheme catppuccin'
