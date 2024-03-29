local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
	return vim.api.nvim_create_augroup('lazyvim_' .. name, { clear = true })
end

autocmd('BufEnter', {
	desc = 'Remove New Line Comment',
	group = augroup 'remove_new_line_comment',
	callback = function()
		vim.opt.formatoptions:remove { 'c', 'r', 'o' }
	end,
})

autocmd('BufReadPost', {
	desc = 'Go To The Last Cursor Postion',
	group = augroup 'last_cursor_postion',
	callback = function()
		if vim.fn.line '\'"' > 1 and vim.fn.line '\'"' <= vim.fn.line '$' then
			vim.cmd 'normal! g`"'
		end
	end,
})

-- Testing Centering Cursor{{{
--[[ autocmd('BufReadPost', {
	desc = 'Center when go To The Last Cursor Postion',
	group = augroup 'center_in_last_cursor_postion',
	callback = function()
		if vim.fn.line '\'"' > 1 and vim.fn.line '\'"' <= vim.fn.line '$' then
			vim.cmd 'normal! zz`"'
		end
	end,
}) ]]
--[[ autocmd('InsertLeave', {
	desc = 'Center when Insert Leave',
	group = augroup 'center_insert_leave',
	callback = function()
		vim.cmd 'normal! zz`"'
	end,
}) ]]
-- }}}

autocmd('BufWritePre', {
	desc = 'Remove Whitespace On Save',
	group = augroup 'remove_whitespace_on_save',
	pattern = '*',
	callback = function()
		vim.cmd ':%s/\\s\\+$//e'
	end,
})

autocmd('TextYankPost', {
	desc = 'Highlight On Yank',
	group = augroup 'yank_highlight',
	callback = function()
		require('vim.highlight').on_yank {
			higroup = 'YankHighlight',
			timeout = 100,
		}
	end,
})

autocmd('FileType', {
	desc = 'Close Some Filetypes With <q>',
	group = augroup 'close_with_q',
	pattern = {
		'checkhealth',
		'help',
		'lspinfo',
		'man',
		'PlenaryTestPopup',
		'qf',
		'spectre_panel',
		'tsplayground',
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
	end,
})

autocmd({ 'BufRead', 'BufNewFile', 'FileType' }, {
	desc = 'Check Spell In Some File',
	group = augroup 'check_spell',
	pattern = { '*.gitcommit', '*.txt', '*.md', '*.text' },
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.wrap = true
	end,
})

autocmd('Filetype', {
	desc = 'Set indentation To 4 Spaces In Some Filetypes',
	group = augroup 'set_indent',
	pattern = { 'js', 'ts' },
	callback = function()
		vim.bo.shiftwidth = 4
		vim.bo.tabstop = 4
	end,
})

autocmd('VimResized', {
	desc = 'Equalize Splits',
	group = augroup 'resize_splits',
	callback = function()
		vim.cmd 'wincmd ='
	end,
})

vim.api.nvim_create_autocmd('TermOpen', {
	desc = 'Disable Numbers on Terminal',
	group = augroup 'no_terminal_numbers',
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

-- Plugins

autocmd({ 'User' }, {
	desc = 'Hide Tabs, Status & CMD in Alpha',
	group = augroup 'hide_tabs_in_alpha',
	pattern = { 'AlphaReady' },
	callback = function()
		vim.opt.cmdheight = 0
		vim.opt.laststatus = 0
		vim.opt.showtabline = 0
		autocmd('BufUnload', {
			pattern = '<buffer>',
			callback = function()
				vim.opt.cmdheight = 1
				vim.opt.laststatus = 3
				vim.opt.showtabline = 0
			end,
		})
	end,
})

autocmd('FileType', {
	desc = 'Disable Indentscope in Some FileType',
	group = augroup 'disable_indents',
	pattern = {
		'alpha',
		'dashboard',
		'glowpreview',
		'help',
		'lazy',
		'mason',
		'Trouble',
		'undotree',
	},
	callback = function()
		vim.b.miniindentscope_disable = true
	end,
})
