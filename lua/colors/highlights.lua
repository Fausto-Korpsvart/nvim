-- Neovim Core{{{
local hl = vim.api.nvim_set_hl
-- vim.cmd [[hi! CursorLine gui=bold]]
hl(0, 'ColorColumn', { bg = '#222436' })
hl(0, 'CursorLine', { bg = '#222436', bold = true })
hl(0, 'CursorLineNr', { bg = 'none', fg = '#c8d3f5', bold = true })
hl(0, 'CursorWord', { bg = 'none', fg = '#828bb8', bold = true, underline = true })
hl(0, 'highlight', { bg = '#1b1d2b', fg = '#e26a75', bold = true, underline = true })
hl(0, 'IncSearch', { bg = '#e26a75', fg = '#1e2030', italic = true, bold = true, underline = true })
hl(0, 'ModeMsg', { bg = 'none', fg = '#b55a67' })
hl(0, 'MsgArea', { bg = 'none', fg = '#828bb8' })
hl(0, 'Search', { bg = '#1b1d2b', fg = '#e26a75', italic = true, bold = true, underline = true })
hl(0, 'WinSeparator', { bg = 'none', fg = '#2f334d' })
-- }}}

-- Codi{{{
hl(0, 'CodiVirtualText', { bg = 'none', fg = '#c099ff', bold = true })
-- }}}

