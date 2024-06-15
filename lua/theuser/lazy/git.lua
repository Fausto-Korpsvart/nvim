return {
	{
		'akinsho/git-conflict.nvim',
		version = '*',
		event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
		config = function()
			require('git-conflict').setup {
				default_commands = true,
				disable_diagnostics = false,
				list_opener = 'copen',
				default_mappings = {
					ours = 'o',
					theirs = 't',
					none = '0',
					both = 'b',
					next = 'n',
					prev = 'p',
				},
				highlights = {
					incoming = 'DiffAdd',
					current = 'DiffText',
				},
			}

			vim.keymap.set('n', 'gcf', '<Plug>(git-conflict-ours)')
			vim.keymap.set('n', 'gct', '<Plug>(git-conflict-theirs)')
			vim.keymap.set('n', 'gcb', '<Plug>(git-conflict-both)')
			vim.keymap.set('n', 'gc0', '<Plug>(git-conflict-none)')
			vim.keymap.set('n', ']x', '<Plug>(git-conflict-prev-conflict)')
			vim.keymap.set('n', '[x', '<Plug>(git-conflict-next-conflict)')
		end,
	},

	{
		'sindrets/diffview.nvim',
		event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
		config = function()
			local actions = require 'diffview.actions'

			require('diffview').setup {
				diff_binaries = false,
				enhanced_diff_hl = true,
				use_icons = true,
				icons = { folder_closed = '', folder_open = '󰝰' },
				signs = { fold_closed = '⏵', fold_open = '⏷', done = '✓' },
				view = {
					default = { winbar_info = true },
					merge_tool = { disable_diagnostics = false },
				},
				file_panel = { win_config = { position = 'right', width = 40 } },
				keymaps = {
					disable_defaults = false,
					file_panel = {
						{ 'n', 'l', actions.select_entry },
					},
					file_history_panel = {
						{ 'n', 'l', actions.select_entry },
					},
				},
			}

			vim.keymap.set('n', 'dv', '<CMD>DiffviewOpen<CR>')
			vim.keymap.set('n', 'dfh', '<CMD>DiffviewFileHistory<CR>')
		end,
	},

	{
		'SuperBo/fugit2.nvim',
		cmd = { 'Fugit2', 'Fugit2Diff', 'Fugit2Graph' },
		opts = {
			width = 80,
			min_width = 50,
			content_width = 80,
			max_width = '80%',
			height = '85%',
			external_diffview = true,
		},
		keys = {
			{ 'fg', mode = 'n', '<CMD>Fugit2<CR>' },
			{ 'fgg', mode = 'n', '<CMD>Fugit2Graph<CR>' },
		},
	},

	{
		'lewis6991/gitsigns.nvim',
		event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
		config = function()
			require('gitsigns').setup {
				signs = {
					add = { text = '' },
					change = { text = '' },
					delete = { text = '' },
					topdelete = { text = '' },
					changedelete = { text = '' },
					untracked = { text = '' },
				},
				signcolumn = false,
				numhl = true,
				trouble = true,
				preview_config = { border = 'single' },
				current_line_blame_formatter = '<author>-<author_time:%b-%m,%Y>-<summary>',
			}

			vim.keymap.set('n', 'tgs', '<CMD>Gitsigns toggle_signs<CR>')
			vim.keymap.set('n', 'tph', '<CMD>Gitsigns preview_hunk<CR>')
			vim.keymap.set('n', 'thi', '<CMD>Gitsigns preview_hunk_inline<CR>')
			vim.keymap.set('n', 'tlb', '<CMD>Gitsigns toggle_current_line_blame<CR>')
		end,
	},
}
