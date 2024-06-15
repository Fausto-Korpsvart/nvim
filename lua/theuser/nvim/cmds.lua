local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
	return vim.api.nvim_create_augroup('lazyvim_' .. name, { clear = true })
end

autocmd('BufEnter', {
	desc = 'Remove New Line Comment',
	group = augroup 'remove_new_line_comment',
	callback = function() vim.opt.formatoptions:remove { 'c', 'r', 'o' } end,
})

autocmd('BufReadPost', {
	desc = 'Go To The Last Cursor Postion',
	group = augroup 'last_loc',
	callback = function(event)
		local exclude = { 'gitcommit' }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then pcall(vim.api.nvim_win_set_cursor, 0, mark) end
	end,
})

autocmd('BufWritePre', {
	desc = 'Remove Whitespace On Save',
	group = augroup 'remove_whitespace_on_save',
	pattern = '*',
	callback = function() vim.cmd ':%s/\\s\\+$//e' end,
})

autocmd('filetype', {
	desc = 'close some filetypes with <q>',
	group = augroup 'close_with_q',
	pattern = {
		'checkhealth',
		'help',
		'lspinfo',
		'man',
		'PlenaryTestPopup',
		'qf',
		'spectre_panel',
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

autocmd('VimResized', {
	desc = 'Equalize Splits',
	group = augroup 'resize_splits',
	callback = function() vim.cmd 'wincmd =' end,
})

autocmd('FileType', {
	desc = 'Vertical Help',
	group = augroup 'verical_help',
	pattern = 'help',
	callback = function()
		vim.bo.bufhidden = 'unload'
		vim.cmd.wincmd 'L'
		vim.cmd.wincmd '='
	end,
})

autocmd('InsertLeave', {
	desc = 'Turn off paste mode when leaving insert',
	pattern = '*',
	command = 'set nopaste',
})

autocmd('FileType', {
	desc = 'Disable concealing in some files',
	pattern = { 'json', 'jsonc', 'markdown' },
	callback = function() vim.opt.conceallevel = 0 end,
})

-- Plugins

autocmd({ 'User' }, {
	desc = 'Hide Tabs, Status & CMD in Alpha',
	group = augroup 'hide_tabs_in_alpha',
	pattern = { 'AlphaReady' },
	callback = function()
		vim.opt.cmdheight = 0
		-- vim.opt.statusline = 0
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
	callback = function() vim.b.miniindentscope_disable = true end,
})
