local M = {}

-- Random Colors
math.randomseed(os.time())
function M.color_picker()
	local colors = {
		'CursorLineNr',
		'Directory',
		'DiagnosticSignOk',
		'DiagnosticSignError',
		'DiagnosticSignWarn',
		'DiagnosticSignHint',
		'DiagnosticSignInfo',
		'Folded',
		'Keyword',
		'String',
		'Field',
	}

	return colors[math.random(#colors)]
end

-- random_colors 2{{{
-- TODO: Understand how to call this function from another file.
-- function M.random_colors(colours)
-- 	return colours[math.random(1, #colours)]
-- end

-- local colours = {
-- 	'#0db9d7',
-- 	'#ffc777',
-- 	'#c099ff',
-- 	'#ff966c',
-- 	'#627259',
-- 	'#4fd6be',
-- }

-- vim.cmd(string.format('hi colors guifg=%s guibg=bg', M.random_colors(colours)))
-- }}}

-- Notes, from: https://github.com/theopn/theovim
-- Small floating buffer to take notes that persists until Neovim closes
M.notes_loaded = false
M.notes_buf, M.notes_win = nil, nil
function M.launch_notes()
	if not M.notes_loaded or not vim.api.nvim_win_is_valid(M.notes_win) then
		if not M.notes_buf or not vim.api.nvim_buf_is_valid(M.notes_buf) then
			-- Create a buffer if it none existed
			M.notes_buf = vim.api.nvim_create_buf(false, true)
			vim.api.nvim_buf_set_option(M.notes_buf, 'bufhidden', 'hide')
			vim.api.nvim_buf_set_option(M.notes_buf, 'filetype', 'markdown')
			vim.api.nvim_buf_set_lines(M.notes_buf, 0, 1, false, {
				'Notes clears as session closes!',
				'',
			})
		end
		-- Create a window
		M.notes_win = vim.api.nvim_open_win(M.notes_buf, true, {
			title = 'Notes',
			title_pos = 'center',
			border = 'single',
			relative = 'editor',
			style = 'minimal',
			height = math.ceil(vim.o.lines * 0.4),
			width = math.ceil(vim.o.columns * 0.3),
			row = 1, --> Top of the window
			col = math.ceil(vim.o.columns * 1), --> Far right; should add up to 1 with win_width
		})
		vim.api.nvim_win_set_option(M.notes_win, 'winblend', 0) --> Semi transparent buffer

		-- Keymaps
		local keymaps_opts = { silent = true, buffer = M.notes_buf }
		vim.keymap.set('n', '<ESC>', function()
			M.launch_notes()
		end, keymaps_opts)
		vim.keymap.set('n', 'q', function()
			M.launch_notes()
		end, keymaps_opts)
	else
		vim.api.nvim_win_hide(M.notes_win)
	end
	M.notes_loaded = not M.notes_loaded
end

do
	vim.api.nvim_create_user_command('Notes', M.launch_notes, { nargs = 0 })
	vim.keymap.set('n', '<Leader>no', '<CMD>Notes<CR>')
end

return M
