return {
	'nvim-lualine/lualine.nvim',
	event = 'VeryLazy',
	config = function()
		local color = require 'theuser.util.color'

		-- Truncate Conditions{{{
		local hide_at_80 = function() return vim.o.columns > 80 end
		local hide_at_100 = function() return vim.o.columns > 100 end
		-- }}}

		-- Neovim Logo{{{
		local nvim_icon = {
			function()
				return ' ' --  
			end,
			icon = {
				' NEOVIM ',
				align = 'right',
				color = { gui = 'bold', bg = '#1f2231', fg = '#00b851' }, -- #85be64 #00b851 #3ca8df
			},
			color = { gui = 'bold', bg = '#00b851', fg = '#1a182c' },
			padding = { left = 1, right = 0 },
		}
		-- }}}

		-- LINT{{{
		-- Default Module{{{
		-- local lint_progress = function()
		-- 	local linters = require('lint').get_running()
		-- 	if #linters == 0 then return '󰦕' end
		-- 	return '󱉶 ' .. table.concat(linters, ', ')
		-- end
		-- }}}

		local lint_client = {
			function()
				local server_names = {}

				if package.loaded['lint'] then
					local has_lint, lint = pcall(require, 'lint')
					local buf_ft = vim.bo.filetype

					if has_lint then
						for key_ft, val_ft in pairs(lint.linters_by_ft) do
							for _, linter in ipairs(val_ft) do
								if val_ft == 'string' and buf_ft == key_ft then
									table.insert(server_names, val_ft)
								end
								if buf_ft == key_ft then table.insert(server_names, linter) end
							end
						end
					end
				end
				return table.concat(vim.fn.uniq(server_names), ', ')
				-- return 'LINT'
			end,
			icon = {
				' ',
				align = 'right',
				color = { bg = color.black, fg = color.red },
			},
			color = { bg = color.black, fg = color.red },
			padding = { left = 1, right = 1 },
		}
		-- }}}

		-- FORMAT {{{
		local format_client = {
			function()
				local server_names = {}

				if package.loaded['conform'] then
					local has_conform, conform = pcall(require, 'conform')
					if has_conform then
						local formatters = conform.list_formatters(0)
						vim.list_extend(
							server_names,
							vim.tbl_map(function(formatter) return formatter.name end, formatters)
						)
					end
					return table.concat(vim.fn.uniq(server_names), ', ')
					-- return 'FORMAT'
				end
			end,
			icon = {
				'󰉨 ',
				align = 'right',
				color = { bg = color.black, fg = color.purple },
			},
			color = { bg = color.black, fg = color.purple },
			padding = { left = 1, right = 1 },
		}
		-- }}}

		-- LSPC {{{
		local lsp_clients = {
			function()
				local lsp_clients = vim.lsp.get_clients()
				local server_names = {}

				if not lsp_clients or #lsp_clients == 0 then return '  LSP?' end

				for _, client in pairs(lsp_clients) do
					local client_name = client.name
					if client_name then table.insert(server_names, client_name) end
				end

				return table.concat(vim.fn.uniq(server_names), ', ')
				-- return 'LSPC'
			end,
			icon = {
				'󰪩 ', -- 󰪩 
				align = 'right',
				color = { bg = color.black, fg = color.cyan },
			},
			color = { bg = color.black, fg = color.cyan },
			padding = { left = 1, right = 2 },
		}
		-- }}}

		-- SystemOS Type{{{
		local sysos_type = {
			function() return '' end, --    
			icon = {
				' unix ',
				align = 'left',
				color = { gui = 'bold', bg = color.bg_alt, fg = color.green },
			},
			color = { gui = 'bold', bg = color.green, fg = color.black },
			padding = { left = 0, right = 1 },
		}
		-- }}}

		-- SystemOS Icon{{{
		local sysos_icon = {
			function()
				return ' ' -- 󰣠 󰵮 󰚩 🤷 💻🎧󰯉  󰣛
			end,
			icon = {
				' FEDORA ',
				align = 'left',
				color = { gui = 'bold', bg = color.bg_alt, fg = '#51a2db' }, -- #294172 #51a2db #3c84b4
			},
			color = { gui = 'bold', bg = '#51a2db', fg = '#1a182c' },
			padding = { left = 0, right = 1 },
		}
		-- }}}

		-- Setup
		require('lualine').setup {
			options = {
				globalstatus = true,
				component_separators = { left = '|', right = '|' },
				section_separators = { left = '', right = '' },
				disabled_filetypes = { 'Alpha', 'alpha', 'lazy', 'telescope', 'Telescope' },
			},

			sections = {
				lualine_a = {
					nvim_icon,

					{
						'branch',
						icon = {
							'  ',
							align = 'left',
							color = { bg = '#ff966c', fg = color.bg_alt },
						},
						color = { bg = color.bg_alt, fg = '#ff966c' },
					},
				},
				lualine_b = {},
				lualine_c = {
					{
						'diff',
						symbols = { added = ' 󰐕 ', modified = ' 󰜥 ', removed = ' 󰍴 ' },
						diff_color = {
							added = { fg = color.green },
							modified = { fg = color.yellow },
							removed = { fg = color.red },
						},
						color = { bg = color.black },
						padding = { left = 2, right = 1 },
					},
				},
				lualine_x = {
					{
						require('lazy.status').updates,
						cond = require('lazy.status').has_updates,
						color = { bg = color.black, fg = color.yellow },
					},
				},
				lualine_y = {},
				lualine_z = {
					lint_client,
					format_client,
					lsp_clients,
					sysos_type,
					sysos_icon,
				},
			},
		}
	end,
}
