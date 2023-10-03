require('trouble').setup {
	position = 'right', -- top right bottom left
	width = 40,
	height = 10,
	mode = 'workspace_diagnostics',
	fold_open = '⏷',
	fold_closed = '⏵',
	action_keys = { jump = { 'l', '<tab>' } },
	use_diagnostic_signs = true,
}

vim.keymap.set('n', 'tr', '<CMD>TroubleToggle<CR>')
vim.keymap.set('n', 'tw', '<CMD>TroubleToggle workspace_diagnostics<CR>')
vim.keymap.set('n', 'td', '<CMD>TroubleToggle document_diagnostics<CR>')
