return {
	-- https://github.com/nvim-treesitter/nvim-treesitter

	'nvim-treesitter/nvim-treesitter',
	module = true,
	event = 'BufReadPost',
	keys = {
		vim.keymap.set('n', 'tu', '<CMD>TSUpdateSync<CR>'),
		vim.keymap.set('n', 'pg', '<CMD>TSPlaygroundToggle<CR>'),
	},
	dependencies = {
		'windwp/nvim-ts-autotag',
		'mrjones2014/nvim-ts-rainbow',
		'nvim-treesitter/playground',
		'JoosepAlviste/nvim-ts-context-commentstring',
		'nvim-treesitter/nvim-treesitter-textobjects',
	},
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter.configs').setup {
			ensure_installed = {
				'html',
				'haskell',
				'css',
				'scss',
				'javascript',
				'typescript',
				'lua',
				'python',
				'regex',
				'toml',
				'yaml',
				'json',
				'vim',
				'markdown',
				'markdown_inline',
				'latex',
				'bash',
				'comment',
				'todotxt',
			},
			sync_install = false,
			auto_install = true,
			indent = { enable = true },
			matchup = { enable = true },
			highlight = { enable = true, additional_vim_regex_highlighting = { 'markdown' } },
			context_commentstring = { enable = false, enable_autocmd = false },
			rainbow = {
				enable = true,
				extended_mode = true,
				colors = {
					'#ff9e64',
					'#c099ff',
					'#0db9d7',
					'#c3e88d',
					'#ff007c',
					'#1abc9c',
					'#3e68d7',
				},
			},
		}
	end,
}
