require('Comment').setup {
	ignore = '^$',
	pre_hook = function()
		require('ts_context_commentstring.internal').update_commentstring {}
	end,
}
require('Comment.ft').set('rasi', { '// %s', '/* %s */' })
-- require('Comment.ft').set('scss', { '// %s', '/* %s */' })

vim.keymap.set('n', '<Leader>;', '<Plug>(comment_toggle_linewise_current)')
vim.keymap.set('x', '<Leader>;', '<Plug>(comment_toggle_blockwise_visual)')
vim.keymap.set('x', "<Leader>'", '<Plug>(comment_toggle_linewise_visual)')
