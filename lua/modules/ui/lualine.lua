-- Conditions{{{
local hide_at_60 = function()
	return vim.o.columns > 60
end

local hide_at_80 = function()
	return vim.o.columns > 80
end

local hide_at_100 = function()
	return vim.o.columns > 100
end
-- }}}

-- Logo Icon{{{
local logo_icon = {
	function()
		return '󰵮' -- 󰣠  󰵮 󰚩
	end,
	color = { bg = '#0db9d7', fg = '#1a1b26' },
	padding = { left = 1, right = 1 },
	cond = hide_at_80,
}
-- }}}

-- Working Dir{{{
local directory = {
	function()
		return string.match(vim.loop.cwd(), '/([^/]+)$')
	end,
	icon = {
		' ',
		align = 'left',
		color = { bg = '#ffc777', fg = '#1e2030' },
	},
	color = { bg = '#2f334d', fg = '#ffc777' },
}
-- }}}

-- Tabs/Spaces{{{
local spaces = {
	function()
		return ' ↹ ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
	end,
	color = { fg = '#ffc777' },
	padding = { left = 0, right = 1 },
	cond = hide_at_100,
}
-- }}}

-- Words Count{{{
local wordcount = {
	function()
		return tostring(vim.fn.wordcount().words)
	end,
	icon = { '', align = 'right' },
	color = { fg = '#b8db87' },
	cond = hide_at_100,
}
-- }}}

-- Progress{{{
local progress = function()
	local current_line = vim.fn.line '.'
	local total_lines = vim.fn.line '$'
	local chars =
	{ '__', '▁▁', '▂▂', '▃▃', '▄▄', '▅▅', '▆▆', '▇▇', '██' }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	-- return chars[index]
	return '%#SLProgress#' .. chars[index] .. '%*'
end
-- }}}

-- Language SP{{{
-- LSP Null-ls{{{
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
			language_servers = client_names_str .. ''
			return language_servers
		end
	end,
	icon = {
		' 󰪩 ', -- 󰪩 
		align = 'right',
		color = { bg = '#0db9d7', fg = '#1a1b26' },
	},
	color = { bg = '#2f334d', fg = '#0db9d7' },
	padding = { left = 1, right = 0 },
}
-- }}}

-- LSP no Null-LS{{{
local clients_lsp = {
	function()
		local bufnr = vim.api.nvim_get_current_buf()

		local clients = vim.lsp.buf_get_clients(bufnr)
		if next(clients) == nil then
			return ''
		end

		local c = {}
		for _, client in pairs(clients) do
			table.insert(c, client.name)
		end
		return table.concat(c, ' ')
	end,
	icon = {
		' 󰪩 ', -- 󰪩 
		align = 'right',
		color = { bg = '#0db9d7', fg = '#1a1b26' },
	},
	color = { bg = '#2f334d', fg = '#0db9d7' },
	padding = { left = 1, right = 0 },
}
-- }}}

-- LSP No Null-LS Alt{{{
local lsp_clients = {
	function()
		local clients = vim.lsp.get_active_clients()
		local clients_list = {}
		for _, client in pairs(clients) do
			table.insert(clients_list, client.name)
		end
		return dump(clients_list)
	end,
	icon = {
		' 󰪩 ', -- 󰪩 
		align = 'right',
		color = { bg = '#0db9d7', fg = '#1a1b26' },
	},
	color = { bg = '#2f334d', fg = '#0db9d7' },
	padding = { left = 1, right = 0 },
}
-- Table to String for printing
function dump(o)
	if type(o) == 'table' then
		local s = ''
		for k, v in pairs(o) do
			if type(k) ~= 'number' then
				k = '"' .. k .. '"'
			end
			s = s .. k .. ':' .. dump(v) .. ' '
			-- s = s .. dump(v) .. ' '
		end
		return s
	else
		return tostring(o)
	end
end

-- }}}

-- Get LSP fron null-ls, lint and formatter -- {{{
local function get_attached_clients()
	local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }
	if #buf_clients == 0 then
		return 'LSP Inactive'
	end

	local buf_ft = vim.bo.filetype
	local buf_client_names = {}

	-- add client
	for _, client in pairs(buf_clients) do
		if client.name ~= 'null-ls' then
			table.insert(buf_client_names, client.name)
		end
	end

	-- Generally, you should use either null-ls or nvim-lint + formatter.nvim, not both.

	-- Add sources (from null-ls)
	-- null-ls registers each source as a separate attached client, so we need to filter for unique names down below.
	local null_ls_s, null_ls = pcall(require, 'null-ls')
	if null_ls_s then
		local sources = null_ls.get_sources()
		for _, source in ipairs(sources) do
			if source._validated then
				for ft_name, ft_active in pairs(source.filetypes) do
					if ft_name == buf_ft and ft_active then
						table.insert(buf_client_names, source.name)
					end
				end
			end
		end
	end

	-- Add linters (from nvim-lint)
	local lint_s, lint = pcall(require, 'lint')
	if lint_s then
		for ft_k, ft_v in pairs(lint.linters_by_ft) do
			if type(ft_v) == 'table' then
				for _, linter in ipairs(ft_v) do
					if buf_ft == ft_k then
						table.insert(buf_client_names, linter)
					end
				end
			elseif type(ft_v) == 'string' then
				if buf_ft == ft_k then
					table.insert(buf_client_names, ft_v)
				end
			end
		end
	end

	-- Add formatters (from formatter.nvim)
	local formatter_s, _ = pcall(require, 'formatter')
	if formatter_s then
		local formatter_util = require 'formatter.util'
		for _, formatter in ipairs(formatter_util.get_available_formatters_for_ft(buf_ft)) do
			if formatter then
				table.insert(buf_client_names, formatter)
			end
		end
	end

	-- This needs to be a string only table so we can use concat below
	local unique_client_names = {}
	for _, client_name_target in ipairs(buf_client_names) do
		local is_duplicate = false
		for _, client_name_compare in ipairs(unique_client_names) do
			if client_name_target == client_name_compare then
				is_duplicate = true
			end
		end
		if not is_duplicate then
			table.insert(unique_client_names, client_name_target)
		end
	end

	local client_names_str = table.concat(unique_client_names, ', ')
	local language_servers = string.format('[%s]', client_names_str)

	return language_servers
end
-- }}}

-- }}}

