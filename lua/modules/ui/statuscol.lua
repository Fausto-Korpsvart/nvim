require('statuscol').setup {
	setopt = true,
	relculright = true,
	ft_ignore = {
		'alpha',
		'DiffviewFiles',
		'help',
		'lazy',
		'lazyterm',
		'Lazy',
		'LazyVim',
		'Mundo',
		'NeogitStatus',
		'neo-tree',
		'Outline',
		'toggleterm',
		'TSPlayground',
		'Trouble',
		'tagbar',
		'undotree',
	},
	bt_ignore = {
		'TSPlayground',
	},
	clickmod = 'c',
	segments = {
		{
			text = {
				require('statuscol.builtin').lnumfunc,
				' │',
			},
			click = 'v:lua.ScFa',
		},
		{
			text = {
				require('statuscol.builtin').foldfunc,
			},
			click = 'v:lua.ScFa',
		},
		{
			sign = {
				name = { 'Diagnostic' },
				maxwidth = 0,
				auto = false,
			},
			click = 'v:lua.ScSa',
		},
	},
}
