return {
    { -- https://github.com/nvim-lua/plenary.nvim
        'nvim-lua/plenary.nvim',
        module = true,
    },
    -- LSP Utils
    { -- https://github.com/RRethy/vim-illuminate
        'RRethy/vim-illuminate',
        event = 'BufReadPost',
        opts = { delay = 200 },
        config = function()
            require('illuminate').configure {
                filetypes_denylist = {
                    'alpha',
                    'packer',
                    'neo-tree',
                    'Trouble',
                    'dirvish',
                    'toggleterm',
                    'neogitstatus',
                    'DressingSelect',
                    'TelescopePrompt',
                },
            }
        end,
    },
    { -- https://github.com/WhoIsSethDaniel/toggle-lsp-diagnostics.nvim
        'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
        event = 'BufReadPost',
        config = function()
            require('toggle_lsp_diagnostics').init {}
        end,
    },
    -- Standar Utils
    { -- https://github.com/haringsrob/nvim_context_vt
        'haringsrob/nvim_context_vt',
        event = 'BufRead',
        config = function()
            require('nvim_context_vt').setup {
                prefix = '',
                highlight = 'ContextVt',
                min_rows_ft = { 'css' },
                disable_virtual_lines = true,
            }
        end,
    },
    { -- https://github.com/j-hui/fidget.nvim
        'j-hui/fidget.nvim',
        event = 'BufRead',
        config = function()
            require('fidget').setup {
                text = {
                    spinner = 'dots_snake',
                    done = '',
                },
                align = {
                    bottom = false,
                },
                window = {
                    blend = 0,
                },
            }
        end,
    },
    { -- https://github.com/phaazon/mind.nvim/
        'phaazon/mind.nvim',
        branch = 'v2.2',
        event = 'BufRead',
        config = function()
            require('mind').setup {
                persistence = {
                    state_path = '~/.local/share/mind.nvim/mind.json',
                    data_dir = '~/.local/share/mind.nvim/data',
                },
            }
        end,
    },
    { -- https://github.com/vigoux/notifier.nvim
        'vigoux/notifier.nvim',
        config = function()
            require('notifier').setup {
                components = {
                    'nvim',
                    'lsp',
                },
                notify = {
                    clear_time = 9999,
                    min_level = vim.log.levels.INFO,
                },
                component_name_recall = false,
                zindex = 50,
            }
        end,
    },
    { -- https://github.com/epwalsh/obsidian.nvim
        'epwalsh/obsidian.nvim',
        event = 'BufRead',
        config = function()
            require('obsidian').setup {
                dir = '~/@fausto/dev/Obsidian-Vault',
                completion = {
                    nvim_cmp = true,
                },
            }
        end,
    },
    { -- https://github.com/tyru/open-browser.vim
        'tyru/open-browser.vim',
        event = 'BufRead',
        config = function()
            vim.cmd [[
                let g:openbrowser_fix_hosts = {"google.com": "search.brave.com"}
                let g:openbrowser_fix_schemes = {"http": "https"}
                let g:openbrowser_search_engines = {
                    \ 'brave': 'https://search.brave.com/search?q={query}',
                    \ 'fedora': 'https://fedoramagazine.org/search?q={query}',
                    \ 'neovim': 'https://neovim.io/',
                    \ 'github': 'https://github.com/search?q={query}',
                    \ 'python': 'https://docs.python.org/dev/search.html?q={query}&check_keywords=yes&area=default',
                    \ 'twitter-search': 'https://twitter.com/search/{query}',
                    \ 'twitter-user': 'https://twitter.com/{query}',
                    \ 'devdocs': 'https://devdocs.io/#q={query}',
                    \ 'fileformat': 'https://www.fileformat.info/info/unicode/char/{query}/',
                    \}
                let g:openbrowser_default_search = "brave"
            ]]
        end,
    },
    { -- https://github.com/folke/zen-mode.nvim
        'folke/zen-mode.nvim',
        config = function()
            require('zen-mode').setup {}
        end,
    },
    { -- https://github.com/mg979/vim-visual-multi
        'mg979/vim-visual-multi',
        branch = 'master',
        event = 'BufRead',
        config = function()
            vim.cmd [[
                let g:VM_maps                         = {}
                let g:VM_leader                       = ','
                let g:VM_maps['Motion']               = ',,'
                let g:VM_default_mappings             = 0
                let g:VM_mouse_mappings               = 1
                let g:VM_maps['Exit']                 = 'q'
                let g:VM_maps['Find Under']           = '<C-n>'
                let g:VM_maps['Find Subword Under']   = '<C-N>'
                let g:VM_maps['Add Cursor Down']      = '<C-Down>'
                let g:VM_maps['Add Cursor Up']        = '<C-Up>'
                let g:VM_maps['Switch Mode']          = '<Tab>'
                let g:VM_maps['Undo']                 = '<C-u>'
                let g:VM_maps['Redo']                 = '<C-r>'
                let g:VM_maps['Find Next']            = 'n'
                let g:VM_maps['Find Prev']            = 'p'
                let g:VM_maps['Goto Next']            = ']'
                let g:VM_maps['Goto Prev']            = '['
                let g:VM_maps['Seek Next']            = '<C-f>'
                let g:VM_maps['Seek Prev']            = '<C-b>'
                let g:VM_maps["Align"]                = 'A'
                let g:VM_maps["Numbers"]              = 'nu'
                let g:VM_maps["Numbers Append"]       = 'NU'
                let g:VM_maps['Skip Region']          = 'sr'
                let g:VM_maps['Remove Region']        = 'rr'
                let g:VM_maps['Invert Direction']     = 'o'
                let g:VM_maps["Case Setting"]         = 'cs'
                let g:VM_maps['Find Operator']        = 'm'
                let g:VM_maps['Surround']             = 'S'
                let g:VM_maps['Replace Pattern']      = 'R'
                let g:VM_maps["Duplicate"]            = 'D'
                let g:VM_maps["Merge Regions"]        = 'mr'
                let g:VM_maps["Split Regions"]        = 'sr'
                let g:VM_maps["Remove Last Region"]   = 'qr'
                let g:VM_maps["Visual Subtract"]      = 'vs'
                let g:VM_maps["Case Conversion Menu"] = 'CC'
                let g:VM_maps["Search Menu"]          = 'SM'
                let g:VM_maps["Zero Numbers"]         = '0n'
                let g:VM_maps["Zero Numbers Append"]  = '0N'
                let g:VM_maps["Shrink"]               = "_"
                let g:VM_maps["Enlarge"]              = "+"
                let g:VM_maps["Toggle Block"]         = 'tb'
                let g:VM_maps["Toggle Single Region"] = '<CR>'
                let g:VM_maps["Toggle Multiline"]     = 'ML'
                " Highlights
                let g:VM_Mono_hl   = 'DiffText'
                let g:VM_Extend_hl = 'DiffAdd'
                let g:VM_Cursor_hl = 'Visual'
                let g:VM_Insert_hl = 'DiffChange'
                let g:VM_highlight_matches = 'hi! Search ctermfg=228 cterm=underline'
                let g:VM_highlight_matches = 'hi! link Search PmenuSel'
            ]]
        end,
    },
}
