return {
	{
		-- https://github.com/chrisbra/changesplugin
		'chrisbra/changesplugin',
		event = 'BufRead',
		config = function()
			vim.g.changes_add_sign = '•'
			vim.g.changes_delete_sign = '•'
			vim.g.changes_modified_sign = '•'
			vim.g.changes_vcs_system = 'git'
			vim.g.ChangesLineOverview = 1
			vim.g.changes_respect_SignColumn = 1
			vim.g.changes_fixed_sign_column = 1
		end,
	},
	{
		-- https://github.com/NvChad/nvim-colorizer.lua
		'NvChad/nvim-colorizer.lua',
		config = function()
			require('colorizer').setup {
				filetypes = { '*' },
				user_default_options = {
					mode = 'background',
					RGB = true,
					RRGGBB = true,
					names = true,
					RRGGBBAA = true,
					AARRGGBB = true,
					rgb_fn = true,
					hsl_fn = true,
					css = true,
					css_fn = true,
					tailwind = true,
					sass = { enable = true, parsers = { 'css' } },
					virtualtext = 'ﱢﱢﱢﱢﱢﱢ', --   ﱢ
				},
			}
		end,
	},
	{
		-- https://github.com/phaazon/hop.nvim
		'phaazon/hop.nvim',
		event = 'VeryLazy',
		keys = {
			vim.keymap.set('n', ';j', '<CMD>HopWord<CR>'),
			vim.keymap.set('n', ';1', '<CMD>HopChar1<CR>'),
			vim.keymap.set('n', ';2', '<CMD>HopChar2<CR>'),
			vim.keymap.set('n', ';l', '<CMD>HopWordCurrentLine<CR>'),
			vim.keymap.set('n', ';h', '<CMD>lua require"hop".hint_lines()<CR>'),
			vim.keymap.set('v', ';l', '<CMD>HopWord<CR>'),
			vim.keymap.set('v', ';1', '<CMD>HopChar1<CR>'),
			vim.keymap.set('v', ';3', '<CMD>HopChar2<CR>'),
			vim.keymap.set('v', ';j', '<CMD>HopWordCurrentLine<CR>'),
			vim.keymap.set('v', ';h', '<CMD>lua require"hop".hint_lines()<CR>'),
		},
		config = function()
			require('hop').setup()
		end,
	},
	{
		-- https://github.com/lukas-reineke/indent-blankline.nvim
		'lukas-reineke/indent-blankline.nvim',
		event = 'BufEnter',
		config = function()
			local hl = vim.api.nvim_set_hl
			local hi_colors = { enable_colors = true }
			local function hi_lines()
				if hi_colors.enable_colors then
					hl(0, 'IndentBlanklineIndent1', { fg = '#E06C75', blend = 0 })
					hl(0, 'IndentBlanklineIndent2', { fg = '#E5C07B', blend = 0 })
					hl(0, 'IndentBlanklineIndent3', { fg = '#98C379', blend = 0 })
					hl(0, 'IndentBlanklineIndent4', { fg = '#56B6C2', blend = 0 })
					hl(0, 'IndentBlanklineIndent5', { fg = '#61AFEF', blend = 0 })
					hl(0, 'IndentBlanklineIndent6', { fg = '#C678DD', blend = 0 })
					return {
						'IndentBlanklineIndent1',
						'IndentBlanklineIndent2',
						'IndentBlanklineIndent3',
						'IndentBlanklineIndent4',
						'IndentBlanklineIndent5',
						'IndentBlanklineIndent6',
					}
				else
					return
				end
			end

			require('indent_blankline').setup {
				char_list = { '', '', '', '' },
				char_highlight_list = hi_lines(),
				use_treesitter = true,
				show_current_context = true,
				show_current_context_start = false,
				indent_blankline_indent_level = 4,
				buftype_exclude = {
					'nofile',
					'quickfix',
					'telescope',
					'terminal',
					'markdown',
					'lazy',
				},
				filetype_exclude = {
					'alpha',
					'git',
					'gitcommit',
					'help',
					'lazy',
					'log',
					'markdown',
					'neo-tree',
					'neogitstatus',
					'nui',
					'TelescopePrompt',
					'Trouble',
				},
			}
		end,
	},
	{
		-- https://github.com/andymass/vim-matchup TODO: Check Floating Highlights
		'andymass/vim-matchup',
		branch = 'master',
		event = 'BufReadPost',
		config = function()
			vim.g.matchup_enabled = 1
			vim.g.matchup_matchparen_enabled = 1
			vim.g.matchup_matchparen_offscreen = { method = 'popup' }
			-- vim.g.matchup_matchparen_deferred           = 1
			vim.g.matchup_matchparen_hi_surround_always = 1
			vim.g.matchup_transmute_enabled = 1
			vim.g.matchup_matchparen_timeout = 500
			vim.g.matchup_matchparen_insert_timeout = 500
		end,
	},
	{
		-- https://github.com/MunifTanjim/prettier.nvim
		'MunifTanjim/prettier.nvim',
		event = 'VeryLazy',
		config = function()
			require('prettier').setup {
				bin = 'prettier',
				filetypes = {
					'css',
					'html',
					'json',
					'markdown',
					'sass',
					'scss',
					'yaml',
				},
				cli_options = {
					arrowParens = 'avoid',
					singleQuote = true,
					bracketSameLine = false,
					htmlWhitespaceSensitivity = 'css',
					singleAttributePerLine = true,
					trailingComma = 'none',
					tabWidth = 4,
					endOfLine = 'lf',
					semi = false,
					printWidth = 80,
					proseWrap = 'always',
				},
				['null-ls'] = {
					condition = function()
						return require('prettier').config_exists {
							check_package_json = true,
						}
					end,
					runtime_condition = function()
						return true
					end,
					timeout = 5000,
				},
			}
		end,
	},
}
