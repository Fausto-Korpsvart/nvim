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
