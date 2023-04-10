-- https://github.com/rebelot/kanagawa.nvim

require('kanagawa').setup {
    undercurl = false,
    commentStyle = { bold = false },
    functionStyle = {},
    keywordStyle = { bold = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,
    dimInactive = false,
    terminalColors = true,
    colors = {},
    theme = 'wave',
    background = {
        dark = 'dragon',
        -- light = 'lotus',
    },
}

vim.cmd 'colorscheme kanagawa'
