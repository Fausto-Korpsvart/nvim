return {
	{
		'mfussenegger/nvim-dap',
		dependencies = {
			'leoluz/nvim-dap-go',
			'rcarriga/nvim-dap-ui',
			'theHamsta/nvim-dap-virtual-text',
			'nvim-neotest/nvim-nio',
			'williamboman/mason.nvim',
		},
		config = function()
			local dap = require 'dap'
			local ui = require 'dapui'

			require('dapui').setup()
			require('dap-go').setup()

			require('nvim-dap-virtual-text').setup {
				-- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
				display_callback = function(variable)
					local name = string.lower(variable.name)
					local value = string.lower(variable.value)
					if
						name:match 'secret'
						or name:match 'api'
						or value:match 'secret'
						or value:match 'api'
					then
						return '*****'
					end

					if #variable.value > 15 then
						return ' ' .. string.sub(variable.value, 1, 15) .. '... '
					end

					return ' ' .. variable.value
				end,
			}

			-- Handled by nvim-dap-go
			-- dap.adapters.go = {
			--   type = "server",
			--   port = "${port}",
			--   executable = {
			--     command = "dlv",
			--     args = { "dap", "-l", "127.0.0.1:${port}" },
			--   },
			-- }

			local elixir_ls_debugger = vim.fn.exepath 'elixir-ls-debugger'
			if elixir_ls_debugger ~= '' then
				dap.adapters.mix_task = {
					type = 'executable',
					command = elixir_ls_debugger,
				}

				dap.configurations.elixir = {
					{
						type = 'mix_task',
						name = 'phoenix server',
						task = 'phx.server',
						request = 'launch',
						projectDir = '${workspaceFolder}',
						exitAfterTaskReturns = false,
						debugAutoInterpretAllModules = false,
					},
				}
			end

			vim.keymap.set('n', '<space>b', dap.toggle_breakpoint)
			vim.keymap.set('n', '<space>gb', dap.run_to_cursor)

			-- Eval var under cursor
			vim.keymap.set(
				'n',
				'<space>?',
				function() require('dapui').eval(nil, { enter = true }) end
			)

			vim.keymap.set('n', '<F1>', dap.continue)
			vim.keymap.set('n', '<F2>', dap.step_into)
			vim.keymap.set('n', '<F3>', dap.step_over)
			vim.keymap.set('n', '<F4>', dap.step_out)
			vim.keymap.set('n', '<F5>', dap.step_back)
			vim.keymap.set('n', '<F13>', dap.restart)

			dap.listeners.before.attach.dapui_config = function() ui.open() end
			dap.listeners.before.launch.dapui_config = function() ui.open() end
			dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
			dap.listeners.before.event_exited.dapui_config = function() ui.close() end
		end,
	},
}

-- OLD-CONF {{{
--[[ 'mfussenegger/nvim-dap',
	-- NOTE: And you can specify dependencies as well
	dependencies = {
		'rcarriga/nvim-dap-ui',
		'nvim-neotest/nvim-nio',
		-- 'leoluz/nvim-dap-go',
	},
	config = function()
		local dap = require 'dap'
		local dapui = require 'dapui'

		require('mason-nvim-dap').setup {
			-- Makes a best effort to setup the various debuggers with
			-- reasonable debug configurations
			automatic_setup = true,

			-- You can provide additional configuration to the handlers,
			-- see mason-nvim-dap README for more information
			handlers = {},

			-- You'll need to check that you have the required things installed
			-- online, please don't ask me how to install them :)
			ensure_installed = {
				-- Update this to ensure that you have the debuggers for the langs you want
				'delve',
			},
		}

		-- Basic debugging keymaps, feel free to change to your liking!
		vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
		vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
		vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
		vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
		vim.keymap.set(
			'n',
			'<leader>b',
			dap.toggle_breakpoint,
			{ desc = 'Debug: Toggle Breakpoint' }
		)
		vim.keymap.set(
			'n',
			'<leader>B',
			function() dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ') end,
			{ desc = 'Debug: Set Breakpoint' }
		)

		-- Dap UI setup
		-- For more information, see |:help nvim-dap-ui|
		dapui.setup {
			-- Set icons to characters that are more likely to work in every terminal.
			--    Feel free to remove or use ones that you like more! :)
			--    Don't feel like these are good choices.
			icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
			controls = {
				icons = {
					pause = '⏸',
					play = '▶',
					step_into = '⏎',
					step_over = '⏭',
					step_out = '⏮',
					step_back = 'b',
					run_last = '▶▶',
					terminate = '⏹',
					disconnect = '⏏',
				},
			},
		}

		-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
		vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

		dap.listeners.after.event_initialized['dapui_config'] = dapui.open
		dap.listeners.before.event_terminated['dapui_config'] = dapui.close
		dap.listeners.before.event_exited['dapui_config'] = dapui.close

		-- Install golang specific config
		-- require('dap-go').setup()
	end, ]]
-- }}}
