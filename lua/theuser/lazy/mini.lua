return {

	{
		'echasnovski/mini.animate',
		version = false,
		event = 'VeryLazy',
		config = function()
			local animate = require 'mini.animate'
			require('mini.animate').setup {
				cursor = {
					enable = true,
					timing = animate.gen_timing.linear { duration = 150, unit = 'total' },
				},
				scroll = {
					enable = true,
					timing = animate.gen_timing.linear { duration = 100, unit = 'total' },
					subscroll = animate.gen_subscroll.equal { max_output_steps = 100 },
				},
				resize = {
					enable = true,
					timing = animate.gen_timing.linear { duration = 200, unit = 'total' },
				},
				open = {
					enable = false,
				},
				close = {
					enable = false,
				},
			}
		end,
	},

	{
		'echasnovski/mini.bracketed',
		version = false,
		event = 'VeryLazy',
		config = function()
			require('mini.bracketed').setup {
				-- Moded Keymaps{{{
				--[[ vim.keymap.set('n', 'pb', '<CMD>lua MiniBracketed.buffer("backward")<CR>'),
				vim.keymap.set('n', 'nb', '<CMD>lua MiniBracketed.buffer("forward")<CR>'),
				vim.keymap.set('n', 'FB', '<CMD>lua MiniBracketed.buffer("first")<CR>'),
				vim.keymap.set('n', 'LB', '<CMD>lua MiniBracketed.buffer("last")<CR>'),

				vim.keymap.set('n', 'pc', '<CMD>lua MiniBracketed.comment("backward")<CR>'),
				vim.keymap.set('n', 'nc', '<CMD>lua MiniBracketed.comment("forward")<CR>'),
				vim.keymap.set('n', 'FC', '<CMD>lua MiniBracketed.comment("first")<CR>'),
				vim.keymap.set('n', 'LC', '<CMD>lua MiniBracketed.comment("last")<CR>'),

				vim.keymap.set('n', 'pi', '<CMD>lua MiniBracketed.indent("backward")<CR>'),
				vim.keymap.set('n', 'ni', '<CMD>lua MiniBracketed.indent("forward")<CR>'),
				vim.keymap.set('n', 'FI', '<CMD>lua MiniBracketed.indent("first")<CR>'),
				vim.keymap.set('n', 'LI', '<CMD>lua MiniBracketed.indent("last")<CR>'),

				vim.keymap.set('n', 'pts', '<CMD>lua MiniBracketed.treesitter("backward")<CR>'),
				vim.keymap.set('n', 'nts', '<CMD>lua MiniBracketed.treesitter("forward")<CR>'),
				vim.keymap.set('n', 'FTS', '<CMD>lua MiniBracketed.treesitter("first")<CR>'),
				vim.keymap.set('n', 'LTS', '<CMD>lua MiniBracketed.treesitter("last")<CR>'), ]]
				-- }}}
			}
		end,
	},

	{
		'echasnovski/mini.bufremove',
		version = false,
		event = 'VeryLazy',
		config = function()
			require('mini.bufremove').setup {
				set_vim_settings = true,
				silent = false,
			}
		end,
	},

	{
		'echasnovski/mini.files',
		version = false,
		event = 'VeryLazy',
		config = function()
			-- Change Icon Directory{{{
			local my_prefix = function(fs_entry)
				if fs_entry.fs_type == 'directory' then
					-- NOTE: it is usually a good idea to use icon followed by space
					return '  ', 'MiniFilesDirectory'
				end
				return MiniFiles.default_prefix(fs_entry)
			end
			-- }}}

			-- Edit Files in V/H Split{{{
			local MiniFiles = require 'mini.files'
			local map_split = function(buf_id, lhs, direction)
				local rhs = function()
					-- Make new window and set it as target
					local new_target_window
					vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
						vim.cmd(direction .. ' split')
						new_target_window = vim.api.nvim_get_current_win()
					end)

					MiniFiles.set_target_window(new_target_window)
				end

				-- Adding `desc` will result into `show_help` entries
				local desc = 'Split ' .. direction
				vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
			end

			vim.api.nvim_create_autocmd('User', {
				pattern = 'MiniFilesBufferCreate',
				callback = function(args)
					local buf_id = args.data.buf_id
					-- Tweak keys to your liking
					map_split(buf_id, 's', 'belowright horizontal')
					map_split(buf_id, 'v', 'belowright vertical')
				end,
			})
			-- }}}

			require('mini.files').setup {
				content = {
					prefix = my_prefix,
					filter = nil,
					sort = nil,
				},
				mappings = {
					close = 'q',
					go_in = 'l',
					go_in_plus = 'L',
					go_out = 'h',
					go_out_plus = 'H',
					reset = '<BS>',
					reveal_cwd = '@',
					show_help = 'g?',
					synchronize = '=',
					trim_left = '<',
					trim_right = '>',
				},
				options = {
					permanent_delete = false,
					use_as_default_explorer = true,
				},
				windows = {
					max_number = math.huge,
					preview = true,
					width_focus = 40,
					width_nofocus = 20,
					width_preview = 50,
				},
			}
		end,
		vim.keymap.set('n', 'mf', '<CMD>lua MiniFiles.open()<CR>'),
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
		'echasnovski/mini.move',
		version = false,
		event = 'VeryLazy',
		config = function()
			require('mini.move').setup {
				mappings = {
					left = '<S-h>',
					right = '<S-l>',
					down = '<S-j>',
					up = '<S-k>',

					line_left = '<S-h>',
					line_right = '<S-l>',
					line_down = '<S-j>',
					line_up = '<S-k>',
				},

				options = {
					reindent_linewise = true,
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
					brackets = { '%b()', '%b[]', '%b{}' },
					separator = ',',
					exclude_regions = { '%b()', '%b[]', '%b{}', '%b""', "%b''" },
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
					add = 's',
					delete = 'sd',
					replace = 'sr',
					find = 'ssf',
					highlight = 'ssh',
					find_left = 'sF',
					update_n_lines = 'ssn',
					suffix_last = 'l',
					suffix_next = 'n',
				},
				search_method = 'cover',
				respect_selection_type = true,
				silent = false,
				n_lines = 30,
			}
		end,
	},
}