require('lualine').setup {
	options = {
		globalstatus = true,
		component_separators = { left = '│', right = '│' },
		section_separators = { left = '', right = '' },
	},
	sections = {
		lualine_a = {
			logo_icon,

			{
				'filetype',
				colored = true,
				icon_only = false,
				icons_enabled = true,
				color = { bg = '#2f334d', fg = '#41a6b5' },
				cond = hide_at_80,
			},

			directory,

			-- filename{{{
			--[[ {
				'filename',
				file_status = true,
				newfile_status = true,
				path = 0,
				shorting_target = 40,
				symbols = {
					modified = '󰉉',
					readonly = '󰈡',
					unnamed = '󱇧',
					newfile = '󰈮',
				},
				color = { bg = '#2f334d', fg = '#41a6b5' },
			}, ]]
			-- }}}
		},
		lualine_b = {
			{
				'branch',
				icon = { '󰊢 ', color = { bg = '#ff966c', fg = '#1e2030' } },
				color = { bg = '#2f334d', fg = '#ff966c' },
			},
		},
		lualine_c = {
			spaces,

			{
				'filesize',
				icon = '󱅝',
				color = { fg = '#7ca1f2' },
				cond = hide_at_100,
			},

			{
				'searchcount',
				icon = '',
				color = { fg = '#fca7ea' },
				cond = hide_at_100,
			},

			{
				'diff',
				symbols = { added = ' 󰐕 ', modified = ' 󰜥 ', removed = ' 󰍴 ' },
				diff_color = {
					added = { fg = '#4fd6be' },
					modified = { fg = '#ffc777' },
					removed = { fg = '#ff757f' },
				},
			},
		},
		lualine_x = {
			{
				'diagnostics',
				diagnostics_color = {
					error = { fg = '#ff757f' },
					warn = { fg = '#ffc777' },
					hint = { fg = '#c099ff' },
					info = { fg = '#0db9d7' },
				},
				symbols = {
					error = '  ',
					warn = ' 󰈅 ',
					info = ' 󰙎 ',
					hint = ' 󰜕 ',
				},
				update_in_insert = true,
			},

			{
				'selectioncount',
				icon = { '󰩬', align = 'right' },
				color = { fg = '#fca7ea' },
			},

			wordcount,

			{
				'location',
				icon = {
					'󰍒', -- 󱋛 󰍒 󰍎  󱄂
					align = 'right',
					color = { fg = '#e26a75' },
				},
				color = { fg = '#e26a75' },
				cond = hide_at_100,
			},

			{
				'progress',
				color = { fg = '#41a6b5' },
				cond = hide_at_100,
			},
		},
		lualine_y = {
			{
				'spell_status',
				icon = {
					' 󰓆 ',
					align = 'right',
					color = { bg = '#fca7ea', fg = '#1e2030' },
				},
				color = { bg = '#2f334d', fg = '#fca7ea' },
				padding = { left = 1, right = 0 },
			},
		},
		lualine_z = {
			lsp_servers,

			{
				'fileformat',
				symbols = { unix = 'unix' },
				icon = {
					' 󰌽 ', -- 󰌽 󰣛 
					align = 'right',
					color = { bg = '#c099ff', fg = '#1e2030' },
				},
				color = { bg = '#2f334d', fg = '#c099ff' },
				padding = { left = 1, right = 0 },
			},
		},
	},
}
