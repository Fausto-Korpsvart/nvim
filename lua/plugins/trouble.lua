return {
	-- https://github.com/folke/todo-comments.nvim
	'folke/todo-comments.nvim',
	dependencies = {
		{
			-- https://github.com/folke/trouble.nvim
			'folke/trouble.nvim',
			event = 'VeryLazy',
			config = function()
				require('trouble').setup {
					position = 'right', -- top right bottom left
					width = 45,
					height = 10,
					mode = 'workspace_diagnostics',
					fold_open = '⏷',
					fold_closed = '⏵',
					action_keys = { jump = { 'l', '<tab>' } },
					auto_close = true,
					auto_preview = true,
					auto_fold = true,
					use_diagnostic_signs = true,
					signs = {
						error = '',
						warning = '󰈼',
						hint = '󰉀',
						information = '󰈾',
						other = '󰈽',
					},
				}
			end,
		},
	},
	event = 'VeryLazy',
	keys = {
		vim.keymap.set('n', 'to', '<CMD>TodoTrouble<CR>'),
		vim.keymap.set('n', 'tr', '<CMD>TroubleToggle<CR>'),
		vim.keymap.set('n', 'tw', '<CMD>TroubleToggle workspace_diagnostics<CR>'),
		vim.keymap.set('n', 'td', '<CMD>TroubleToggle document_diagnostics<CR>'),
	},
	config = function()
		vim.keymap.set('n', 'nt', function()
			require('todo-comments').jump_next()
		end, { desc = 'Next todo comment' })

		vim.keymap.set('n', 'pt', function()
			require('todo-comments').jump_prev()
		end, { desc = 'Prev todo comment' })

		local fix = '#db4b4b'
		local hack = '#ff9e64'
		local note = '#1abc9c'
		local todo = '#0db9d7'
		local warn = '#ffc777'
		local perf = '#bb9af7'
		local test = '#3e68d7'

		require('todo-comments').setup {
			keywords = {
				FIX = { icon = '', color = fix },
				HACK = { icon = '', color = hack },
				NOTE = { icon = '󱇗', color = note },
				PERF = { icon = '󰾅', color = perf },
				TODO = { icon = '', color = todo },
				WARN = { icon = '', color = warn },
				TEST = { icon = '󰙨', color = test },
			},
		}
	end,
}
