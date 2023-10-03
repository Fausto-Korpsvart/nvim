local keymap = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, {
		silent = true,
		noremap = true,
		nowait = true,
		desc = desc,
	})
end

-- Neovim Core{{{
keymap('n', 'so', ':source %<CR>', 'SourceFile')
keymap('n', 'me', '<CMD>messages<CR>', 'Show Messages')
keymap('i', 'kj', '<Esc>', 'Remap Esc to kj')
keymap('n', 'q', '<Nop>', 'Disable recording with q')
keymap('n', 'Q', '<nop>', 'Disable registring with Q')
-- }}}

-- Managing Buffers & Tabs{{{
keymap('n', '<C-h>', '<C-w>h', 'Move to Buffer Left')
keymap('n', '<C-j>', '<C-w>j', 'Move to Buffer Down')
keymap('n', '<C-k>', '<C-w>k', 'Move to Buffer Up')
keymap('n', '<C-l>', '<C-w>l', 'Move to Buffer Right')
keymap('n', '<leader>d', '<CMD>bp<CR>', 'Buffer Prev')
keymap('n', '<leader>f', '<CMD>bn<CR>', 'Buffer Next')
keymap('n', 'nt', '<CMD>tabnew<CR>', 'Tab New')
keymap('n', 'tp', '<CMD>tabn<CR>', 'Tab Next')
keymap('n', 'tn', '<CMD>tabp<CR>', 'Tab Prev')
keymap('n', 'sv', '<C-w>v', 'Vertical Buffs')
keymap('n', 'sh', '<C-w>s', 'Horizontal Buffs')
keymap('n', '<S-o>', '<CMD>vertical resize -2<CR>', 'Resizing Left')
keymap('n', '<S-u>', '<CMD>resize -2<CR>', 'Resizing Down')
keymap('n', '<S-i>', '<CMD>resize +2<CR>', 'Resizing Up')
keymap('n', '<S-y>', '<CMD>vertical resize +2<CR>', 'Resizing Right')
-- }}}

-- Moving Code{{{
keymap('v', '>', '>gv', 'Indenting Code to Right')
keymap('v', '<', '<gv', 'Indenting Code to Left')
keymap('n', 'K', ':move .-2<CR>==', 'Moving Code Up Normal Mode')
keymap('n', 'J', ':move .+1<CR>==', 'Moving Code Down Normal Mode')
keymap('x', 'K', ":move '<-2<CR>gv-gv", 'Moving Code Up Visual Mode')
keymap('x', 'J', ":move '>+1<CR>gv-gv", 'Moving Code Down Visual Mode')
-- }}}

-- Text Editing{{{
keymap('n', '<Leader>w', '<CMD>w<CR>', 'Basic Save file')
keymap('n', '<Leader>W', '<CMD>silent wa<CR>', 'Save all files')
keymap('n', '<Leader>q', '<CMD>q<CR>', 'Quit Buffer')
keymap('n', '<Leader>Q', '<CMD>qa<CR>', 'Quit Buffer')
keymap('n', '<Leader>x', '<CMD>bdelete<CR>', 'Delete Buffer')
keymap('v', '<Leader>fr', 'gq', 'Range Formatting')
keymap('n', '<Leader>fl', 'gqq', 'Line Formatting')
keymap('n', '[u', 'mzO<Esc>`z', 'Add Blank Line Above')
keymap('n', '[d', 'mzo<Esc>`z', 'Add Blank Line Below')
keymap('n', ']u', 'kddj`z', 'Delete Blank Line Above')
keymap('n', ']d', 'jddk`z', 'Delete Blank Line Below')
keymap('v', 'y', 'ygv<ESC>', 'Cursor at the bottom after yank')
keymap('v', 'p', 'pgv<ESC>', 'Cursor at the bottom after paste')
keymap('v', 'p', '"_dP', 'Better paste')
keymap('n', 'x', '"_x', 'Dont yank with x')
keymap('n', 'dw', 'vb"_d', 'Delete a word backwards')
keymap('n', 'H', '^<ESC>', 'Go to beginning of line')
keymap('n', 'L', '$<ESC>', 'Go to end of line')
keymap('v', '`', 'u', 'Change to Lowercase')
keymap('v', '<A-`>', 'U', 'Change to Uppercase')
keymap('n', '=', '<C-a>', 'Increment Number')
keymap('n', '-', '<C-x>', 'Decrement Number')
keymap('n', '<Space>', ':noh<CR>', 'No Highlight')
keymap('n', '<F8>', '<CMD>set list!<CR>', 'Set List')
keymap('n', '<F9>', '<CMD>set spell!<CR>', 'Set Spell')
keymap('n', '<F10>', '<CMD>setlocal spell! spelllang=en_gb<CR>', 'Set Spell to EN_GB')
keymap('n', '<F11>', '<CMD>setlocal spell! spelllang=es<CR>', 'Set Spell to ES_MX')
keymap('v', '<Leader>fm', 'gqap', 'Format paragraph at colorcolumn')
keymap('n', '<leader>rw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], 'Multiple Cursor')
-- }}}

-- Terminal{{{
function _G.set_terminal_keymaps()
	local opt = { noremap = true }
	local key = vim.api.nvim_buf_set_keymap
	key(0, 't', 'kj', [[<C-\><C-n>]], opt)
	key(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opt)
	key(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opt)
	key(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opt)
	key(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opt)
end

vim.cmd [[autocmd TermOpen term://* lua set_terminal_keymaps()]]
-- }}}

-- Tmux Navigate{{{
keymap('n', '<C-h>', '<CMD>TmuxNavigateLeft<CR>', 'Move to Buffer Left')
keymap('n', '<C-j>', '<CMD>TmuxNavigateDown<CR>', 'Move to Buffer Down')
keymap('n', '<C-k>', '<CMD>TmuxNavigateUp<CR>', 'Move to Buffer Up')
keymap('n', '<C-l>', '<CMD>TmuxNavigateRight<CR>', 'Move to Buffer Right')
-- }}}
