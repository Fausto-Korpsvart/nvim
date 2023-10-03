require('incline').setup {
	render = function(props)
		local filedir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':h:t')
		local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
		local icon, color = require('nvim-web-devicons').get_icon_color(filename)

		if vim.api.nvim_buf_get_option(props.buf, 'modified') then
			filedir = filedir
			filename = filename
			icon = icon .. '   '
		end

		return {
			{ ' ', filedir },
			{ ' ▸ ', filename, ' ', icon, guifg = color },
		}
	end,

	hide = { cursorline = false, focused_win = false, only_win = false },
	highlight = {
		groups = {
			InclineNormal = { gui = 'bold', guifg = '#ffc777', guibg = '#1a1b26' },
			InclineNormalNC = { gui = 'bold', guifg = '#828bb8', guibg = '#1a1b26' },
		},
	},

	window = {
		margin = { vertical = 0, horizontal = 0 },
		options = { signcolumn = 'no', wrap = true },
	},
}
