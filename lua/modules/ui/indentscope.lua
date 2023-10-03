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
