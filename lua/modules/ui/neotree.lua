require('neo-tree').setup {
	close_if_last_window = true,
	popup_border_style = 'single',
	open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' },
	sort_case_insensitive = true,

	sources = {
		'filesystem',
		'buffers',
		'git_status',
		-- 'diagnostics',
		'document_symbols',
	},

	source_selector = {
		winbar = false,
		statusline = false,
		content_layout = 'center',
		tabs_layout = 'equal',
		truncation_character = '…',
		--[[ sources = {-- {{{
			{
				source = 'filesystem',
				display_name = '  ',
			},
			{
				source = 'buffers',
				display_name = ' 󰌨 ',
			},
			{
				source = 'git_status',
				display_name = ' 󰊢 ',
			},
			{
				source = 'diagnostics',
				display_name = '  ',
			},
			{
				source = 'document_symbols',
				display_name = '  ',
			},
		},-- }}} ]]
	},

	default_component_configs = {
		container = {
			enable_character_fade = true,
		},
		indent = {
			padding = 0,
			with_markers = true,
			indent_marker = '',
			last_indent_marker = '⏵',
			expander_collapsed = '',
			expander_expanded = '',
		},
		icon = {
			folder_closed = '',
			folder_open = '󰝰',
			folder_empty = '󰉖',
		},
		modified = {
			symbol = ' ',
		},
		name = {
			use_git_status_colors = false,
		},
		git_status = {
			symbols = {
				added = '✚',
				deleted = '✖',
				modified = '•',
				renamed = '﮺',
				staged = '•',
				unstaged = '○',
				untracked = '',
				conflict = '',
				ignored = '×',
			},
		},
	},

	window = {
		position = 'right',
		width = 35,
		mapping_options = {
			noremap = true,
			nowait = true,
		},
		popup = {
			position = { col = '50%', row = '10' },
			size = function(state)
				local root_name = vim.fn.fnamemodify(state.path, ':~')
				local root_len = string.len(root_name) + 4
				return {
					width = math.max(root_len, 60),
					height = vim.o.lines - 30,
				}
			end,
		},
		mappings = {
			['?'] = 'show_help',
			['T'] = 'toggle_node',
			['l'] = 'open',
			['h'] = 'close_node',
			['S'] = 'open_split',
			['V'] = 'open_vsplit',
			['s'] = 'split_with_window_picker',
			['v'] = 'vsplit_with_window_picker',
		},
	},

	filesystem = {
		follow_current_file = true,
		group_empty_dirs = true,
		use_libuv_file_watcher = true,
		window = {
			mappings = {
				['h'] = 'navigate_up',
				['cf'] = 'clear_filter',
			},
		},
		-- NOTE: Install 'trash-cli' package needed
		commands = {
			delete = function(state) -- Override delete to use trash instead of rm
				local path = state.tree:get_node().path
				vim.fn.system { 'trash', vim.fn.fnameescape(path) }
				require('neo-tree.sources.manager').refresh(state.name)
			end,
		},
	},

	buffers = {
		window = {
			mappings = {
				['u'] = 'navigate_up',
			},
		},
	},

	event_handlers = {
		{
			event = 'neo_tree_window_after_open',
			handler = function(args)
				if args.position == 'left' or args.position == 'right' then
					vim.cmd 'wincmd ='
				end
			end,
		},
		{
			event = 'neo_tree_window_after_close',
			handler = function(args)
				if args.position == 'left' or args.position == 'right' then
					vim.cmd 'wincmd ='
				end
			end,
		},
	},
}

vim.cmd [[nnoremap \ :Neotree reveal<cr>]]

vim.keymap.set('n', '<Leader>nt', '<CMD>NeoTreeFocusToggle<CR>')
vim.keymap.set('n', '<Leader>nf', '<CMD>NeoTreeFloatToggle<CR>')
vim.keymap.set('n', '<Leader>nc', '<CMD>NeoTreeClose<CR>')
vim.keymap.set('n', '<Leader>bf', '<CMD>Neotree toggle show buffers<CR>')
vim.keymap.set('n', '<Leader>gs', '<CMD>Neotree git_status<CR>')
vim.keymap.set('n', '<Leader>dg', '<CMD>Neotree diagnostics<CR>')
vim.keymap.set('n', '<Leader>ds', '<CMD>Neotree document_symbols<CR>')
