require('kanagawa').setup {
	undercurl = false,
	commentStyle = { bold = false },
	keywordStyle = { bold = true },
	statementStyle = { bold = true },
	transparent = true,
	dimInactive = false,
	terminalColors = true,
	colors = {},
	theme = 'wave',
	background = {
		dark = 'wave',
		-- dark = 'dragon',
		-- light = 'lotus',
	},
}

vim.cmd 'colorscheme kanagawa'
