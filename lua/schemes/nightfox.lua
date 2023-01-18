-- https://github.com/EdenEast/nightfox.nvim

local nightfox_ok, nightfox = pcall(require, 'nightfox')
if not nightfox_ok then
    return
end

nightfox.setup {
    options = {
        compile_path = vim.fn.stdpath 'cache' .. '/nightfox',
        compile_file_suffix = '_compiled',
        transparent = true,
        terminal_colors = true,
        dim_inactive = false,
        styles = {
            comments = 'bold', -- Value is any valid attr-list value `:help attr-list`
            conditionals = 'bold',
            constants = 'bold',
            functions = 'bold',
            keywords = 'bold',
            numbers = 'bold',
            operators = 'NONE',
            strings = 'NONE',
            types = 'NONE',
            variables = 'NONE',
        },
        inverse = {
            match_paren = false,
            visual = false,
            search = false,
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
    specs = {},
    groups = {},
}

vim.cmd 'colorscheme duskfox' -- nightfox|dayfox|dawnfox|duskfox|nordfox|terafox
