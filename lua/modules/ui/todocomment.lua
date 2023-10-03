local fix = '#db4b4b'
local hack = '#ff9e64'
local note = '#1abc9c'
local todo = '#0db9d7'
local warn = '#ffc777'
local perf = '#bb9af7'
local test = '#3e68d7'

require('todo-comments').setup {
	keywords = {
		FIX = { icon = '', color = fix },
		HACK = { icon = '', color = hack },
		NOTE = { icon = '󱇗', color = note },
		PERF = { icon = '󰾅', color = perf },
		TODO = { icon = '', color = todo },
		WARN = { icon = '', color = warn },
		TEST = { icon = '󰙨', color = test },
	},
}

vim.keymap.set('n', 'to', '<CMD>TodoTrouble<CR>')
vim.keymap.set('n', 'tk', '<CMD>TodoLocList<CR>')

vim.keymap.set('n', 'nt', function()
	require('todo-comments').jump_next()
end, { desc = 'Next todo comment' })

vim.keymap.set('n', 'pt', function()
	require('todo-comments').jump_prev()
end, { desc = 'Prev todo comment' })
