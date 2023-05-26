return {
	{
		-- https://github.com/Pocco81/true-zen.nvim
		'Pocco81/true-zen.nvim',
		event = 'VeryLazy',
		keys = {
			vim.keymap.set('n', 'zn', '<CMD>TZFocus<CR>'),
			vim.keymap.set('n', 'zm', '<CMD>TZMinimalist<CR>'),
		},
		config = function()
			require('true-zen').setup {
				modes = {
					ataraxis = {
						minimum_writing_area = {
							height = 40,
						},
						padding = {
							left = 50,
							right = 50,
						},
					},
					minimalist = {
						options = {
							number = true,
							relativenumber = true,
						},
					},
				},
				integrations = {
					tmux = true,
					twilight = true,
					lualine = true,
				},
			}
		end,
	},
	{
		-- https://github.com/folke/zen-mode.nvim
		'folke/zen-mode.nvim',
		event = 'VeryLazy',
		keys = {
			vim.keymap.set('n', 'nz', '<CMD>ZenMode<CR>'),
		},
		config = function()
			require('zen-mode').setup {}
		end,
	},
}
