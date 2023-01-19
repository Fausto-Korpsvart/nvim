return {
    { -- https://github.com/nvim-lua/plenary.nvim

        'nvim-lua/plenary.nvim',
        module = true,
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

    -- Colorschemes
    'catppuccin/nvim',
    'sainnhe/everforest',
    'sainnhe/gruvbox-material',
    'rebelot/kanagawa.nvim',
    'marko-cerovac/material.nvim',
    'EdenEast/nightfox.nvim',
    'rose-pine/neovim',
    'folke/tokyonight.nvim',
}
