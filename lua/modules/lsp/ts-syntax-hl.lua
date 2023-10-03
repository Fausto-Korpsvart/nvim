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
		'scss',
		'toml',
		'typescript',
		'yaml',
		'vim',
		'vimdoc',
		-- 'comment',
		-- 'latex',
	},
	sync_install = true,
	auto_install = true,
	indent = { enable = false },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<c-a>',
			node_incremental = '<c-n>',
			scope_incremental = '<c-s>',
			node_decremental = '<c-d>',
		},
	},

	-- Modules
	autotag = { enable = true },
	context_commentstring = { enable = true, enable_autocmd = false },
	matchup = { enable = true },
	playground = {
		enable = true,
		updatetime = 25,
		persist_queries = false,
		keybindings = {
			toggle_query_editor = 'o',
			toggle_hl_groups = 'i',
			toggle_injected_languages = 't',
			toggle_anonymous_nodes = 'a',
			toggle_language_display = 'I',
			focus_language = 'f',
			unfocus_language = 'F',
			update = 'R',
			goto_node = '<cr>',
			show_help = '?',
		},
	},
	query_linter = {
		enable = false,
		use_virtual_text = true,
		lint_events = { 'BufWrite', 'CursorHold' },
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['aa'] = '@parameter.outer',
				['ia'] = '@parameter.inner',
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
			},
		},
		swap = {
			enable = true,
			swap_next = {
				['<leader>a'] = '@parameter.inner',
			},
			swap_previous = {
				['<leader>A'] = '@parameter.inner',
			},
		},
	},
}
vim.keymap.set('n', '<Leader>tu', '<CMD>TSUpdateSync<CR>')
vim.keymap.set('n', '<Leader>th', '<CMD>TSToggle highlight<CR>')
vim.keymap.set('n', '<Leader>bh', '<CMD>TSBufToggle highlight<CR>')
vim.keymap.set('n', '<Leader>pg', '<CMD>TSPlaygroundToggle<CR>')
vim.keymap.set('n', '<Leader>uc', '<CMD>TSHighlightCapturesUnderCursor<CR>')
vim.keymap.set('n', '<Leader>cn', '<CMD>rSNodeUnderCursor<CR>')
