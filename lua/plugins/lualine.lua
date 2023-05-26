return {
	-- https://github.com/nvim-lualine/lualine.nvim
	'nvim-lualine/lualine.nvim',
	event = 'BufRead',
	config = function()

		-- Left Side<[[[
		local fileformat = {
			'fileformat',
			symbols = { unix = ' ' },
			color = { bg = '#db4b4b', fg = '#c0caf5', gui = 'bold' },
			padding = { left = 1, right = 0 },
		}

		local filename = {
			'filename',
			newfile_status = true,
			color = { bg = '#3d59a1', fg = '#c0caf5', gui = 'bold' },
			symbols = { modified = '󰉉', readonly = '', unnamed = '󰷨', newfile = '󰎔' },
		}

		local branch = {
			'branch',
			icons_enabled = true,
			icon = '',
			color = { gui = 'bold', fg = '#e0af68' },
			padding = { left = 1, right = 1 },
		}

		local diff = {
			'diff',
			symbols = { added = '  ', modified = '  ', removed = '  ' },
			diff_color = {
				added = { fg = '#4fd6be', gui = 'bold' },
				modified = { fg = '#c3e88d', gui = 'bold' },
				removed = { fg = '#f7768e', gui = 'bold' },
			},
			padding = { left = 0, right = 1 },
		}

		local spaces = {
			function()
				return ' ↹ ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
			end,
			color = { gui = 'bold', fg = '#bb9af7' },
			padding = { left = 0, right = 1 },
		}

		local filesize = {
			'filesize',
			color = { gui = 'bold', fg = '#4fd6be' },
			padding = { left = 1, right = 1 },
		}

		local searchcount = {
			'searchcount',
			color = { gui = 'bold', fg = '#0db9d7' },
			padding = { left = 1, right = 1 },
		}

		local selectioncount = {
			'selectioncount',
			icon = '󰗉', -- 󰩬
			color = { gui = 'bold', fg = '#ff9e64' },
			padding = { left = 1, right = 1 },
		}
		-- ]]]>

		-- Right Side<[[[
		local location = {
			'location',
			color = { gui = 'bold', fg = '#c25d64' },
			padding = { left = 1, right = 1 },
		}

		local progress = {
			'progress',
			color = { gui = 'bold', fg = '#399a96' },
			padding = { left = 1, right = 1 },
		}

		local diagnostics = {
			'diagnostics',
			diagnostics_color = {
				error = { fg = '#f7768e', gui = 'bold' },
				warn = { fg = '#ff9e64', gui = 'bold' },
				info = { fg = '#0db9d7', gui = 'bold' },
				hint = { fg = '#bb9af7', gui = 'bold' },
			},
			symbols = { error = '  ', warn = '  ', info = '  ', hint = ' 󰵚 ' },
			update_in_insert = true,
			padding = { left = 0, right = 1 },
		}

		-- LSP <[[[
		local lsp_servers = {
			function()
				local buf_ft = vim.bo.filetype
				local clients = vim.lsp.buf_get_clients()
				local client_names = {}

				for _, client in pairs(clients) do
					if client.name ~= 'null-ls' then
						table.insert(client_names, client.name)
					end
				end

				local sources = require 'null-ls.sources'
				local available_sources = sources.get_available(buf_ft)
				local registered = {}

				for _, source in ipairs(available_sources) do
					for method in pairs(source.methods) do
						registered[method] = registered[method] or {}
						table.insert(registered[method], source.name)
					end
				end

				local formatter = registered['NULL_LS_FORMATTING']

				if formatter ~= nil then
					vim.list_extend(client_names, formatter)
				end

				local client_names_str = table.concat(client_names, ' ')
				local language_servers = ''
				local client_names_str_len = #client_names_str

				if client_names_str_len ~= 0 then
					language_servers = client_names_str .. '  '
					return language_servers
				end
			end,

			padding = { left = 1, right = 1 },
			color = { gui = 'bold', bg = '#3d59a1', fg = '#c0caf5' },
		} -- ]]]>

		local filetype = {
			'filetype',
			colored = false,
			icon_only = false,
			icons_enabled = true,
			color = { bg = '#db4b4b', fg = '#c0caf5', gui = 'bold' },
			padding = { right = 1, left = 1 },
		}

		-- ]]]>

		require('lualine').setup {
			options = {
				globalstatus = true,
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
				disabled_filetypes = {
					statusline = {
						'alpha',
						'DiffviewFiles',
						'diffpanel',
						'mind',
						'neo-tree',
						'toggleterm',
						'Trouble',
						'undotree',
					},
				},
			},
			sections = {
				lualine_a = { fileformat, filename },
				lualine_b = { branch },
				lualine_c = { diff, spaces, filesize, searchcount, selectioncount },
				lualine_x = { location, progress, diagnostics },
				lualine_y = {},
				lualine_z = { lsp_servers, filetype },
			},
		}
	end,
}
