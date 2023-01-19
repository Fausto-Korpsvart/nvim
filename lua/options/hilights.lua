local hl = vim.api.nvim_set_hl

-- Neovim Core
vim.cmd [[hi! CursorLine gui=bold]]
hl(0, 'MsgArea',      { bg = 'none', bold = true, fg = '#89ddff' })
hl(0, 'ModeMsg',      { bg = 'none', bold = true, fg = '#89ddff' })
hl(0, 'CursorLineNr', { bg = 'none', bold = true, fg = '#ff9e64' })

-- Changes Sign
hl(0, 'ChangesSignTextAdd', { bg = 'none', fg = '#1abc9c', bold = true })
hl(0, 'ChangesSignTextDel', { bg = 'none', fg = '#f7768e', bold = true })
hl(0, 'ChangesSignTextCh',  { bg = 'none', fg = '#bb9af7', bold = true })

-- LSP Diagnostics
hl(0, 'DiagnosticSignError', { bg = 'none', fg = '#f7768e', bold = true, underline = false })
hl(0, 'DiagnosticSignWarn',  { bg = 'none', fg = '#ff9e64', bold = true, underline = false })
hl(0, 'DiagnosticSignHint',  { bg = 'none', fg = '#0db9d7', bold = true, underline = false })
hl(0, 'DiagnosticSignInfo',  { bg = 'none', fg = '#bb9af7', bold = true, underline = false })

-- Folding
hl(0, 'Folded',    { bg = 'none', fg = '#1abc9c', bold = true, underline = false })
hl(0, 'FoldText',  { bg = 'none', fg = '#1abc9c', bold = true, underline = false })
hl(0, 'FoldLevel', { bg = 'none', fg = '#1abc9c', bold = true, underline = false })

-- LSP Illuminate
hl(0, 'IlluminatedWordText',  { bg = '#16161e', fg = 'none', bold = false, underline = false })
hl(0, 'IlluminatedWordRead',  { bg = 'none',    fg = 'none', bold = false, underline = true })
hl(0, 'IlluminatedWordWrite', { bg = 'none',    fg = 'none', bold = false, underline = true })

-- LSP Saga
hl(0, 'SagaShadow',  { bg = '#1e1e2e', blend = 50 })

-- Matchup
hl(0, 'MatchParen',    { bg = 'none', fg = '#0db9d7', bold = true, underline = true })
hl(0, 'MatchWord',     { bg = 'none', fg = '#0db9d7', bold = true, underline = true })
hl(0, 'MatchParenCur', { bg = 'none', fg = 'none',    bold = true, underline = true })
hl(0, 'MatchWordCur',  { bg = 'none', fg = 'none',    bold = true, underline = true })

-- Neogit
hl(0, 'NeogitNotificationInfo',     { fg = '#6183bb' })
hl(0, 'NeogitNotificationWarning',  { fg = '#ffc777' })
hl(0, 'NeogitNotificationError',    { fg = '#db4b4b' })
hl(0, 'NeogitDiffAddHighlight',     { bg = 'none', fg = '#0db9d7' })
hl(0, 'NeogitDiffDeleteHighlight',  { bg = 'none', fg = '#db4b4b' })
hl(0, 'NeogitDiffContextHighlight', { bg = 'none', fg = '#1abc9c' })
hl(0, 'NeogitHunkHeader',           { bg = 'none', fg = '#ff9e64' })
hl(0, 'NeogitHunkHeaderHighlight',  { bg = 'none', fg = '#ff9e64' })

-- Neotree
hl(0, 'NeoTreeNormal',      { bg = '#191726', fg = 'none' })
hl(0, 'NeoTreeTitleBar',    { bg = 'none',    fg = '#c099ff' })
hl(0, 'NeoTreeFloatNormal', { bg = '#191726', fg = '#c099ff' })
hl(0, 'NeoTreeFloatBorder', { bg = '#191726', fg = '#191726' })
hl(0, 'NeoTreeFloatTitle',  { bg = '#191726', fg = '#0db9d7' })

-- Telescope
hl(0, 'TelescopeNormal',        { bg = '#191726', fg = '#eae8ff' })
hl(0, 'TelescopePreviewNormal', { bg = '#191726', fg = '#eae8ff' })
hl(0, 'TelescopePromptNormal',  { bg = '#191726', fg = '#eae8ff' })
hl(0, 'TelescopeResultsNormal', { bg = '#191726', fg = '#eae8ff' })
hl(0, 'TelescopeBorder',        { bg = '#191726', fg = '#c099ff' })
hl(0, 'TelescopePromptBorder',  { bg = '#191726', fg = '#191726' })
hl(0, 'TelescopeResultsBorder', { bg = '#191726', fg = '#191726' })
hl(0, 'TelescopePreviewBorder', { bg = '#191726', fg = '#191726' })

-- Todo Comments
hl(0, 'TodoBgFIX',  { bg = '#16161e', fg = '#db4b4b', bold = true })
hl(0, 'TodoBgHACK', { bg = '#16161e', fg = '#ff9e64', bold = true })
hl(0, 'TodoBgNOTE', { bg = '#16161e', fg = '#1abc9c', bold = true })
hl(0, 'TodoBgTODO', { bg = '#16161e', fg = '#0db9d7', bold = true })
hl(0, 'TodoBgWARN', { bg = '#16161e', fg = '#ffc777', bold = true })
hl(0, 'TodoBgPERF', { bg = '#16161e', fg = '#bb9af7', bold = true })
hl(0, 'TodoBgTEST', { bg = '#16161e', fg = '#3e68d7', bold = true })
-- Todo Comments
hl(0, 'TodoFgFIX',  { bg = 'none', fg = '#db4b4b', bold = true })
hl(0, 'TodoFgHACK', { bg = 'none', fg = '#ff9e64', bold = true })
hl(0, 'TodoFgNOTE', { bg = 'none', fg = '#1abc9c', bold = true })
hl(0, 'TodoFgTODO', { bg = 'none', fg = '#0db9d7', bold = true })
hl(0, 'TodoFgWARN', { bg = 'none', fg = '#ffc777', bold = true })
hl(0, 'TodoFgPERF', { bg = 'none', fg = '#bb9af7', bold = true })
hl(0, 'TodoFgTEST', { bg = 'none', fg = '#3e68d7', bold = true })

-- Treesitter Rainbow
hl(0, 'rainbowcol1', { fg = '#ff9e64' })
hl(0, 'rainbowcol2', { fg = '#c099ff' })
hl(0, 'rainbowcol3', { fg = '#0db9d7' })
hl(0, 'rainbowcol4', { fg = '#c3e88d' })
hl(0, 'rainbowcol5', { fg = '#ff007c' })
hl(0, 'rainbowcol6', { fg = '#1abc9c' })
hl(0, 'rainbowcol7', { fg = '#3e68d7' })

-- ScrollView
hl(0, 'ScrollView', { bg = '#2d2a45', fg = 'none' })

-- LSP VirtText
hl(0, 'DiagnosticVirtualTextError', { bg = 'none', fg = '#f7768e', bold = true, underline = false })
hl(0, 'DiagnosticVirtualTextWarn',  { bg = 'none', fg = '#ff9e64', bold = true, underline = false })
hl(0, 'DiagnosticVirtualTextHint',  { bg = 'none', fg = '#0db9d7', bold = true, underline = false })
hl(0, 'DiagnosticVirtualTextInfo',  { bg = 'none', fg = '#bb9af7', bold = true, underline = false })
