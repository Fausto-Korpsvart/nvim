return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v2.x',
	event = 'VeryLazy',
	cmd = 'Neotree',
	config = function()
		vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' }) --
		vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })   -- 
		vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })   -- 
		vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

		require('neo-tree').setup {
			close_if_last_window = true,
			popup_border_style = 'single',
			enable_git_status = true,
			enable_diagnostics = true,
			open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' },
			sort_case_insensitive = true,

			default_component_configs = {
				container = {
					enable_character_fade = true,
				},
				indent = {
					indent_size = 3,
					padding = 0,
					with_markers = true,
					indent_marker = '│', -- 
					last_indent_marker = '└╴', -- ⏵
					expander_collapsed = '',
					expander_expanded = '',
				},
				icon = {
					folder_closed = '',
					folder_open = '󰝰',
					folder_empty = '󰉖',
				},
				modified = {
					symbol = '󰆓',
				},
				name = {
					use_git_status_colors = false,
				},
				git_status = {
					symbols = {
						added = '󰐕',
						deleted = '󰍴 ',
						modified = '󰜥 ',
						renamed = '󰲶 ',
						staged = ' ',
						unstaged = ' ',
						untracked = ' ',
						conflict = ' ',
						ignored = ' ',
					},
				},
				file_size = {
					enabled = false,
					required_width = 30,
				},
				type = {
					enabled = false,
					required_width = 122,
				},
				last_modified = {
					enabled = false,
					required_width = 88,
				},
				created = {
					enabled = false,
					required_width = 110,
				},
				symlink_target = {
					enabled = true,
				},
			},

			window = {
				position = 'right',
				width = 40,
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
					['s'] = 'open_split',
					['v'] = 'open_vsplit',
				},
			},

			filesystem = {
				follow_current_file = {
					enabled = true, -- This will find and focus the file in the active buffer every time
					leave_dirs_open = false,
				},
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

		vim.keymap.set('n', '<Leader>nt', '<CMD>Neotree toggle<CR>')
		vim.keymap.set('n', '<Leader>nc', '<CMD>Neotree close<CR>')
		vim.keymap.set('n', '<Leader>bf', '<CMD>Neotree toggle show buffers<CR>')
		vim.keymap.set('n', '<Leader>gs', '<CMD>Neotree git_status<CR>')
	end,
}
