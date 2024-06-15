function ColorConfig(color)
	color = color or 'tokyonight'
	vim.cmd.colorscheme(color)

	-- Highlights{{{
	-- Neovim Core{{{
	local hl = vim.api.nvim_set_hl
	hl(0, 'ColorColumn', { bg = '#1f2231' })
	hl(0, 'CursorLine', { bg = '#1f2231', bold = false })
	hl(0, 'CursorLineNr', { bg = '#1a1b26', fg = '#007197', bold = false })
	hl(0, 'CursorWord', { bg = 'none', fg = '#828bb8', bold = true, underline = true })
	hl(0, 'Folded', { bg = 'none', fg = '#007197' })
	hl(0, 'FoldColumn', { bg = 'none', fg = '#007197' })
	hl(0, 'FoldLevel', { bg = 'none', fg = '#007197' })
	hl(0, 'FoldText', { bg = 'none', fg = '#007197' })
	hl(0, 'Highlight', { bg = '#1a1b26', fg = '#e26a75', bold = true, underline = true })
	hl(0, 'IncSearch', { bg = '#e26a75', fg = '#1f2231', bold = true, underline = true })
	hl(0, 'ModeMsg', { bg = 'none', fg = '#b55a67' })
	hl(0, 'MsgArea', { bg = 'none', fg = '#828bb8' })
	-- hl(0, 'Normal', { bg = 'none' })
	-- hl(0, 'NormalFloat', { bg = 'none' })
	hl(0, 'Search', { bg = '#1a1b26', fg = '#e26a75', bold = true, underline = true })
	hl(0, 'SignColumn', { bg = 'none' })
	hl(0, 'WinSeparator', { bg = 'none', fg = '#292e42' })
	-- }}}

	-- Completion{{{
	hl(0, 'CmpItemAbbrDeprecated', { fg = '#545c7e', strikethrough = true })
	hl(0, 'CmpItemAbbrMatch', { bg = 'none', fg = '#b55a67', bold = true })
	hl(0, 'CmpItemAbbrMatchFuzzy', { fg = '#b55a67' })
	hl(0, 'CmpItemMenu', { fg = '#3e68d7', bold = true })

	hl(0, 'CmpItemKindTabnine', { fg = '#c099ff', bg = '#1f2231' })

	hl(0, 'CmpItemKindField', { fg = '#ff757f', bg = '#1f2231' })
	hl(0, 'CmpItemKindProperty', { fg = '#ff757f', bg = '#1f2231' })
	hl(0, 'CmpItemKindEvent', { fg = '#ff757f', bg = '#1f2231' })

	hl(0, 'CmpItemKindText', { fg = '#b8db87', bg = '#1f2231' })
	hl(0, 'CmpItemKindEnum', { fg = '#ff966c', bg = '#1f2231' })
	hl(0, 'CmpItemKindKeyword', { fg = '#b8db87', bg = '#1f2231' })

	hl(0, 'CmpItemKindConstant', { fg = '#ffc777', bg = '#1f2231' })
	hl(0, 'CmpItemKindConstructor', { fg = '#ffc777', bg = '#1f2231' })
	hl(0, 'CmpItemKindReference', { fg = '#ffc777', bg = '#1f2231' })

	hl(0, 'CmpItemKindFunction', { fg = '#fca7ea', bg = '#1f2231' })
	hl(0, 'CmpItemKindStruct', { fg = '#fca7ea', bg = '#1f2231' })
	hl(0, 'CmpItemKindClass', { fg = '#fca7ea', bg = '#1f2231' })
	hl(0, 'CmpItemKindModule', { fg = '#fca7ea', bg = '#1f2231' })
	hl(0, 'CmpItemKindOperator', { fg = '#fca7ea', bg = '#1f2231' })

	hl(0, 'CmpItemKindVariable', { fg = '#3e68d7', bg = '#1f2231' })
	hl(0, 'CmpItemKindFile', { fg = '#3e68d7', bg = '#1f2231' })

	hl(0, 'CmpItemKindUnit', { fg = '#c8d3f5', bg = '#1f2231' })
	hl(0, 'CmpItemKindSnippet', { fg = '#589ed7', bg = '#1f2231' })
	hl(0, 'CmpItemKindFolder', { fg = '#7ca1f2', bg = '#1f2231' })

	hl(0, 'CmpItemKindMethod', { fg = '#65bcff', bg = '#1f2231' })
	hl(0, 'CmpItemKindValue', { fg = '#65bcff', bg = '#1f2231' })
	hl(0, 'CmpItemKindEnumMember', { fg = '#65bcff', bg = '#1f2231' })

	hl(0, 'CmpItemKindInterface', { fg = '#4fd6be', bg = '#1f2231' })
	hl(0, 'CmpItemKindColor', { fg = '#4fd6be', bg = '#1f2231' })
	hl(0, 'CmpItemKindTypeParameter', { fg = '#4fd6be', bg = '#1f2231' })
	-- }}}

	-- Diagnostics LSP{{{
	hl(0, 'DiagnosticSignError', { bg = 'none', fg = '#ff757f' })
	hl(0, 'DiagnosticSignWarn', { bg = 'none', fg = '#ffc777' })
	hl(0, 'DiagnosticSignHint', { bg = 'none', fg = '#c099ff' })
	hl(0, 'DiagnosticSignInfo', { bg = 'none', fg = '#0db9d7' })

	hl(0, 'DiagnosticLineNrError', { bg = 'none', fg = '#ff757f' })
	hl(0, 'DiagnosticLineNrWarn', { bg = 'none', fg = '#ffc777' })
	hl(0, 'DiagnosticLineNrHint', { bg = 'none', fg = '#c099ff' })
	hl(0, 'DiagnosticLineNrInfo', { bg = 'none', fg = '#0db9d7' })

	hl(0, 'DiagnosticVirtualTextError', { bg = 'none', fg = '#ff757f' })
	hl(0, 'DiagnosticVirtualTextWarn', { bg = 'none', fg = '#ffc777' })
	hl(0, 'DiagnosticVirtualTextHint', { bg = 'none', fg = '#c099ff' })
	hl(0, 'DiagnosticVirtualTextInfo', { bg = 'none', fg = '#0db9d7' })
	-- }}}

	-- FuGit2{{{
	hl(0, 'Fugit2Header', { fg = '#bb9af7' })
	hl(0, 'Fugit2ObjectId', { fg = '#3e68d7' })
	hl(0, 'Fugit2Author', { fg = '#007197' })
	hl(0, 'Fugit2Modifier', { fg = '#9854f1' })
	hl(0, 'Fugit2Ignored', { fg = '#545c7e' })
	hl(0, 'Fugit2Unstaged', { fg = '#ff757f' })
	hl(0, 'Fugit2Staged', { fg = '#4fd6be' })
	hl(0, 'Fugit2Modified', { fg = '#2e7de9' })
	hl(0, 'Fugit2Unchanged', { fg = '#51a2db' })
	hl(0, 'Fugit2Untracked', { fg = '#ffc777' })
	hl(0, 'Fugit2SymbolicRef', { fg = '#ffc777' })
	hl(0, 'Fugit2BranchHead', { fg = '#ff966c' })
	hl(0, 'Fugit2FloatTitle', { fg = '#0db9d7' })
	hl(0, 'Fugit2MenuHead', { fg = '#0db9d7' })
	hl(0, 'Fugit2MenuKey', { fg = '#0db9d7' })
	-- }}}

	-- GitSigns{{{
	hl(0, 'GitSignsAdd', { fg = '#4fd6be' })
	hl(0, 'GitSignsChange', { fg = '#ffc777' })
	hl(0, 'GitSignsDelete', { fg = '#ff757f' })
	hl(0, 'GitSignsChangedelete', { fg = '#b55a67' })
	hl(0, 'GitSignsTopdelete', { fg = '#c53b53' })
	hl(0, 'GitSignsUntracked', { fg = '#627259' })
	-- Line Numbers
	hl(0, 'GitSignsAddNr', { fg = '#4fd6be' })
	hl(0, 'GitSignsChangeNr', { fg = '#ffc777' })
	hl(0, 'GitSignsDeleteNr', { fg = '#ff757f' })
	hl(0, 'GitSignsChangedeleteNr', { fg = '#b55a67' })
	hl(0, 'GitSignsTopdeleteNr', { fg = '#c53b53' })
	hl(0, 'GitSignsUntrackedNr', { fg = '#627259' })
	-- }}}

	-- HlsLens{{{
	hl(0, 'HlSearchNear', { bg = '#2f334d', fg = '#ff007c', bold = true, underline = true })
	hl(0, 'HlSearchLens', { bg = '#2f334d', fg = '#c099ff', bold = true, italic = false })
	hl(0, 'HlearchFloat', { bg = '#2f334d', fg = '#ff007c', bold = true, underline = true })
	hl(0, 'HlSearchLensNear', { bg = '#2f334d', fg = '#ff007c', bold = true, underline = true })
	-- }}}

	-- Indent Scope{{{
	hl(0, 'MiniIndentscopeSymbol', { bg = 'none', fg = '#007197' })
	hl(0, 'MiniIndentscopeSymbolOff', { bg = 'none', fg = '#007197' })
	-- }}}

	-- LSP Glance {{{
	hl(0, 'GlancePreviewNormal', { bg = '#1e2030', fg = '#007197' })
	hl(0, 'GlancePreviewMatch', { bg = '#16161e', fg = '#007197', bold = true })
	hl(0, 'GlancePreviewCursorLine', { bg = '#24283b', fg = 'none', bold = true })
	hl(0, 'GlancePreviewEndOfBuffer', { bg = '#1f2231', fg = 'none' })
	hl(0, 'GlanceBorderTop', { bg = '#24283b', fg = '#007197' })
	hl(0, 'GlancePreviewBorderBottom', { bg = '#24283b', fg = '#007197' })
	hl(0, 'GlanceWinBarFilename', { bg = '#1e2030', fg = '#007197' })
	hl(0, 'GlanceWinBarFilepath', { bg = '#1e2030', fg = '#c47981' })
	hl(0, 'GlanceWinBarTitle', { bg = '#1e2030', fg = '#007197', bold = true })
	hl(0, 'GlanceListNormal', { bg = '#24283b', fg = '#ffc777' })
	hl(0, 'GlanceListFilename', { bg = '#24283b', fg = '#ffc777' })
	hl(0, 'GlanceListFilepath', { bg = '#24283b', fg = '#ffc777' })
	hl(0, 'GlanceListMatch', { bg = '#16161e', fg = '#007197', bold = true, underline = true })
	hl(0, 'GlanceListCursorLine', { bg = '#1e2030', fg = 'none', bold = true })
	hl(0, 'GlanceListEndOfBuffer', { bg = '#24283b', fg = 'none' })
	hl(0, 'GlanceListBorderBottom', { bg = '#24283b', fg = '#007197' })
	hl(0, 'GlanceFoldIcon', { bg = '#1f2231', fg = 'none' })
	hl(0, 'GlanceIndent', { bg = '#1f2231', fg = 'none' })
	-- }}}

	-- LSP Illuminate{{{
	hl(0, 'IlluminatedWordText', { bg = '#292e42', bold = true, italic = true })
	hl(0, 'IlluminatedWordRead', { bg = '#292e42', bold = true, italic = true })
	hl(0, 'IlluminatedWordWrite', { bg = '#292e42', bold = true, italic = true })
	-- }}}

	-- LSP Symbol Usage{{{
	hl(0, 'SymbolUsageContent', { bg = 'none', fg = '#ffc777', bold = true, underline = true })
	hl(0, 'SymbolUsageRef', { bg = 'none', fg = '#f52a65' })
	hl(0, 'SymbolUsageDef', { bg = 'none', fg = '#2e7de9' })
	hl(0, 'SymbolUsageImpl', { bg = 'none', fg = '#9854f1' })
	-- }}}

	-- Matchup{{{
	hl(0, 'MatchParen', { bg = 'none', fg = '#ff966c', bold = true })
	hl(0, 'MatchParenCur', { bg = 'none', fg = '#ff966c', bold = true })
	hl(0, 'MatchWord', { bg = 'none', fg = '#c53b53', bold = true, underline = true })
	hl(0, 'MatchWordCur', { bg = 'none', fg = '#c53b53', bold = true, underline = true })
	hl(0, 'MatchBackground', { bg = '#0db9d7', fg = '#c53b53', bold = true, underline = true })
	hl(0, 'OffscreenPopup', { bg = 'none', fg = '#c8d3f5', bold = true })
	-- }}}

	-- Neo Tree{{{
	hl(0, 'NeoTreeCursorLine', { bg = '#16161e', bold = true })
	hl(0, 'NeoTreeDirectoryIcon', { fg = '#ffc777', bold = true })
	hl(0, 'NeoTreeDirectoryName', { fg = '#007197', bold = true })
	-- }}}

	-- SnipRun{{{
	hl(0, 'SniprunVirtualTextOk', { bg = 'none', fg = '#bb9af7', bold = true, underline = true })
	hl(0, 'SniprunFloatingWinOk', { bg = 'none', fg = '#bb9af7', bold = true, underline = true })
	hl(0, 'SniprunVirtualTextErr', { bg = 'none', fg = '#ff757f', bold = true, underline = true })
	hl(0, 'SniprunFloatingWinErr', { bg = 'none', fg = '#ff757f', bold = true, underline = true })
	-- }}}

	-- ScrollView{{{
	hl(0, 'ScrollView', { bg = '#24283b', blend = 80 })
	hl(0, 'ScrollViewCursor', { fg = '#c53b53' })
	hl(0, 'ScrollViewDiagnosticsError', { fg = '#ff757f' })
	hl(0, 'ScrollViewDiagnosticsWarn', { fg = '#ffc777' })
	hl(0, 'ScrollViewDiagnosticsHint', { fg = '#0db9d7' })
	hl(0, 'ScrollViewDiagnosticsInfo', { fg = '#c099ff' })
	hl(0, 'ScrollViewFolds', { fg = '#3e68d7' })
	hl(0, 'ScrollViewSearch', { fg = '#545c7e' })
	hl(0, 'ScrollViewHover', { bg = '#545c7e', fg = '#c53b53' })
	-- }}}

	-- Telescope{{{
	hl(0, 'TelescopeResultsDiffChange', { bg = 'none', fg = '#ffc777' })
	hl(0, 'TelescopeResultsDiffDelete', { bg = 'none', fg = '#c53b53' })
	hl(0, 'TelescopeResultsDiffAdd', { bg = 'none', fg = '#4fd6be' })
	hl(0, 'TelescopeResultsDiffUntracked', { bg = 'none', fg = '#3e68d7' })
	-- }}}

	-- Todo Comments{{{
	hl(0, 'TodoBgFIX', { bg = '#1f2231', fg = '#c53b53', bold = true })
	hl(0, 'TodoBgHACK', { bg = '#1f2231', fg = '#ff966c', bold = true })
	hl(0, 'TodoBgNOTE', { bg = '#1f2231', fg = '#4fd6be', bold = true })
	hl(0, 'TodoBgTODO', { bg = '#1f2231', fg = '#0db9d7', bold = true })
	hl(0, 'TodoBgWARN', { bg = '#1f2231', fg = '#ffc777', bold = true })
	hl(0, 'TodoBgPERF', { bg = '#1f2231', fg = '#c099ff', bold = true })
	hl(0, 'TodoBgTEST', { bg = '#1f2231', fg = '#3e68d7', bold = true })
	-- Todo Comments FG
	hl(0, 'TodoFgFIX', { bg = 'none', fg = '#c53b53', bold = true })
	hl(0, 'TodoFgHACK', { bg = 'none', fg = '#ff966c', bold = true })
	hl(0, 'TodoFgNOTE', { bg = 'none', fg = '#4fd6be', bold = true })
	hl(0, 'TodoFgTODO', { bg = 'none', fg = '#0db9d7', bold = true })
	hl(0, 'TodoFgWARN', { bg = 'none', fg = '#ffc777', bold = true })
	hl(0, 'TodoFgPERF', { bg = 'none', fg = '#c099ff', bold = true })
	hl(0, 'TodoFgTEST', { bg = 'none', fg = '#3e68d7', bold = true })
	-- }}}

	-- TS Rainbow Delimiters{{{
	hl(0, 'RainbowDelimiterRed', { fg = '#f52a65' })
	hl(0, 'RainbowDelimiterYellow', { fg = '#8c6c3e' })
	hl(0, 'RainbowDelimiterBlue', { fg = '#2e7de9' })
	hl(0, 'RainbowDelimiterOrange', { fg = '#b15c00' })
	hl(0, 'RainbowDelimiterGreen', { fg = '#587539' })
	hl(0, 'RainbowDelimiterViolet', { fg = '#9854f1' })
	hl(0, 'RainbowDelimiterCyan', { fg = '#007197' })
	-- }}}

	-- Treesitter Context{{{
	hl(0, 'TreesitterContext', { bg = '#16161e', fg = '#007197' })
	hl(0, 'TreesitterContextLineNumber', { bg = '#16161e', fg = '#007197' })
	hl(0, 'TreesitterContextBottom', { bg = '#16161e', fg = '#b15c00' })
	-- }}}

	-- Visual Multi{{{
	hl(0, 'VM_Extend', { bg = '#c53b53', fg = '#eae8ff', bold = true })
	hl(0, 'VM_Cursor', { bg = '#3e68d7', fg = '#ffc777', bold = true })
	hl(0, 'VM_Insert', { bg = '#c099ff', fg = '#1f2231', bold = true })
	hl(0, 'VM_Matches', { bg = '#c53b53', fg = '#eae8ff', bold = true })
	hl(0, 'VM_Mono', { bg = '#c53b53', fg = '#eae8ff', bold = true })
	-- }}}
	-- }}}
