local hl = vim.api.nvim_set_hl

-- Neovim Core
vim.cmd [[hi! CursorLine gui=bold]]
hl(0, 'MsgArea', { bg = 'none', bold = true, fg = '#89ddff' })
hl(0, 'ModeMsg', { bg = 'none', bold = true, fg = '#89ddff' })
hl(0, 'WinSeparator', { bg = 'none', bold = true, fg = '#506d9b' }) -- #3d59a1 #414868 #506d9b #565f89 #6382bd
hl(0, 'CursorLineNr', { bg = 'none', bold = true, fg = '#ff9e64' })

-- Changes Sign
hl(0, 'ChangesSignTextAdd', { bg = 'none', fg = '#1abc9c', bold = true })
hl(0, 'ChangesSignTextDel', { bg = 'none', fg = '#f7768e', bold = true })
hl(0, 'ChangesSignTextCh', { bg = 'none', fg = '#bb9af7', bold = true })

-- LSP Diagnostics
hl(0, 'DiagnosticSignError', { bg = 'none', fg = '#f7768e', bold = true, underline = false })
hl(0, 'DiagnosticSignWarn', { bg = 'none', fg = '#ff9e64', bold = true, underline = false })
hl(0, 'DiagnosticSignHint', { bg = 'none', fg = '#0db9d7', bold = true, underline = false })
hl(0, 'DiagnosticSignInfo', { bg = 'none', fg = '#bb9af7', bold = true, underline = false })

-- Folding
hl(0, 'Folded', { bg = 'none', fg = '#1abc9c', bold = true, underline = false })
hl(0, 'FoldText', { bg = 'none', fg = '#1abc9c', bold = true, underline = false })
hl(0, 'FoldLevel', { bg = 'none', fg = '#1abc9c', bold = true, underline = false })

-- HlsLens
hl(0, 'Search', { bg = 'none', fg = 'none', bold = true, underline = true })
hl(0, 'IncSearch', { bg = 'none', fg = 'none', bold = true, underline = true })
hl(0, 'highlight', { bg = 'none', fg = '#0db9d7', bold = true, underline = true })
hl(0, 'CursorWord', { bg = 'none', fg = '#c3e88d', bold = true, underline = true })
hl(0, 'HlSearchNear', { bg = 'none', fg = 'none', bold = true, underline = true })
hl(0, 'HlSearchLens', { bg = 'none', fg = '#c099ff', bold = true, underline = true })
hl(0, 'HlSearchFloat', { bg = 'none', fg = '#0db9d7', bold = true, underline = true })
hl(0, 'HlSearchLensNear', { bg = 'none', fg = '#0db9d7', bold = true, underline = true })

-- LSP Saga
hl(0, 'SagaShadow', { bg = '#1e1e2e', blend = 40 })

-- -- Matchup
hl(0, 'MatchParen', { bg = '#16161e', fg = '#ff9e64', bold = true, underline = false })
hl(0, 'MatchParenCur', { bg = '#16161e', fg = '#ff9e64', bold = true, underline = false })
hl(0, 'MatchWord', { bg = '#2a283d', fg = '#db4b4b', bold = true, underline = true })
hl(0, 'MatchWordCur', { bg = '#2a283d', fg = '#db4b4b', bold = true, underline = true })
hl(0, 'MatchBackground', { bg = '#0db9d7', fg = '#db4b4b', bold = true, underline = true })

-- Neogit
hl(0, 'NeogitNotificationInfo', { fg = '#6183bb' })
hl(0, 'NeogitNotificationWarning', { fg = '#ffc777' })
hl(0, 'NeogitNotificationError', { fg = '#db4b4b' })
hl(0, 'NeogitDiffAddHighlight', { bg = 'none', fg = '#0db9d7' })
hl(0, 'NeogitDiffDeleteHighlight', { bg = 'none', fg = '#db4b4b' })
hl(0, 'NeogitDiffContextHighlight', { bg = 'none', fg = '#1abc9c' })
hl(0, 'NeogitHunkHeader', { bg = 'none', fg = '#ff9e64' })
hl(0, 'NeogitHunkHeaderHighlight', { bg = 'none', fg = '#ff9e64' })

-- Todo Comments
hl(0, 'TodoBgFIX', { bg = '#16161e', fg = '#db4b4b', bold = true })
hl(0, 'TodoBgHACK', { bg = '#16161e', fg = '#ff9e64', bold = true })
hl(0, 'TodoBgNOTE', { bg = '#16161e', fg = '#1abc9c', bold = true })
hl(0, 'TodoBgTODO', { bg = '#16161e', fg = '#0db9d7', bold = true })
hl(0, 'TodoBgWARN', { bg = '#16161e', fg = '#ffc777', bold = true })
hl(0, 'TodoBgPERF', { bg = '#16161e', fg = '#bb9af7', bold = true })
hl(0, 'TodoBgTEST', { bg = '#16161e', fg = '#3e68d7', bold = true })
-- Todo Comments
hl(0, 'TodoFgFIX', { bg = 'none', fg = '#db4b4b', bold = true })
hl(0, 'TodoFgHACK', { bg = 'none', fg = '#ff9e64', bold = true })
hl(0, 'TodoFgNOTE', { bg = 'none', fg = '#1abc9c', bold = true })
hl(0, 'TodoFgTODO', { bg = 'none', fg = '#0db9d7', bold = true })
hl(0, 'TodoFgWARN', { bg = 'none', fg = '#ffc777', bold = true })
hl(0, 'TodoFgPERF', { bg = 'none', fg = '#bb9af7', bold = true })
hl(0, 'TodoFgTEST', { bg = 'none', fg = '#3e68d7', bold = true })

-- LSP VirtText
hl(0, 'DiagnosticVirtualTextError', { bg = 'none', fg = '#f7768e', bold = true, underline = false })
hl(0, 'DiagnosticVirtualTextWarn', { bg = 'none', fg = '#ff9e64', bold = true, underline = false })
hl(0, 'DiagnosticVirtualTextHint', { bg = 'none', fg = '#0db9d7', bold = true, underline = false })
hl(0, 'DiagnosticVirtualTextInfo', { bg = 'none', fg = '#bb9af7', bold = true, underline = false })
