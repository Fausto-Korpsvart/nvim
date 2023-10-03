vim.g.matchup_matchparen_offscreen = {
	method = 'popup',
	fullwidth = 1,
	syntax_hl = 1,
	highlight = 'OffscreenPopup',
}
vim.g.matchup_matchparen_enabled = 1
vim.g.matchup_matchparen_deferred = 0
vim.g.matchup_matchparen_hi_surround_always = 1

vim.keymap.set('n', '<Leader>m', '<PLUG>(matchup-%)')
vim.keymap.set('n', '<Leader>h', '<PLUG>(matchup-g%)')
vim.keymap.set('n', '<Leader>[', '<PLUG>(matchup-[%)')
vim.keymap.set('n', '<Leader>]', '<PLUG>(matchup-]%)')
vim.keymap.set('n', '<Leader>z', '<PLUG>(matchup-z%)')
vim.keymap.set('n', 'wa', '<CMD>MatchupWhereAmI??<CR>')
vim.keymap.set('n', 'mwa', '<CMD>MatchupWhereAmI?<CR>')
