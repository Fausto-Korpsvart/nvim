return {
    -- Tree Sitter

    'nvim-treesitter/nvim-treesitter',
    module = true,
    event = 'BufRead',
    cmd = {
        'TSInstall',
        'TSInstallInfo',
        'TSUpdate',
        'TSBufEnable',
        'TSBufDisable',
        'TSEnable',
        'TSDisable',
        'TSModuleInfo',
    },
    dependencies = {
        'windwp/nvim-ts-autotag',
        'mrjones2014/nvim-ts-rainbow',
        'nvim-treesitter/playground',
        'JoosepAlviste/nvim-ts-context-commentstring',
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
        -- https://github.com/nvim-treesitter/nvim-treesitter

        local ts_configs_ok, ts_configs = pcall(require, 'nvim-treesitter.configs')
        if not ts_configs_ok then
            return
        end

        ts_configs.setup {
            ensure_installed = {
                'html',
                'help',
                'css',
                'scss',
                'javascript',
                'typescript',
                'lua',
                'python',
                'regex',
                'toml',
                'yaml',
                'json',
                'vim',
                'markdown',
                'markdown_inline',
                'latex',
                'bash',
                'comment',
                'todotxt',
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { 'markdown' },
            },
            indent = {
                enable = true,
            },
            context_commentstring = {
                enable = false,
                enable_autocmd = false,
            },
            additional_vim_regex_highlighting = { 'markdown' },
            matchup = {
                enable = true,
            },
            rainbow = {
                enable = true,
                extended_mode = true,
                colors = {
                    '#ff9e64',
                    '#c099ff',
                    '#0db9d7',
                    '#c3e88d',
                    '#ff007c',
                    '#1abc9c',
                    '#3e68d7',
                },
                disable = {},
            },
        }

        -- local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
        -- parser_config.tsx.filetype_to_parsername = { 'javascript', 'typescript.tsx' }
    end,
}
