require('fidget').setup {
	progress = {
		poll_rate = 0,
		suppress_on_insert = false,
		ignore_done_already = false,
		ignore_empty_message = false,
		clear_on_detach = function(client_id)
			local client = vim.lsp.get_client_by_id(client_id)
			return client and client.name or nil
		end,
		notification_group = function(msg) return msg.lsp_client.name end,
		ignore = {},

		display = {
			render_limit = 15,
			done_ttl = 3,
			done_icon = '󰸞',
			done_style = 'Constant',
			progress_ttl = math.huge,
			progress_icon = { pattern = 'dots', period = 1 },
			progress_style = 'WarningMsg',
			group_style = 'Title',
			icon_style = 'Question',
			priority = 30,
			format_message = require('fidget.progress.display').default_format_message,
			format_annote = function(msg) return msg.title end,
			format_group_name = function(group) return tostring(group) end,
			overrides = {
				rust_analyzer = { name = 'rust-analyzer' },
			},
		},

		lsp = {
			progress_ringbuf_size = 0,
		},
	},

	notification = {
		poll_rate = 10,
		filter = vim.log.levels.INFO,
		override_vim_notify = true,
		configs = {
			default = {
				name = 'NOTIFICATION!',
				icon = '❰❰',
				ttl = 5,
				group_style = 'Special',
				icon_style = 'Special',
				annote_style = 'Question',
				debug_style = 'Comment',
				warn_style = 'WarningMsg',
				error_style = 'ErrorMsg',
			},
		},

		view = {
			stack_upwards = true,
			icon_separator = ' ',
			group_separator = '---',
			group_separator_hl = 'Comment',
		},

		window = {
			normal_hl = 'Comment',
			winblend = 0,
			border = 'none',
			zindex = 1,
			max_width = 0,
			max_height = 10,
			x_padding = 1,
			y_padding = 0,
			align = 'bottom',
			relative = 'editor',
		},
	},

	logger = {
		level = vim.log.levels.WARN,
		float_precision = 0.01,
		path = string.format('%s/fidget.nvim.log', vim.fn.stdpath 'cache'),
	},
}

vim.keymap.set('n', '<Leader>fh', '<CMD>Fidget history<CR>', { desc = 'Show History Info' })
