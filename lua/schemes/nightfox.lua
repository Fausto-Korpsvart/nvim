-- https://github.com/EdenEast/nightfox.nvim

require('nightfox').setup {
    options = {
        transparent = false,
        dim_inactive = true,
        modules = {
            cmp = true,
            dap_ui = true,
            diagnostic = true,
            fidget = true,
            gitsigns = true,
            hop = false,
            illuminate = true,
            lsp_saga = true,
            lsp_trouble = true,
            neogit = true,
            neotree = true,
            telescope = true,
            tsrainbow = true,
        },
    },
    palettes = {
        duskfox = {
            bg1 = '#1a182c',
        },
    },
}

vim.cmd 'colorscheme duskfox' -- nightfox|dayfox|dawnfox|duskfox|nordfox|terafox
