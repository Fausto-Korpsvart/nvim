return {
	'b0o/incline.nvim',
	event = 'BufReadPre',
	config = function()
		local color = require 'theuser.util.color'

		require('incline').setup {
			render = function(props)
				-- Diagnostics{{{
				local function get_diagnostic_label()
					local icons =
						{ error = '  ', warn = '  ', info = '  ', hint = '  ' }
					local label = {}

					for severity, icon in pairs(icons) do
						local n = #vim.diagnostic.get(
							props.buf,
							{ severity = vim.diagnostic.severity[string.upper(severity)] }
						)
						if n > 0 then
							table.insert(
								label,
								{ icon .. n .. ' ', group = 'DiagnosticSign' .. severity }
							)
						end
					end
					if #label > 0 then table.insert(label, { '' }) end
					return label
				end
				-- }}}

				-- Directory & File{{{
				local function file_dir()
					local filedir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':h:t')
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
					local icon, color = require('nvim-web-devicons').get_icon_color(filename)

					if vim.api.nvim_buf_get_option(props.buf, 'modified') then
						filedir = filedir
						filename = filename
						icon = icon .. '  󰆓 '
					end

					return {
						{ '  ', filedir },
						{ ' 󰑃  ', filename, ' ', icon, guifg = color }, --   ⯈ ▶
					}
				end
				-- }}}

				-- Search Count{{{
				local function search_count(args)
					if vim.v.hlsearch == 0 then return '' end
					local ok, s_count =
						pcall(vim.fn.searchcount, (args or {}).options or { recompute = true })
					if not ok or s_count.current == nil or s_count.total == 0 then return '' end

					if s_count.incomplete == 1 then return '?/?' end

					local too_many = ('>%d'):format(s_count.maxcount)
					local current = s_count.current > s_count.maxcount and too_many
						or s_count.current
					local total = s_count.total > s_count.maxcount and too_many or s_count.total
					return ('   ' .. '%s/%s' .. ''):format(current, total)
				end
				-- }}}

				-- Spell Status{{{
				local function spell_status()
					local spell = vim.api.nvim_get_option_value('spell', {})
					local lang = vim.api.nvim_get_option_value('spelllang', {})
					local icon = '  󰓆 '

					if spell then
						local res = ''
						if lang then res = string.lower(lang) end
						return icon .. res
					end
					return ''
				end
				-- }}}

				-- Tab Spaces{{{
				local function tab_spaces()
					local tab_count = vim.api.nvim_buf_get_option(0, 'shiftwidth') .. ''
					return '  ⭾ ' .. tab_count
				end
				-- }}}

				-- File Size{{{
				local function file_size()
					local file = vim.fn.expand '%:p'
					if file == nil or #file == 0 then return '' end
					local size = vim.fn.getfsize(file)
					if size <= 0 then return '' end

					local suffixes = { 'b', 'k', 'm', 'g' }

					local i = 1
					while size > 1024 and i < #suffixes do
						size = size / 1024
						i = i + 1
					end

					local format = i == 1 and '%d%s' or '%.1f%s'
					return '  ' .. string.format(format, size, suffixes[i] .. ' 󱅝') --󰖡 󱅝
				end
				-- }}}

				-- Location File{{{
				local function location()
					local line = vim.fn.line '.'
					local col = vim.fn.virtcol '.'
					return string.format('  ' .. '%3d:%-2d', line, col) .. '  '
				end
				-- }}}

				-- Progress File{{{
				local function progress()
					local cur = vim.fn.line '.'
					local total = vim.fn.line '$'
					if cur == 1 then
						return '  ' .. 'Top'
					elseif cur == total then
						return '  ' .. 'Bot'
					else
						return string.format('  ' .. '%2d%%%%', math.floor(cur / total * 100))
							.. ''
					end
				end
				-- }}}

				-- Buffer Index{{{
				local function buf_index()
					return ' 󰙀 ' .. vim.api.nvim_win_get_number(props.win)
					-- 󰈮 󰙀
				end
				-- }}}

				-- Calling {{{
				return {
					{
						get_diagnostic_label(),
						guibg = color.black,
					},
					{
						file_dir(),
						guibg = color.black,
					},
					{
						search_count(),
						guifg = color.blue,
						guibg = color.black,
					},
					{
						spell_status(),
						guifg = color.pink,
						guibg = color.black,
					},
					{
						tab_spaces(),
						guifg = color.orange,
						guibg = color.black,
					},
					{
						file_size(),
						guifg = color.purple,
						guibg = color.black,
					},
					{
						location(),
						guifg = color.red,
						guibg = color.black,
					},
					--[[ {
						buf_index(),
						group = 'DevIconWindows',
					}, ]]
				}
			end,
			-- }}}

			hide = {
				cursorline = true,
				focused_win = false,
				only_win = false,
			},

			highlight = {
				groups = {
					InclineNormal = {
						default = false,
						group = 'TodoFgWARN',
					},
					InclineNormalNC = {
						default = false,
						group = 'RainbowDelimiterCyan',
					},
				},
			},

			window = {
				padding = 0,
				margin = {
					horizontal = 0,
					vertical = 0,
				},
			},
		}
	end,
}