-- Completion{{{
hl(0, 'CmpItemAbbrDeprecated', { fg = '#545c7e', strikethrough = true })
hl(0, 'CmpItemAbbrMatch', { fg = '#b55a67', bold = true })
hl(0, 'CmpItemAbbrMatchFuzzy', { fg = '#b55a67', italic = true })
hl(0, 'CmpItemMenu', { fg = '#3e68d7', italic = true })

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

-- Folding{{{
hl(0, 'Folded', { bg = 'none', fg = '#399a96' })
hl(0, 'FoldText', { bg = 'none', fg = '#399a96' })
hl(0, 'FoldLevel', { bg = 'none', fg = '#399a96' })
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
hl(0, 'HlSearchNear', { bg = 'none', fg = 'none', bold = true, underline = true })
hl(0, 'HlSearchLens', { bg = 'none', fg = '#c099ff', bold = true, underline = true })
hl(0, 'HlearchFloat', { bg = 'none', fg = '#0db9d7', bold = true, underline = true })
hl(0, 'HlSearchLensNear', { bg = 'none', fg = '#0db9d7', bold = true, underline = true })
-- }}}

-- LSP Illuminate{{{
hl(0, 'IlluminatedWordText', { bg = '#1e2030', fg = '#db4b4b', bold = true, italic = true })
hl(0, 'IlluminatedWordRead', { bg = '#1e2030', fg = '#db4b4b', bold = true, italic = true })
hl(0, 'IlluminatedWordWrite', { bg = '#1e2030', fg = '#db4b4b', bold = true, italic = true })
-- }}}

-- Matchup{{{
hl(0, 'MatchParen', { bg = '#1e2030', fg = '#ff966c', bold = true })
hl(0, 'MatchParenCur', { bg = '#1e2030', fg = '#ff966c', bold = true })
hl(0, 'MatchWord', { bg = '#1e2030', fg = '#c53b53', bold = true, italic = true, underline = true })
hl(
	0,
	'MatchWordCur',
	{ bg = '#1e2030', fg = '#c53b53', bold = true, italic = true, underline = true }
)
hl(
	0,
	'MatchBackground',
	{ bg = '#0db9d7', fg = '#c53b53', bold = true, italic = true, underline = true }
)
hl(0, 'OffscreenPopup', { bg = '#1e2030', fg = '#c8d3f5', bold = true })
-- }}}

-- Neogit{{{
hl(0, 'NeogitNotificationInfo', { fg = '#589ed7' })
hl(0, 'NeogitNotificationWarning', { fg = '#ffc777' })
hl(0, 'NeogitNotificationError', { fg = '#c53b53' })
hl(0, 'NeogitDiffAddHighlight', { bg = 'none', fg = '#0db9d7' })
hl(0, 'NeogitDiffDeleteHighlight', { bg = 'none', fg = '#c53b53' })
hl(0, 'NeogitDiffContextHighlight', { bg = 'none', fg = '#4fd6be' })
hl(0, 'NeogitHunkHeader', { bg = 'none', fg = '#ff966c' })
hl(0, 'NeogitHunkHeaderHighlight', { bg = 'none', fg = '#ff966c' })
-- }}}

-- SnipRun{{{
hl(0, 'SniprunVirtualTextOk', { bg = 'none', fg = '#bb9af7', bold = true, underline = true })
hl(0, 'SniprunFloatingWinOk', { bg = 'none', fg = '#bb9af7', bold = true, underline = true })
hl(0, 'SniprunVirtualTextErr', { bg = 'none', fg = '#ff757f', bold = true, underline = true })
hl(0, 'SniprunFloatingWinErr', { bg = 'none', fg = '#ff757f', bold = true, underline = true })
-- }}}

-- LSP Saga{{{
hl(0, 'SagaLightBulb', { fg = '#ffc777' })
-- }}}

-- ScrollView{{{
hl(0, 'ScrollView', { bg = '#222436' })
hl(0, 'ScrollViewCursor', { fg = '#c53b53' })
hl(0, 'ScrollViewDiagnosticsError', { fg = '#ff757f' })
hl(0, 'ScrollViewDiagnosticsHint', { fg = '#0db9d7' })
hl(0, 'ScrollViewDiagnosticsInfo', { fg = '#c099ff' })
hl(0, 'ScrollViewDiagnosticsWarn', { fg = '#ffc777' })
hl(0, 'ScrollViewFolds', { fg = '#3e68d7' })
hl(0, 'ScrollViewSearch', { fg = '#4fd6be' })
hl(0, 'ScrollViewHover', { bg = '#545c7e', fg = '#c53b53' })
-- }}}

-- Telescope{{{
hl(0, 'TelescopeResultsDiffChange', { bg = 'none', fg = '#ffc777' })
hl(0, 'TelescopeResultsDiffDelete', { bg = 'none', fg = '#c53b53' })
hl(0, 'TelescopeResultsDiffAdd', { bg = 'none', fg = '#4fd6be' })
hl(0, 'TelescopeResultsDiffUntracked', { bg = 'none', fg = '#3e68d7' })
-- }}}

-- Todo Comments{{{
hl(0, 'TodoBgFIX', { bg = '#1e2030', fg = '#c53b53', bold = true })
hl(0, 'TodoBgHACK', { bg = '#1e2030', fg = '#ff966c', bold = true })
hl(0, 'TodoBgNOTE', { bg = '#1e2030', fg = '#4fd6be', bold = true })
hl(0, 'TodoBgTODO', { bg = '#1e2030', fg = '#0db9d7', bold = true })
hl(0, 'TodoBgWARN', { bg = '#1e2030', fg = '#ffc777', bold = true })
hl(0, 'TodoBgPERF', { bg = '#1e2030', fg = '#c099ff', bold = true })
hl(0, 'TodoBgTEST', { bg = '#1e2030', fg = '#3e68d7', bold = true })
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
hl(0, 'TreesitterContext', { bg = '#1e2030', fg = '#589ed7' })
hl(0, 'TreesitterContextLineNumber', { bg = '#1e2030', fg = '#545a86' })
hl(0, 'TreesitterContextBottom', { bg = '#1e2030', fg = '#e26a75' })
-- }}}

-- Visual Multi{{{
hl(0, 'VM_Extend', { bg = '#c53b53', fg = '#eae8ff', bold = true, italic = true })
hl(0, 'VM_Cursor', { bg = '#3e68d7', fg = '#ffc777', bold = true, italic = true })
hl(0, 'VM_Insert', { bg = '#c099ff', fg = '#1e2030', bold = true, italic = true })
hl(0, 'VM_Matches', { bg = '#c53b53', fg = '#eae8ff', bold = true, italic = true })
hl(0, 'VM_Mono', { bg = '#c53b53', fg = '#eae8ff', bold = true, italic = true })
-- }}}
