-- https://github.com/EdenEast/nightfox.nvim

require('nightfox').setup {
    options = {
        transparent = false,
        styles = {
            comments = 'NONE', -- Value is any valid attr-list value `:help attr-list`
            conditionals = 'bold',
            constants = 'bold',
            functions = 'bold',
            keywords = 'bold',
            numbers = 'bold',
            operators = 'NONE',
            strings = 'bold',
            types = 'bold',
            variables = 'NONE',
        },
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
            notify = true,
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
