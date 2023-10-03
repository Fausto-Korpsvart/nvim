local neogit = require 'neogit'

neogit.setup {
	disable_hint = false,
	disable_context_highlighting = false,
	disable_signs = false,
	disable_commit_confirmation = false,
	disable_builtin_notifications = false,
	disable_insert_on_commit = true,
	filewatcher = {
		interval = 1000,
		enabled = true,
	},
	remember_settings = true,
	use_per_project_settings = true,
	ignored_settings = { -- {{{
		'NeogitPushPopup--force-with-lease',
		'NeogitPushPopup--force',
		'NeogitPullPopup--rebase',
		'NeogitCommitPopup--allow-empty',
		'NeogitRevertPopup--no-edit',
	}, -- }}}
	auto_refresh = true,
	sort_branches = '-committerdate',
	kind = 'tab',
	disable_line_numbers = false,
	console_timeout = 2000,
	auto_show_console = true,
	status = { -- {{{
		recent_commit_count = 10,
	},
	commit_editor = {
		kind = 'split',
	},
	commit_select_view = {
		kind = 'tab',
	},
	commit_view = {
		kind = 'vsplit',
	},
	log_view = {
		kind = 'tab',
	},
	rebase_editor = {
		kind = 'split',
	},
	reflog_view = {
		kind = 'tab',
	},
	merge_editor = {
		kind = 'split',
	},
	preview_buffer = {
		kind = 'split',
	},
	popup = {
		kind = 'split',
	}, -- }}}
	signs = {
		section = { '▸', '▾' },
		item = { '│', '▾' },
		hunk = { '│', '▾' },
	},
	integrations = {
		telescope = true,
		diffview = true,
	},
	sections = {
		-- {{{
		sequencer = {
			folded = false,
			hidden = false,
		},
		untracked = {
			folded = false,
			hidden = false,
		},
		unstaged = {
			folded = false,
			hidden = false,
		},
		staged = {
			folded = false,
			hidden = false,
		},
		stashes = {
			folded = false,
			hidden = false,
		},
		unpulled_upstream = {
			folded = false,
			hidden = false,
		},
		unmerged_upstream = {
			folded = false,
			hidden = false,
		},
		unpulled_pushRemote = {
			folded = false,
			hidden = false,
		},
		unmerged_pushRemote = {
			folded = false,
			hidden = false,
		},
		recent = {
			folded = false,
			hidden = false,
		},
		rebase = {
			folded = false,
			hidden = false,
		},
	}, -- }}}
	mappings = {
		-- {{{
		finder = {
			-- {{{
			['<cr>'] = 'Select',
			['<c-c>'] = 'Close',
			['<esc>'] = 'Close',
			['<c-n>'] = 'Next',
			['<c-p>'] = 'Previous',
			['<down>'] = 'Next',
			['<up>'] = 'Previous',
			['<tab>'] = 'MultiselectToggleNext',
			['<s-tab>'] = 'MultiselectTogglePrevious',
			['<c-j>'] = 'NOP',
		}, -- }}}
		status = {
			-- {{{
			['q'] = 'Close',
			['I'] = 'InitRepo',
			['1'] = 'Depth1',
			['2'] = 'Depth2',
			['3'] = 'Depth3',
			['4'] = 'Depth4',
			['<tab>'] = 'Toggle',
			['x'] = 'Discard',
			['s'] = 'Stage',
			['S'] = 'StageUnstaged',
			['<c-s>'] = 'StageAll',
			['u'] = 'Unstage',
			['U'] = 'UnstageStaged',
			['d'] = 'DiffAtFile',
			['$'] = 'CommandHistory',
			['#'] = 'Console',
			['<c-r>'] = 'RefreshBuffer',
			['<enter>'] = 'GoToFile',
			['<c-v>'] = 'VSplitOpen',
			['<c-x>'] = 'SplitOpen',
			['<c-t>'] = 'TabOpen',
			['?'] = 'HelpPopup',
			['D'] = 'DiffPopup',
			['p'] = 'PullPopup',
			['r'] = 'RebasePopup',
			['m'] = 'MergePopup',
			['P'] = 'PushPopup',
			['c'] = 'CommitPopup',
			['l'] = 'LogPopup',
			['v'] = 'RevertPopup',
			['Z'] = 'StashPopup',
			['A'] = 'CherryPickPopup',
			['b'] = 'BranchPopup',
			['f'] = 'FetchPopup',
			['X'] = 'ResetPopup',
			['M'] = 'RemotePopup',
			['{'] = 'GoToPreviousHunkHeader',
			['}'] = 'GoToNextHunkHeader',
		}, -- }}}
	}, -- }}}
}

vim.keymap.set('n', 'ng', '<CMD>Neogit<CR>')
