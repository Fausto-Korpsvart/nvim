local rainbow_delimiters = require 'rainbow-delimiters'

vim.g.rainbow_delimiters = {
	strategy = {
		[''] = rainbow_delimiters.strategy['global'],
		html = rainbow_delimiters.strategy['global'],
		lua = rainbow_delimiters.strategy['lobal'],
		vim = rainbow_delimiters.strategy['global'],
	},
	query = {
		[''] = 'rainbow-delimiters',
		lua = 'rainbow-blocks',
	},
}
