return {
	{
		'echasnovski/mini.bufremove',
		version = false,
		event = 'VeryLazy',
		config = function() require('mini.bufremove').setup() end,
	},

	{
		'echasnovski/mini.indentscope',
		version = false,
		event = 'VeryLazy',
		config = function()
			require('mini.indentscope').setup {
				symbol = '│',
				draw = {
					priority = 2,
					-- animation = require('mini.indentscope').gen_animation.none(), -- quadratic|cubic|quartic|exponential
					animation = require('mini.indentscope').gen_animation.quadratic {
						easing = 'out', -- in|out|in-out
						duration = 0,
						unit = 'step', --total|step
					},
				},
				options = {
					border = 'both',
					indent_at_cursor = true,
					try_as_border = true,
				},
				mappings = {
					object_scope = 'mo',
					object_scope_with_border = 'ob',
					goto_top = '[i',
					goto_bottom = ']i',
				},
			}
		end,
	},

	{
		'echasnovski/mini.splitjoin',
		version = false,
		event = 'VeryLazy',
		config = function()
			require('mini.splitjoin').setup {
				mappings = {
					toggle = 'sj',
					split = '<Leader>s',
					join = '<Leader>j',
				},
				detect = {
					brackets = nil,
					separator = ',',
					exclude_regions = nil,
				},

				split = {
					hooks_pre = {},
					hooks_post = {},
				},

				join = {
					hooks_pre = {},
					hooks_post = {},
				},
			}
		end,
	},

	{
		'echasnovski/mini.surround',
		version = false,
		event = 'VeryLazy',
		config = function()
			require('mini.surround').setup {
				custom_surroundings = nil,
				highlight_duration = 500,
				mappings = {
					add = 'ss',
					delete = 'ssd',
					find = 'ssf',
					replace = 'ssr',
					highlight = 'ssh',
					find_left = 'ssF',
					update_n_lines = 'ssn',
					suffix_last = 'l',
					suffix_next = 'n',
				},

				n_lines = 30,

				respect_selection_type = false,

				search_method = 'cover',

				silent = false,
			}
		end,
	},
}
