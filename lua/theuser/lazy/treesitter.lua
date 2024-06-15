return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	lazy = false,
	event = { 'BufReadPost', 'BufNewFile', 'BufWritePre', 'VeryLazy' },
	dependencies = {
		{ 'windwp/nvim-ts-autotag' },
		{
			'JoosepAlviste/nvim-ts-context-commentstring',
			config = function()
				vim.g.skip_ts_context_commentstring_module = true

				require('ts_context_commentstring').setup {
					enable_autocmd = false,
				}
			end,
		},
		{
			'nvim-treesitter/nvim-treesitter-context',
			config = function()
				require('treesitter-context').setup {
					enable = true,
					max_lines = 2,
					min_window_height = 2,
				}
				vim.keymap.set(
					'n',
					'[c',
					function() require('treesitter-context').go_to_context() end,
					{ silent = true }
				)

				vim.keymap.set('n', 'co', '<CMD>TSContextToggle<CR>')
			end,
		},
		{
			'HiPhish/rainbow-delimiters.nvim',
			config = function()
				local rainbow_delimiters = require 'rainbow-delimiters'

				vim.g.rainbow_delimiters = {
					strategy = {
						[''] = rainbow_delimiters.strategy['global'],
						html = rainbow_delimiters.strategy['global'],
						lua = rainbow_delimiters.strategy['global'],
						vim = rainbow_delimiters.strategy['global'],
					},
					query = {
						[''] = 'rainbow-delimiters',
						lua = 'rainbow-blocks',
					},
				}
			end,
		},
	},
	config = function()
		require('nvim-treesitter.configs').setup {
			ensure_installed = {
				'bash',
				'css',
				'diff',
				'haskell',
				'html',
				'ini',
				'javascript',
				'json',
				'lua',
				'markdown',
				'markdown_inline',
				'python',
				'query',
				'regex',
				-- 'scss',
				'toml',
				'typescript',
				'yaml',
				'vim',
				'vimdoc',
				'comment',
				-- 'latex',
			},
			auto_install = false,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = false },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<C-s>',
					node_incremental = '<C-i>',
					node_decremental = '<C-d>',
					scope_incremental = '<C-S>',
				},
			},

			-- Modules
			autotag = {
				enable = true,
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = true,
				filetypes = { 'html', 'xml' },
			},
		}

		vim.keymap.set('n', '<Leader>tu', '<CMD>TSUpdateSync<CR>')
		vim.keymap.set('n', '<Leader>th', '<CMD>TSToggle highlight<CR>')
		vim.keymap.set('n', '<Leader>bh', '<CMD>TSBufToggle highlight<CR>')
		vim.keymap.set('n', '<Leader>pg', '<CMD>TSPlaygroundToggle<CR>')
		vim.keymap.set('n', '<Leader>uc', '<CMD>TSHighlightCapturesUnderCursor<CR>')
		vim.keymap.set('n', '<Leader>cn', '<CMD>rSNodeUnderCursor<CR>')
	end,
}
