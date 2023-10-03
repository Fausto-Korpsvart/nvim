require('sniprun').setup {
	display = { 'VirtualTextOk' }, -- VirtualText tempfloatingwindow
	live_display = { 'VirtualTextOk', 'VirtualTextErr' },
	display_options = { terminal_width = 40 },
}

vim.keymap.set('n', 'sr', '<Plug>SnipRun')
vim.keymap.set('v', 'sr', '<Plug>SnipRun')
vim.keymap.set('n', 'sc', '<Plug>SnipClose')
vim.keymap.set('n', 'sro', '<Plug>SnipRunOperator')
vim.keymap.set('v', 'sro', '<Plug>SnipRunOperator')
