return {
	'nvim-lualine/lualine.nvim',
	event = 'VimEnter',
	config = function()
		-- Conditions{{{
		local hide_at_80 = function() return vim.o.columns > 80 end

		local hide_at_100 = function() return vim.o.columns > 100 end
		-- }}}

		-- Neovim Logo{{{
		local nvim_icon = {
			function()
				return '' --  
			end,
			icon = {
				' NEOVIM ',
				align = 'right',
				color = { gui = 'bold', bg = '#1f2231', fg = '#00b851' }, -- #85be64 #00b851 #3ca8df
			},
			color = { gui = 'bold', bg = '#00b851', fg = '#1a1b26' },
			padding = { left = 1, right = 0 },
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
				color = { gui = 'bold', bg = '#1f2231', fg = '#51a2db' }, -- #294172 #51a2db #3c84b4
			},
			color = { gui = 'bold', bg = '#51a2db', fg = '#1a1b26' },
			padding = { left = 0, right = 1 },
		}
		-- }}}

		-- Get LSP Clients{{{
		local lsp_clients = {
			function()
				local lsp_clients = vim.lsp.get_clients()
				local server_names = {}

				if not lsp_clients or #lsp_clients == 0 then return 'LSP Stopped!' end

				for _, client in pairs(lsp_clients) do
					local client_name = client.name
					if client_name then table.insert(server_names, client_name) end
				end

				-- Add linters (from nvim-lint)
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

				-- Add Formatters (from conform.nvim)
				if package.loaded['conform'] then
					local has_conform, conform = pcall(require, 'conform')
					if has_conform then
						local formatters = conform.list_formatters(0)
						vim.list_extend(
							server_names,
							vim.tbl_map(function(formatter) return formatter.name end, formatters)
						)
					end
				end

				return table.concat(vim.fn.uniq(server_names), ', ')
			end,
			icon = {
				' 󰪩 ', -- 󰪩 
				align = 'right',
				color = { bg = '#bb9af7', fg = '#1a1b26' },
			},
			color = { bg = '#1f2231', fg = '#bb9af7' },
			padding = { left = 1, right = 0 },
		}
		-- }}}

		-- Setup
		require('lualine').setup {
			options = {
				globalstatus = true,
				component_separators = { left = '|', right = '|' },
				section_separators = { left = '', right = '' },
				disabled_filetypes = { 'alpha', 'lazy', 'telescope' },
			},

			sections = {
				lualine_a = {
					nvim_icon,

					{
						'branch',
						icon = {
							'󰊢 ',
							align = 'left',
							color = { bg = '#ff966c', fg = '#1e2030' },
						},
						color = { bg = '#1f2231', fg = '#ff966c' },
					},
				},
				lualine_b = {},
				lualine_c = {
					{
						'diff',
						symbols = { added = ' 󰐕 ', modified = ' 󰜥 ', removed = ' 󰍴 ' },
						diff_color = {
							added = { fg = '#4fd6be' },
							modified = { fg = '#ffc777' },
							removed = { fg = '#ff757f' },
						},
						color = { bg = '#16161e' },
						padding = { left = 0, right = 1 },
					},
				},
				lualine_x = {
					{
						require('lazy.status').updates,
						cond = require('lazy.status').has_updates,
						color = { bg = '#16161e', fg = '#ffc777' },
					},
				},
				lualine_y = {},
				lualine_z = {
					lsp_clients,
					sysos_icon,
				},
			},
		}
	end,
}
