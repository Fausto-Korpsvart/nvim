require('lsp_signature').setup {
	bind = true,
	doc_lines = 10,
	max_height = 15,
	max_width = 80,
	wrap = true,
	floating_window = true,
	close_timeout = 1000,
	hint_enable = true,
	hint_prefix = '🐼 ',
	hint_scheme = 'String',
	hint_inline = function()
		return false
	end,
	handler_opts = { border = 'single' },
	zindex = 200,
	toggle_key = '<C-x>',
	select_signature_key = '<C-s>',
	move_cursor_key = '<C-w>',
}

vim.keymap.set({ 'n' }, '<Leader>sh', function()
	require('lsp_signature').toggle_float_win()
end, { silent = true, noremap = true, desc = 'toggle signature' })

vim.keymap.set({ 'n' }, '<Leader>k', function()
	vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = 'toggle signature' })
