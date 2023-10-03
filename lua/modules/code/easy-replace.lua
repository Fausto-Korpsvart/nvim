vim.g.easy_replace_highlight_ctermbg = 'lightgreen'
vim.g.easy_replace_highlight_guibg = '#c53b53'

vim.keymap.set('n', 'wr', '<CMD>EasyReplaceWord<CR>')
vim.keymap.set('n', 'rw', '<CMD>EasyReplaceCword<CR>')
vim.keymap.set('v', 'wr', '<CMD>EasyReplaceWordInVisual<CR>')
vim.keymap.set('v', 'rw', '<CMD>EasyReplaceCwordInVisual<CR>')
