-- https://github.com/rose-pine/neovim

local rosepine = require 'rose-pine'

rosepine.setup {
    dark_variant = 'moon', -- main|moon|dawn
    disable_float_background = true,
    highlight_groups = {
        ColorColumn = { bg = 'highlight_low' },
    },
}

vim.cmd 'colorscheme rose-pine'
