-- https://github.com/rebelot/kanagawa.nvim

local kanagawa_ok, kanagawa = pcall(require, 'kanagawa')
if not kanagawa_ok then
    return
end

kanagawa.setup {
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = { bold = true },
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    specialReturn = true,
    specialException = true,
    transparent = false,
    dimInactive = false,
    globalStatus = false,
    colors = {},
    overrides = {},
}

vim.cmd 'colorscheme kanagawa'