end

return {
	{ -- Catppuccin{{{
		'catppuccin/nvim',
		name = 'catppuccin',
		priority = 1000,
		config = function()
			require('catppuccin').setup {
				flavour = 'mocha', -- latte, frappe, macchiato, mocha
				integrations = {
					cmp = true,
					diffview = true,
					dap = true,
					dap_ui = true,
					fidget = true,
					gitsigns = true,
					illuminate = true,
					markdown = true,
					mason = true,
					neotree = true,
					telescope = true,
					treesitter = true,
					treesitter_context = true,
					lsp_trouble = true,
					ts_rainbow = true,
					ts_rainbow2 = true,
					rainbow_delimiters = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { 'italic' },
							hints = { 'italic' },
							warnings = { 'italic' },
							information = { 'italic' },
							ok = { 'italic' },
						},
						underlines = {
							errors = { 'underline' },
							hints = { 'underline' },
							warnings = { 'underline' },
							information = { 'underline' },
							ok = { 'underline' },
						},
						inlay_hints = {
							background = true,
						},
					},
					mini = {
						enabled = true,
						indentscope_color = '',
					},
				},
			}

			vim.cmd 'colorscheme catppuccin'

			ColorConfig()
		end,
	},
	-- }}}

	{ -- Ever Forest{{{
		'sainnhe/everforest',
		name = 'everforest',
		config = function()
			vim.g.everforest_spell_foreground = 'colored'
			vim.g.everforest_show_eob = 0
			vim.g.everforest_diagnostic_virtual_text = 'colored'
			vim.g.everforest_better_performance = 1
			vim.g.everforest_background = 'hard' -- hard|medium|soft

			-- vim.cmd('colorscheme everforest')

			ColorConfig()
		end,
	},
	-- }}}

	{ -- Gruvbox Material{{{
		'sainnhe/gruvbox-material',
		name = 'gruvbox',
		config = function()
			vim.g.gruvbox_material_spell_foreground = 'colored'
			vim.g.gruvbox_material_ui_contrast = 'high'
			vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
			vim.g.gruvbox_material_better_performance = 1
			vim.g.gruvbox_material_background = 'hard' -- hard|mid|soft

			-- vim.cmd 'colorscheme gruvbox-material'

			ColorConfig()
		end,
	},
	-- }}}

	{ -- Kanagawa{{{
		'rebelot/kanagawa.nvim',
		name = 'kanagawa',
		config = function()
			require('kanagawa').setup {
				undercurl = false,
				commentStyle = { bold = false },
				keywordStyle = { bold = true },
				statementStyle = { bold = true },
				transparent = true,
				dimInactive = false,
				terminalColors = true,
				colors = {},
				theme = 'wave',
				background = {
					dark = 'wave',
					-- dark = 'dragon',
					-- light = 'lotus',
				},
			}

			-- vim.cmd('colorscheme kanagawa')

			ColorConfig()
		end,
	},
	-- }}}

	{ -- Material{{{
		'marko-cerovac/material.nvim',
		name = 'material',
		config = function()
			require('material').setup {
				contrast = {
					sidebars = true,
					floating_windows = true,
					non_current_windows = true,
				},
				plugins = {
					'gitsigns',
					'hop',
					'indent-blankline',
					'lspsaga',
					'mini',
					'neogit',
					'nvim-cmp',
					'nvim-web-devicons',
					'telescope',
					'trouble',
				},
				disable = {
					colored_cursor = true,
					borders = true,
				},

				high_visibility = {
					darker = true,
				},
				lualine_style = 'stealth',

				custom_colors = function(colors) colors.editor.bg = '#090b10' end,
			}

			-- vim.cmd('colorscheme material')

			ColorConfig()
		end,
	},
	-- }}}

	{ -- Night Fox{{{
		'EdenEast/nightfox.nvim',
		name = 'nightfox',
		config = function()
			require('nightfox').setup {
				options = {
					transparent = false,
					dim_inactive = false,
					modules = {
						cmp = true,
						diagnostic = true,
						fidget = true,
						gitsigns = true,
						hop = false,
						illuminate = true,
						lsp_trouble = true,
						neogit = true,
						neotree = true,
						telescope = true,
					},
				},
				palettes = {
					duskfox = {
						bg1 = '#1a182c',
					},
				},
			}

			-- vim.cmd('colorscheme nightfox')

			ColorConfig()
		end,
	},
	-- }}}

	{ -- Rosé Pine{{{
		'rose-pine/neovim',
		name = 'rose-pine',
		config = function()
			require('rose-pine').setup {
				disable_background = true,
			}

			-- vim.cmd('colorscheme rose-pine')

			ColorConfig()
		end,
	},
	-- }}}

	{ -- Tokyo Night{{{
		'folke/tokyonight.nvim',
		name = 'tokyonight',
		config = function()
			require('tokyonight').setup {
				style = 'night', -- night|moon|storm|day
				priority = 1000,
				terminal_colors = true,
				transparent = false,
				dim_inactive = false,
				hide_inactive_statusline = true,
				sidebars = { 'qf', 'help', 'vista_kind', 'neo-tree' },
				styles = {
					sidebars = 'dark', -- dark|transparent|normal
					floats = 'dark',
				},
			}

			vim.cmd 'colorscheme tokyonight'

			ColorConfig()
		end,
	},
	-- }}}
}
