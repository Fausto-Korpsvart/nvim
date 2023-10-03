require('hop').setup {
	keys = 'etovxqpdygfblzhckisuran',
}

vim.keymap.set('n', ';j', '<CMD>HopWord<CR>')
vim.keymap.set('n', ';1', '<CMD>HopChar1<CR>')
vim.keymap.set('n', ';2', '<CMD>HopChar2<CR>')
vim.keymap.set('n', ';l', '<CMD>HopWordCurrentLine<CR>')
vim.keymap.set('n', ';h', '<CMD>HopLineStart<CR>')
vim.keymap.set('v', ';l', '<CMD>HopWord<CR>')
vim.keymap.set('v', ';1', '<CMD>HopChar1<CR>')
vim.keymap.set('v', ';3', '<CMD>HopChar2<CR>')
vim.keymap.set('v', ';j', '<CMD>HopWordCurrentLine<CR>')
vim.keymap.set('n', ';h', '<CMD>HopLineStart<CR>')

-- Highlight
vim.api.nvim_set_hl(0, 'HopNextKey', { bg = '#3e68d7', fg = '#c8d3f5', bold = true })
vim.api.nvim_set_hl(0, 'HopNextKey1', { bg = '#2f334d', fg = '#ff007c', bold = true })
vim.api.nvim_set_hl(0, 'HopNextKey2', { bg = '#2f334d', fg = '#4fd6be', bold = true })
vim.api.nvim_set_hl(0, 'HopCursor', { bg = '#0db9d7', fg = '#1e2030', italic = true })
vim.api.nvim_set_hl(0, 'HopUnmatched', { bg = 'none', fg = 'none', italic = true })
vim.api.nvim_set_hl(0, 'HopPreview', { bg = 'none', fg = 'none', italic = true })
