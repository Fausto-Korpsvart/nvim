vim.cmd [[
	let g:codi#width = 40
	let g:codi#rightsplit = 1
	let g:codi#rightalign = 0
	let g:codi#virtual_text = 1 " side buffer to show results
	let g:codi#virtual_text_prefix = ' ⏵ '
	let g:codi#virtual_text_pos = 'right_align' " eol|right_align
]]

vim.keymap.set('n', 'ac', '<CMD>Codi<CR>')
vim.keymap.set('n', 'dc', '<CMD>Codi!<CR>')
vim.keymap.set('n', 'cd', '<CMD>Codi!!<CR>')
vim.keymap.set('n', 'sc', '<CMD>codiSelect<CR>')
