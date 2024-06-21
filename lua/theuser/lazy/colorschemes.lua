function ColorConfig(color)
	color = color or 'duskfox'
	vim.cmd.colorscheme(color)

	-- Highlights{{{

	local colors = require 'theuser.util.color'

	-- Neovim Core{{{
	local hl = vim.api.nvim_set_hl
	hl(0, 'ColorColumn', { bg = colors.bg_alt })
	hl(0, 'CursorLine', { bg = colors.bg_alt, bold = true })
	hl(0, 'CursorLineNr', { fg = colors.orange, bold = true })
	hl(0, 'Folded', { fg = colors.cyan_alt })
	hl(0, 'FoldColumn', { fg = colors.cyan_alt })
	hl(0, 'FoldLevel', { fg = colors.cyan_alt })
	hl(0, 'FoldText', { fg = colors.cyan_alt })
	hl(0, 'Highlight', { bg = colors.black_alt, fg = colors.red, bold = true, underline = true })
	hl(0, 'IncSearch', { bg = colors.red, fg = colors.bg_alt, bold = true, underline = true })
	hl(0, 'ModeMsg', { fg = colors.white_alt })
	hl(0, 'MsgArea', { fg = colors.green })
	hl(0, 'Normal', { bg = colors.bg, fg = colors.orange })
	hl(0, 'NormalFloat', { bg = colors.bg, fg = colors.orange })
	hl(0, 'Search', { fg = colors.red, bold = true, underline = true })
	hl(0, 'SignColumn', { bg = colors.NONE })
	hl(0, 'Visual', { bg = colors.bg_alt, fg = colors.grey_alt, bold = true })
	hl(0, 'WinSeparator', { bg = colors.NONE, fg = colors.grey })
	-- }}}

	-- Completion{{{
	hl(0, 'CmpItemAbbrDeprecated', { fg = colors.grey, strikethrough = true })
	hl(0, 'CmpItemAbbrMatch', { fg = colors.red, bold = true })
	hl(0, 'CmpItemAbbrMatchFuzzy', { fg = colors.pink })
	hl(0, 'CmpItemMenu', { fg = colors.blue_alt, bold = true })

	hl(0, 'CmpItemKindTabnine', { fg = colors.purple, bg = colors.bg_alt })

	hl(0, 'CmpItemKindField', { fg = colors.red, bg = colors.bg_alt })
	hl(0, 'CmpItemKindProperty', { fg = colors.red, bg = colors.bg_alt })
	hl(0, 'CmpItemKindEvent', { fg = colors.red, bg = colors.bg_alt })

	hl(0, 'CmpItemKindText', { fg = colors.green, bg = colors.bg_alt })
	hl(0, 'CmpItemKindEnum', { fg = colors.orange, bg = colors.bg_alt })
	hl(0, 'CmpItemKindKeyword', { fg = colors.green, bg = colors.bg_alt })

	hl(0, 'CmpItemKindConstant', { fg = colors.yellow, bg = colors.bg_alt })
	hl(0, 'CmpItemKindConstructor', { fg = colors.yellow, bg = colors.bg_alt })
	hl(0, 'CmpItemKindReference', { fg = colors.yellow, bg = colors.bg_alt })

	hl(0, 'CmpItemKindFunction', { fg = colors.pink, bg = colors.bg_alt })
	hl(0, 'CmpItemKindStruct', { fg = colors.pink, bg = colors.bg_alt })
	hl(0, 'CmpItemKindClass', { fg = colors.pink, bg = colors.bg_alt })
	hl(0, 'CmpItemKindModule', { fg = colors.pink, bg = colors.bg_alt })
	hl(0, 'CmpItemKindOperator', { fg = colors.pink, bg = colors.bg_alt })

	hl(0, 'CmpItemKindVariable', { fg = colors.blue_alt, bg = colors.bg_alt })
	hl(0, 'CmpItemKindFile', { fg = colors.blue_alt, bg = colors.bg_alt })

	hl(0, 'CmpItemKindUnit', { fg = colors.white, bg = colors.bg_alt })
	hl(0, 'CmpItemKindSnippet', { fg = colors.blue, bg = colors.bg_alt })
	hl(0, 'CmpItemKindFolder', { fg = colors.blue, bg = colors.bg_alt })

	hl(0, 'CmpItemKindMethod', { fg = colors.teal, bg = colors.bg_alt })
	hl(0, 'CmpItemKindValue', { fg = colors.teal, bg = colors.bg_alt })
	hl(0, 'CmpItemKindEnumMember', { fg = colors.teal, bg = colors.bg_alt })

	hl(0, 'CmpItemKindInterface', { fg = colors.teal_alt, bg = colors.bg_alt })
	hl(0, 'CmpItemKindColor', { fg = colors.teal_alt, bg = colors.bg_alt })
	hl(0, 'CmpItemKindTypeParameter', { fg = colors.teal_alt, bg = colors.bg_alt })
	-- }}}

	-- Diagnostics LSP{{{
	hl(0, 'DiagnosticSignError', { fg = colors.red })
	hl(0, 'DiagnosticSignWarn', { fg = colors.yellow })
	hl(0, 'DiagnosticSignHint', { fg = colors.purple })
	hl(0, 'DiagnosticSignInfo', { fg = colors.cyan })

	hl(0, 'DiagnosticLineNrError', { fg = colors.red })
	hl(0, 'DiagnosticLineNrWarn', { fg = colors.yellow })
	hl(0, 'DiagnosticLineNrHint', { fg = colors.purple })
	hl(0, 'DiagnosticLineNrInfo', { fg = colors.cyan })

	hl(0, 'DiagnosticVirtualTextError', { fg = colors.red })
	hl(0, 'DiagnosticVirtualTextWarn', { fg = colors.yellow })
	hl(0, 'DiagnosticVirtualTextHint', { fg = colors.purple })
	hl(0, 'DiagnosticVirtualTextInfo', { fg = colors.cyan })
	-- }}}

	-- FuGit2{{{
	hl(0, 'Fugit2Header', { fg = colors.purple })
	hl(0, 'Fugit2ObjectId', { fg = colors.blue_alt })
	hl(0, 'Fugit2Author', { fg = colors.cyan_alt })
	hl(0, 'Fugit2Modifier', { fg = colors.purple_alt })
	hl(0, 'Fugit2Ignored', { fg = colors.grey_alt })
	hl(0, 'Fugit2Unstaged', { fg = colors.red })
	hl(0, 'Fugit2Staged', { fg = colors.green })
	hl(0, 'Fugit2Modified', { fg = colors.blue_alt })
	hl(0, 'Fugit2Unchanged', { fg = colors.blue })
	hl(0, 'Fugit2Untracked', { fg = colors.yellow })
	hl(0, 'Fugit2SymbolicRef', { fg = colors.yellow })
	hl(0, 'Fugit2BranchHead', { fg = colors.orange })
	hl(0, 'Fugit2FloatTitle', { fg = colors.cyan })
	hl(0, 'Fugit2MenuHead', { fg = colors.cyan })
	hl(0, 'Fugit2MenuKey', { fg = colors.cyan })
	-- }}}

	-- GitSigns{{{
	hl(0, 'GitSignsAdd', { fg = colors.green })
	hl(0, 'GitSignsChange', { fg = colors.yellow })
	hl(0, 'GitSignsDelete', { fg = colors.red })
	hl(0, 'GitSignsChangedelete', { fg = colors.pink })
	hl(0, 'GitSignsTopdelete', { fg = colors.red_alt })
	hl(0, 'GitSignsUntracked', { fg = colors.green_alt })
	-- Line Numbers
	hl(0, 'GitSignsAddNr', { fg = colors.green })
	hl(0, 'GitSignsChangeNr', { fg = colors.yellow })
	hl(0, 'GitSignsDeleteNr', { fg = colors.red })
	hl(0, 'GitSignsChangedeleteNr', { fg = colors.pink })
	hl(0, 'GitSignsTopdeleteNr', { fg = colors.red_alt })
	hl(0, 'GitSignsUntrackedNr', { fg = colors.green_alt })
	-- }}}

	-- HlsLens{{{
	hl(
		0,
		'HlSearchNear',
		{ bg = colors.black_alt, fg = colors.pink_alt, bold = true, underline = true }
	)
	hl(
		0,
		'HlSearchLens',
		{ bg = colors.black_alt, fg = colors.purple_alt, bold = true, italic = false }
	)
	hl(
		0,
		'HlearchFloat',
		{ bg = colors.black_alt, fg = colors.pink_alt, bold = true, underline = true }
	)
	hl(
		0,
		'HlSearchLensNear',
		{ bg = colors.black_alt, fg = colors.pink_alt, bold = true, underline = true }
	)
	-- }}}

	-- Indent Scope{{{
	hl(0, 'MiniIndentscopeSymbol', { fg = colors.cyan_alt })
	hl(0, 'MiniIndentscopeSymbolOff', { fg = colors.cyan_alt })
	-- }}}

	-- LSP Glance {{{
	hl(0, 'GlancePreviewNormal', { bg = colors.black, fg = colors.cyan_alt })
	hl(0, 'GlancePreviewMatch', { bg = colors.black, fg = colors.cyan_alt, bold = true })
	hl(0, 'GlancePreviewCursorLine', { bg = colors.bg_alt, fg = 'none', bold = true })
	hl(0, 'GlancePreviewSignColumn', { bg = colors.bg_alt, fg = 'none', bold = true })
	hl(0, 'GlancePreviewEndOfBuffer', { bg = colors.black, fg = 'none' })
	hl(0, 'GlancePreviewLineNr', { bg = colors.black, fg = 'none', bold = true })
	hl(0, 'GlanceBorderTop', { bg = colors.black, fg = colors.cyan_alt })
	hl(0, 'GlancePreviewBorderBottom', { bg = colors.black, fg = colors.cyan_alt })
	hl(0, 'GlanceWinBarFilename', { bg = colors.bg, fg = colors.cyan_alt })
	hl(0, 'GlanceWinBarFilepath', { bg = colors.bg, fg = colors.red })
	hl(0, 'GlanceWinBarTitle', { bg = colors.bg_alt, fg = colors.cyan_alt, bold = true })
	hl(0, 'GlanceListNormal', { bg = colors.bg_alt, fg = colors.yellow })
	hl(0, 'GlanceListFilename', { bg = colors.bg_alt, fg = colors.yellow })
	hl(0, 'GlanceListFilepath', { bg = colors.bg_alt, fg = colors.yellow })
	hl(0, 'GlanceListCount', { bg = colors.bg_alt, fg = colors.yellow })
	hl(0, 'GlanceListMatch', { bg = colors.bg_alt, fg = colors.cyan_alt, bold = true, underline = true })
	hl(0, 'GlanceListCursorLine', { bg = colors.black, fg = 'none', bold = true })
	hl(0, 'GlanceListEndOfBuffer', { bg = colors.bg_alt, fg = 'none' })
	hl(0, 'GlanceListBorderBottom', { bg = colors.black, fg = colors.cyan_alt })
	hl(0, 'GlanceFoldIcon', { bg = colors.bg_alt, fg = 'none' })
	hl(0, 'GlanceIndent', { bg = colors.bg_alt, fg = 'none' })
	-- }}}

	-- LSP Illuminate{{{
	hl(
		0,
		'IlluminatedWordText',
		{ bg = colors.bg_alt, fg = colors.pink, bold = true, italic = true }
	)
	hl(
		0,
		'IlluminatedWordRead',
		{ bg = colors.bg_alt, fg = colors.yellow, bold = true, italic = true }
	)
	hl(
		0,
		'IlluminatedWordWrite',
		{ bg = colors.bg_alt, fg = colors.purple, bold = true, italic = true }
	)
	-- }}}

	-- LSP Symbol Usage{{{
	hl(0, 'SymbolUsageContent', { fg = colors.yellow, bold = true, underline = true })
	hl(0, 'SymbolUsageRef', { fg = colors.red_alt })
	hl(0, 'SymbolUsageDef', { fg = colors.blue_alt })
	hl(0, 'SymbolUsageImpl', { fg = colors.purple_alt })
	-- }}}

	-- Matchup{{{
	hl(0, 'MatchParen', { fg = colors.orange, bold = true })
	hl(0, 'MatchParenCur', { fg = colors.orange, bold = true })
	hl(0, 'MatchWord', { fg = colors.red, bold = true, underline = true })
	hl(0, 'MatchWordCur', { fg = colors.red, bold = true, underline = true })
	hl(0, 'MatchBackground', { bg = colors.cyan, fg = colors.red, bold = true, underline = true })
	hl(0, 'OffscreenPopup', { fg = colors.white, bold = true })
	-- }}}

	-- Neo Tree{{{
	hl(0, 'NeoTreeDirectoryIcon', { fg = colors.yellow, bold = true })
	-- hl(0, 'NeoTreeDirectoryName', { fg = colors.cyan, bold = true })
	-- hl(0, 'NeoTreeCursorLine', { bg = colors.black, bold = true })
	-- }}}

	-- SnipRun{{{
	hl(0, 'SniprunVirtualTextOk', { fg = colors.purple, bold = true, underline = true })
	hl(0, 'SniprunFloatingWinOk', { fg = colors.purple, bold = true, underline = true })
	hl(0, 'SniprunVirtualTextErr', { fg = colors.red, bold = true, underline = true })
	hl(0, 'SniprunFloatingWinErr', { fg = colors.red, bold = true, underline = true })
	-- }}}

	-- ScrollView{{{
	hl(0, 'ScrollView', { bg = colors.bg_alt, blend = 80 })
	hl(0, 'ScrollViewCursor', { fg = colors.red_alt })
	hl(0, 'ScrollViewDiagnosticsError', { fg = colors.red })
	hl(0, 'ScrollViewDiagnosticsWarn', { fg = colors.yellow })
	hl(0, 'ScrollViewDiagnosticsHint', { fg = colors.cyan })
	hl(0, 'ScrollViewDiagnosticsInfo', { fg = colors.purple })
	hl(0, 'ScrollViewFolds', { fg = colors.blue_alt })
	hl(0, 'ScrollViewSearch', { fg = colors.grey_alt })
	hl(0, 'ScrollViewHover', { bg = colors.grey_alt, fg = colors.red_alt })
	-- }}}

	-- Telescope{{{
	hl(0, 'TelescopeResultsDiffChange', { fg = colors.yellow })
	hl(0, 'TelescopeResultsDiffDelete', { fg = colors.red })
	hl(0, 'TelescopeResultsDiffAdd', { fg = colors.green })
	hl(0, 'TelescopeResultsDiffUntracked', { fg = colors.blue_alt })
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
	hl(0, 'RainbowDelimiterRed', { fg = colors.pink_alt })
	hl(0, 'RainbowDelimiterYellow', { fg = colors.yellow_alt })
	hl(0, 'RainbowDelimiterBlue', { fg = colors.blue_alt })
	hl(0, 'RainbowDelimiterOrange', { fg = colors.orange_alt })
	hl(0, 'RainbowDelimiterGreen', { fg = colors.green_alt })
	hl(0, 'RainbowDelimiterViolet', { fg = colors.purple_alt })
	hl(0, 'RainbowDelimiterCyan', { fg = colors.cyan_alt })
	-- }}}

	-- Treesitter Context{{{
	hl(0, 'TreesitterContext', { bg = colors.black, fg = colors.red })
	hl(0, 'TreesitterContextLineNumber', { bg = colors.black, fg = colors.orange })
	hl(0, 'TreesitterContextBottom', { bg = colors.black, fg = colors.pink })
	-- }}}

	-- Visual Multi{{{
	hl(0, 'VM_Extend', { bg = colors.red, fg = colors.fg, bold = true })
	hl(0, 'VM_Cursor', { bg = colors.blue_alt, fg = colors.yellow, bold = true })
	hl(0, 'VM_Insert', { bg = colors.purple, fg = colors.bg_alt, bold = true })
	hl(0, 'VM_Matches', { bg = colors.red, fg = colors.fg, bold = true })
	hl(0, 'VM_Mono', { bg = colors.red, fg = colors.fg, bold = true })
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
			}

			ColorConfig()
		end,
	},
	-- }}}

	{ -- Everforest{{{
		'sainnhe/everforest',
		name = 'everforest',
		config = function()
			vim.g.everforest_spell_foreground = 'colored'
			vim.g.everforest_show_eob = 0
			vim.g.everforest_diagnostic_virtual_text = 'colored'
			vim.g.everforest_better_performance = 1
			vim.g.everforest_background = 'hard' -- hard|medium|soft

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

			ColorConfig()
		end,
	},
	-- }}}

	{ -- Kanagawa{{{
		'rebelot/kanagawa.nvim',
		name = 'kanagawa',
		config = function()
			require('kanagawa').setup {
				theme = 'wave',
				terminalColors = true,
				colors = {},
				background = {
					dark = 'wave',
					-- dark = 'dragon',
					-- light = 'lotus',
				},
			}

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
					terminal = true,
					sidebars = true,
					floating_windows = true,
					lsp_virtual_text = true,
					non_current_windows = false,
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

				-- custom_colors = function(colors) colors.editor.bg = '#090b10' end,
			}

			vim.g.material_style = 'deep ocean' -- darkerd, lighter, oceanic, palenight, deep ocean

			ColorConfig()
		end,
	},
	-- }}}

	{ -- Nightfox{{{
		'EdenEast/nightfox.nvim',
		name = 'nightfox',
		config = function()
			require('nightfox').setup {
				options = {
					transparent = false,
					dim_inactive = false,
					module_default = true,
				},
				styles = {
					comments = 'italic',
				},
				palettes = {
					duskfox = {
						bg1 = '#1a182c',
					},
				},
			}

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

			ColorConfig()
		end,
	},
	-- }}}

	{ -- Tokyonight{{{
		'folke/tokyonight.nvim',
		name = 'tokyonight',
		config = function()
			require('tokyonight').setup {
				style = 'night', -- night|moon|storm|day
				priority = 1000,
				terminal_colors = true,
				hide_inactive_statusline = true,
				styles = {
					sidebars = 'dark', -- dark|transparent|normal
					floats = 'dark',
				},
			}

			ColorConfig()
		end,
	},
	-- }}}
}
