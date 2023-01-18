-- https://github.com/rose-pine/neovim

local rosepine_ok, rosepine = pcall(require, 'rose-pine')
if not rosepine_ok then
    return
end

rosepine.setup {
    dark_variant = 'moon', -- main|moon|dawn
    bold_vert_split = false,
    dim_nc_background = false,
    disable_background = false,
    disable_float_background = true,
    disable_italics = false,
    groups = {
        background = 'base',
        panel = 'surface',
        border = 'highlight_med',
        comment = 'muted',
        link = 'iris',
        punctuation = 'subtle',

        error = 'love',
        hint = 'iris',
        info = 'foam',
        warn = 'gold',

        headings = {
            h1 = 'iris',
            h2 = 'foam',
            h3 = 'rose',
            h4 = 'gold',
            h5 = 'pine',
            h6 = 'foam',
        },
        -- headings = 'subtle' -- all headings at once
    },
    highlight_groups = {
        ColorColumn = { bg = 'highlight_low' },
    },
}

vim.cmd 'colorscheme rose-pine'
