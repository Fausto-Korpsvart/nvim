return {
	-- https://github.com/nvim-telescope/telescope.nvim
	-- https://github.com/nvim-telescope/telescope-file-browser.nvim
	'nvim-telescope/telescope.nvim',
	event = 'VeryLazy',
	version = false,
	cmd = 'Telescope',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-file-browser.nvim',
	},
	keys = {
		{ 'tl', '<CMD>Telescope<CR>' },
		{ 'fb', '<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>' },
		{ 'bf', '<CMD>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>' },
		{ 'bu', '<CMD>lua require("telescope.builtin").buffers()<CR>' },
		{ 'sf', '<CMD>lua require("telescope.builtin").find_files()<CR>' },
		{ 'gt', '<CMD>lua require("telescope.builtin").git_status()<CR>' },
		{ 'gc', '<CMD>lua require("telescope.builtin").git_commits()<CR>' },
		{ 'tg', '<CMD>lua require("telescope.builtin").live_grep()<CR>' },
		{ 'of', '<CMD>lua require("telescope.builtin").oldfiles()<CR>' },
		{ 'sk', '<CMD>lua require("telescope.builtin").keymaps()<CR>' },
		{ 'gs', '<CMD>lua require("telescope.builtin").grep_string({ search = vim.fn.input "String: " })<CR>',},
	},
	config = function()
		require('telescope').setup {
			defaults = {
				prompt_prefix = '  ',
				selection_caret = '▊ ',
				multi_icon = '• ',
				path_display = { 'truncate' }, -- hidden, tail, absolute, smart, shorten, truncate
				winblend = 5,
				mappings = {
					n = {
						['q'] = require('telescope.actions').close,
						['l'] = require('telescope.actions').select_default,
						['s'] = require('telescope.actions').select_horizontal,
						['v'] = require('telescope.actions').select_vertical,
						['x'] = require('telescope.actions').toggle_selection,
						['j'] = require('telescope.actions').move_selection_next,
						['k'] = require('telescope.actions').move_selection_previous,
						['tp'] = require('telescope.actions.layout').toggle_preview,
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
				layout_strategy = 'horizontal',
				sorting_strategy = 'ascending',
				layout_config = {
					horizontal = {
						prompt_position = 'bottom',
						preview_width = 0.50,
						results_width = 0.50,
						mirror = true,
						width = 0.70,
						height = 0.50,
						preview_cutoff = 100,
					},
					vertical = {
						prompt_position = 'bottom',
						width = 0.50,
						height = 0.50,
						preview_cutoff = 100,
					},
				},
				borderchars = {
					prompt = { '━', '┃', '━', '┃', '┏', '┓', '┛', '┗' },
					preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
					results = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
				},
			},
			pickers = {
				current_buffer_fuzzy_find = { initial_mode = 'normal' },
				buffers = { initial_mode = 'normal', layout_strategy = 'vertical' },
				find_files = { initial_mode = 'normal' },
				git_commits = { initial_mode = 'normal' },
				git_status = { initial_mode = 'normal' },
				live_grep = { initial_mode = 'normal' },
				oldfiles = { initial_mode = 'normal', layout_strategy = 'vertical' },
				grep_string = { initial_mode = 'normal' },
			},
			extensions = {
				file_browser = {
					initial_mode = 'normal',
					cwd_to_path = true,
					grouped = true,
					add_dirs = true,
					auto_depth = true,
					select_buffer = true,
					hidden = true,
					hide_parent_dir = false,
					dir_icon = ' ',
					use_fd = true,
					git_status = true,
					mappings = {
						['n'] = {
							['A'] = require('telescope').extensions.file_browser.actions.create,
							['a'] = require('telescope').extensions.file_browser.actions.create_from_prompt,
							['c'] = require('telescope').extensions.file_browser.actions.copy,
							['m'] = require('telescope').extensions.file_browser.actions.move,
							['d'] = require('telescope').extensions.file_browser.actions.remove,
							['r'] = require('telescope').extensions.file_browser.actions.rename,
							['L'] = require('telescope').extensions.file_browser.actions.goto_cwd,
							['h'] = require('telescope').extensions.file_browser.actions.goto_parent_dir,
							['/'] = require('telescope').extensions.file_browser.actions.goto_home_dir,
							['f'] = require('telescope').extensions.file_browser.actions.toggle_browser,
							['H'] = require('telescope').extensions.file_browser.actions.toggle_hidden,
						},
					},
				},
				media_files = {
					filetypes = { 'png', 'webp', 'jpg', 'jpeg', 'mp4', 'webm', 'pdf' },
					find_cmd = 'rg',
				},
			},
		}
		require('telescope').load_extension 'file_browser'
	end,
}
