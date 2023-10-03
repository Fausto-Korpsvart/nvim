local project_actions = require 'telescope._extensions.project.actions'
local fb_actions = require 'telescope._extensions.file_browser.actions'

-- Vertical Ivy{{{
local vertical_ivy = function()
	return require('telescope.themes').get_ivy {
		layout_strategy = 'vertical',
		initial_mode = 'normal',
		-- prompt_title = 'Prompt 󰭎',
		results_title = 'Results',
		preview_title = 'Preview',
		borderchars = {
			preview = { '─', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
			results = { '─', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
		},
	}
end
-- }}}

require('telescope').setup {
	defaults = {
		prompt_prefix = '  ',
		selection_caret = '▊ ',
		multi_icon = '• ',
		path_display = { 'tail' }, -- hidden, tail, absolute, smart, shorten, truncate
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
		layout_strategy = 'horizontal',
		preview = { hide_on_startup = false },
		layout_config = {
			horizontal = {
				mirror = true,
				width = 0.70,
				height = 0.50,
				preview_width = 0.62,
				preview_cutoff = 100,
				prompt_position = 'bottom',
			},
			vertical = {
				width = 0.35,
				height = 0.50,
				preview_height = 0.35,
				preview_cutoff = 40,
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
		-- Horizontal Layout
		builtin = { initial_mode = 'normal' },
		buffers = { initial_mode = 'normal' },
		find_files = { initial_mode = 'normal' },
		git_commits = { initial_mode = 'normal' },
		git_status = { initial_mode = 'normal' },
		grep_string = { initial_mode = 'normal' },
		live_grep = { initial_mode = 'normal' },
		oldfiles = { initial_mode = 'normal' },
		current_buffer_fuzzy_find = { nitial_mode = 'normal' },
		-- Vertical Ivy{{{
		-- builtin = vertical_ivy(),
		-- buffers = vertical_ivy(),
		-- find_files = vertical_ivy(),
		-- git_commits = vertical_ivy(),
		-- git_status = vertical_ivy(),
		-- grep_string = vertical_ivy(),
		-- live_grep = vertical_ivy(),
		-- oldfiles = vertical_ivy(),
		-- current_buffer_fuzzy_find = vertical_ivy(),
		-- }}}
	},
	extensions = {
		file_browser = {
			initial_mode = 'normal',
			-- layout_strategy = 'vertical',{{{
			-- theme = 'ivy',
			-- borderchars = {
			-- 	preview = { '─', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
			-- 	results = { '─', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
			-- },
			-- }}}
			cwd_to_path = true,
			grouped = true,
			add_dirs = true,
			auto_depth = true,
			select_buffer = true,
			hidden = true,
			follow_symlinks = true,
			hide_parent_dir = true,
			collapse_dirs = true,
			prompt_path = false,
			quiet = false,
			dir_icon = ' ',
			dir_icon_hl = 'Directory',
			-- display_stat = { date = false, size = true, mode = false }, -- false
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
			-- layout_strategy = 'vertical',{{{
			-- theme = 'ivy',
			-- borderchars = {
			-- 	preview = { '─', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
			-- 	results = { '─', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
			-- },
			-- }}}
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
			theme = 'ivy',
			initial_mode = 'normal',
			layout_strategy = 'vertical',
		},
		project = {
			theme = 'ivy',
			hidden_files = true,
			order_by = 'asc', -- asc, desc, recent
			search_by = 'title', -- title, path
			on_project_selected = function(prompt_bufnr)
				project_actions.find_project_files(prompt_bufnr, false)
			end,
		},
	},
}

require('telescope').load_extension 'file_browser'
require('telescope').load_extension 'lazy'
require('telescope').load_extension 'package_info'
require('telescope').load_extension 'project'

vim.keymap.set('n', 'tl', '<CMD>lua require("telescope.builtin").builtin()<CR>')
vim.keymap.set('n', 'fb', '<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>')
vim.keymap.set('n', 'bf', '<CMD>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>')
vim.keymap.set('n', 'bu', '<CMD>lua require("telescope.builtin").buffers()<CR>')
vim.keymap.set('n', 'sf', '<CMD>lua require("telescope.builtin").find_files()<CR>')
vim.keymap.set('n', 'gs', '<CMD>lua require("telescope.builtin").git_status()<CR>')
vim.keymap.set('n', 'gd', '<CMD>lua require("telescope.builtin").git_commits()<CR>')
vim.keymap.set('n', 'gt', '<CMD>lua require("telescope.builtin").live_grep()<CR>')
vim.keymap.set('n', 'of', '<CMD>lua require("telescope.builtin").oldfiles()<CR>')
vim.keymap.set('n', 'sk', '<CMD>lua require("telescope.builtin").keymaps()<CR>')
vim.keymap.set('n', 'fs', '<CMD>lua require("telescope.builtin").grep_string()<CR>')
vim.keymap.set('n', 'zl', '<CMD>lua require("telescope").extensions.lazy.lazy()<CR>')
vim.keymap.set('n', 'pI', '<CMD>lua require("telescope").extensions.package_info.package_info()<CR>')
vim.keymap.set('n', 'tp', '<CMD>lua require("telescope").extensions.project.project({initial_mode = "normal", layout_strategy = "vertical"})<CR>')
