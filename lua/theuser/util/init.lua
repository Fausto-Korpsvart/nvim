local M = {}

-- Random Colors
math.randomseed(os.time())
function M.color_picker()
	local colors = {
		'MsgArea',
		'NormalFloat',
		'TodoFgFIX',
		'TodoFgHACK',
		'TodoFgNOTE',
		'TodoFgTODO',
		'TodoFgWARN',
		'TodoFgPERF',
		'TodoFgTEST',
		'Fugit2Modified',
		'CmpItemAbbrMatchFuzzy',
	}

	return colors[math.random(#colors)]
end

-- Discipline
-- Based on https://github.com/craftzdog/dotfiles-public/blob/master/.config/nvim/lua/craftzdog/discipline.lua
-- function M.nvim_discipline()
-- 	local id
-- 	local ok = true
-- 	for _, key in ipairs { 'h', 'j', 'k', 'l' } do
-- 		local count = 0
-- 		local timer = assert(vim.loop.new_timer())
-- 		local map = key
-- 		vim.keymap.set('n', key, function()
-- 			if vim.v.count > 0 then count = 0 end
-- 			if count >= 10 then
-- 				ok, id =
-- 					pcall(vim.notify, '  Keep calm and learn Neovim  ', vim.log.levels.WARN, {
-- 						-- icon = '',
-- 						replace = id,
-- 						keep = function() return count >= 10 end,
-- 					})
-- 				if not ok then
-- 					id = nil
-- 					return map
-- 				end
-- 			else
-- 				count = count + 1
-- 				timer:start(2000, 0, function() count = 0 end)
-- 				return map
-- 			end
-- 		end, { expr = true, silent = true })
-- 	end
-- end

-- Quick Notes
-- Based on https://github.com/theopn/theovim
M.notes_loaded = false
M.notes_buf, M.notes_win = nil, nil
M.notes_file = vim.fn.stdpath 'data' .. '/quick_notes.md' -- Set the file path for notes

function M.load_notes()
	local notes_content = {}
	if vim.fn.filereadable(M.notes_file) == 1 then notes_content = vim.fn.readfile(M.notes_file) end

	if not M.notes_buf or not vim.api.nvim_buf_is_valid(M.notes_buf) then
		M.notes_buf = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_buf_set_option(M.notes_buf, 'bufhidden', 'hide')
		vim.api.nvim_buf_set_option(M.notes_buf, 'filetype', 'markdown')
		vim.api.nvim_buf_set_lines(M.notes_buf, 0, -1, false, notes_content)
	end
end

function M.save_notes()
	if M.notes_buf and vim.api.nvim_buf_is_valid(M.notes_buf) then
		local notes_content = vim.api.nvim_buf_get_lines(M.notes_buf, 0, -1, false)
		vim.fn.writefile(notes_content, M.notes_file)
	end
end

function M.toggle_quick_notes()
	if not M.notes_loaded or not vim.api.nvim_win_is_valid(M.notes_win) then
		M.load_notes()

		-- Create a window
		M.notes_win = vim.api.nvim_open_win(M.notes_buf, true, {
			title = ' QUICK TODO ',
			title_pos = 'right',
			border = 'single',
			relative = 'editor',
			style = 'minimal',
			width = math.ceil(vim.o.columns * 0.3),
			height = math.ceil(vim.o.lines * 0.8),
			row = 2, --> Top of the window

			col = math.ceil(vim.o.columns * 1), --> Far right; should add up to 1 with win_width
		})
		vim.api.nvim_win_set_option(M.notes_win, 'winblend', 0) --> Semi transparent buffer

		-- Additional keymap for saving notes
		vim.keymap.set(
			'n',
			'<Leader>w',
			function() M.save_notes() end,
			{ silent = true, buffer = M.notes_buf }
		)
	else
		M.save_notes()
		vim.api.nvim_win_hide(M.notes_win)
	end
	M.notes_loaded = not M.notes_loaded
end

do
	vim.api.nvim_create_user_command('Notes', M.toggle_quick_notes, { nargs = 0 })
	vim.keymap.set('n', '<Leader>no', '<CMD>Notes<CR>')
end

return M
