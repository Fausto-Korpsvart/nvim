return {
	{
		'nvim-telescope/telescope.nvim',
		event = 'VeryLazy',
		dependencies = {
			{ 'nvim-telescope/telescope-file-browser.nvim' },
			{ 'tsakirist/telescope-lazy.nvim' },
			{
				'stevearc/dressing.nvim',
				lazy = true,
				event = 'VeryLazy',
				config = function()
					require('dressing').setup {
						input = { title_pos = 'right', border = 'single' },
					}
				end,
			},
		},
		config = function()
			local fb_actions = require 'telescope._extensions.file_browser.actions'
			require('telescope').setup {
				defaults = {
					prompt_prefix = '  ',
					selection_caret = '▊ ',
					multi_icon = '• ',
					path_display = { 'truncate' }, -- hidden, tail, absolute, smart, shorten, truncate
					winblend = 0,
					mappings = {
						n = {
							['q'] = require('telescope.actions').close,
							['l'] = require('telescope.actions').select_default,
							['s'] = require('telescope.actions').select_horizontal,
							['v'] = require('telescope.actions').select_vertical,
							['x'] = require('telescope.actions').toggle_selection,
							['j'] = require('telescope.actions').move_selection_next,
							['k'] = require('telescope.actions').move_selection_previous,
							['p'] = require('telescope.actions.layout').toggle_preview,
							['<C-n>'] = require('telescope.actions').cycle_previewers_next,
							['<C-p>'] = require('telescope.actions').cycle_previewers_prev,
							['<C-k>'] = require('telescope.actions').preview_scrolling_up,
							['<C-j>'] = require('telescope.actions').preview_scrolling_down,
						},
						i = {
							['tp'] = require('telescope.actions.layout').toggle_preview,
							['<C-n>'] = require('telescope.actions').cycle_previewers_next,
							['<C-p>'] = require('telescope.actions').cycle_previewers_prev,
							['<C-k>'] = require('telescope.actions').preview_scrolling_up,
							['<C-j>'] = require('telescope.actions').preview_scrolling_down,
						},
					},
					sorting_strategy = 'ascending',
					layout_strategy = 'flex', -- horizontal vertical
					preview = { hide_on_startup = true },
					layout_config = {
						horizontal = {
							mirror = true,
							width = 0.40,
							height = 0.50,
							preview_width = 0.90,
							preview_cutoff = 100,
							prompt_position = 'bottom',
						},
						vertical = {
							width = 0.40,
							height = 0.40,
							preview_height = 0.90,
							preview_cutoff = 100,
							prompt_position = 'bottom',
						},
					},
					borderchars = {
						preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
						results = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
						prompt = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
					},
				},
				pickers = {
					builtin = { initial_mode = 'normal' },
					buffers = { initial_mode = 'normal' },
					find_files = { initial_mode = 'normal' },
					git_commits = { initial_mode = 'normal' },
					git_status = { initial_mode = 'normal' },
					grep_string = { initial_mode = 'normal' },
					live_grep = { initial_mode = 'normal' },
					oldfiles = { initial_mode = 'normal' },
					current_buffer_fuzzy_find = { nitial_mode = 'normal' },
				},
				extensions = {
					file_browser = {
						initial_mode = 'normal',
						cwd_to_path = true,
						grouped = true,
						add_dirs = true,
						auto_depth = true,
						select_buffer = true,
						hidden = true, -- { file_browser = false, folder_browser = false },
						follow_symlinks = true,
						hide_parent_dir = true,
						collapse_dirs = true,
						prompt_path = false,
						quiet = false,
						dir_icon = ' ',
						dir_icon_hl = 'Directory',
						-- display_stat = false, -- { date = false, size = true, mode = false },
						hijack_netrw = true,
						use_fd = true,
						git_status = true,
						mappings = {
							['n'] = {
								['A'] = fb_actions.create,
								['a'] = fb_actions.create_from_prompt,
								['c'] = fb_actions.copy,
								['m'] = fb_actions.move,
								['d'] = fb_actions.remove,
								['r'] = fb_actions.rename,
								['L'] = fb_actions.goto_cwd,
								['h'] = fb_actions.goto_parent_dir,
								['/'] = fb_actions.goto_home_dir,
								['f'] = fb_actions.toggle_browser,
								['H'] = fb_actions.toggle_hidden,
							},
						},
					},
					lazy = {
						initial_mode = 'normal',
						show_icon = true,
						mappings = {
							open_in_browser = '<C-o>',
							open_in_file_browser = '<M-b>',
							open_in_find_files = '<C-f>',
							open_in_live_grep = '<C-g>',
							open_plugins_picker = '<C-b>',
							open_lazy_root_find_files = '<C-r>f',
							open_lazy_root_live_grep = '<C-r>g',
						},
					},
					package_info = {
						-- theme = 'ivy',
						initial_mode = 'normal',
						layout_strategy = 'vertical',
					},
				},
			}

			require('telescope').load_extension 'file_browser'
			require('telescope').load_extension 'lazy'
			require('telescope').load_extension 'package_info'
			require('telescope').load_extension 'nerdy'

			-- Telescope Extensions
			vim.keymap.set('n', 'fb', '<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>')
			vim.keymap.set('n', 'zl', '<CMD>lua require("telescope").extensions.lazy.lazy()<CR>')
			vim.keymap.set('n', 'pI', '<CMD>lua require("telescope").extensions.package_info.package_info()<CR>')
			vim.keymap.set('n', 'ic', '<CMD>lua require("telescope").extensions.nerdy.nerdy({initial_mode = "normal", layout_strategy = "vertical"})<CR>')

			-- Telescope Builtin
			vim.keymap.set('n', 'tb', '<CMD>lua require("telescope.builtin").builtin()<CR>')
			vim.keymap.set('n', 'bf', '<CMD>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>')
			vim.keymap.set('n', 'bu', '<CMD>lua require("telescope.builtin").buffers()<CR>')
			vim.keymap.set('n', 'sf', '<CMD>lua require("telescope.builtin").find_files()<CR>')
			vim.keymap.set('n', 'gs', '<CMD>lua require("telescope.builtin").git_status()<CR>')
			vim.keymap.set('n', 'gc', '<CMD>lua require("telescope.builtin").git_commits()<CR>')
			vim.keymap.set('n', 'gt', '<CMD>lua require("telescope.builtin").live_grep()<CR>')
			vim.keymap.set('n', 'of', '<CMD>lua require("telescope.builtin").oldfiles()<CR>')
			vim.keymap.set('n', 'sk', '<CMD>lua require("telescope.builtin").keymaps()<CR>')
			vim.keymap.set('n', 'fs', '<CMD>lua require("telescope.builtin").grep_string()<CR>')
		end,
	},
}
