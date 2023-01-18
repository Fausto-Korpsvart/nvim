return {
    { 'nvim-lua/plenary.nvim', module = true },

    { -- Visual Multi<[[[
        'mg979/vim-visual-multi',
        branch = 'master',
        event = 'BufRead',
        config = function()
            -- https://github.com/mg979/vim-visual-multi

            local g = vim.g

            g.VM_maps = {}
            g.VM_leader = ','
            g.VM_maps['Motion'] = ',,'
            g.VM_default_mappings = 0
            g.VM_mouse_mappings = 1
            g.VM_maps['Exit'] = 'q'
            g.VM_maps['Find Under'] = '<C-n>'
            g.VM_maps['Find Subword Under'] = '<C-N>'
            g.VM_maps['Add Cursor Down'] = '<C-Down>'
            g.VM_maps['Add Cursor Up'] = '<C-Up>'
            g.VM_maps['Switch Mode'] = '<Tab>'
            g.VM_maps['Undo'] = '<C-u>'
            g.VM_maps['Redo'] = '<C-r>'
            g.VM_maps['Find Next'] = 'n'
            g.VM_maps['Find Prev'] = 'p'
            g.VM_maps['Goto Next'] = ']'
            g.VM_maps['Goto Prev'] = '['
            g.VM_maps['Seek Next'] = '<C-f>'
            g.VM_maps['Seek Prev'] = '<C-b>'
            g.VM_maps['Align'] = 'A'
            g.VM_maps['Numbers'] = 'nu'
            g.VM_maps['Numbers Append'] = 'NU'
            g.VM_maps['Skip Region'] = 'sr'
            g.VM_maps['Remove Region'] = 'rr'
            g.VM_maps['Invert Direction'] = 'o'
            g.VM_maps['Case Setting'] = 'cs'
            g.VM_maps['Find Operator'] = 'm'
            g.VM_maps['Surround'] = 'S'
            g.VM_maps['Replace Pattern'] = 'R'
            g.VM_maps['Duplicate'] = 'D'
            g.VM_maps['Merge Regions'] = 'mr'
            g.VM_maps['Split Regions'] = 'sr'
            g.VM_maps['Remove Last Region'] = 'qr'
            g.VM_maps['Visual Subtract'] = 'vs'
            g.VM_maps['Case Conversion Menu'] = 'CC'
            g.VM_maps['Search Menu'] = 'SM'
            g.VM_maps['Zero Numbers'] = '0n'
            g.VM_maps['Zero Numbers Append'] = '0N'
            g.VM_maps['Shrink'] = '_'
            g.VM_maps['Enlarge'] = '+'
            g.VM_maps['Toggle Block'] = 'tb'
            g.VM_maps['Toggle Single Region'] = '<CR>'
            g.VM_maps['Toggle Multiline'] = 'ML'

            -- Highlights
            g.VM_Mono_hl = 'DiffText'
            g.VM_Extend_hl = 'DiffAdd'
            g.VM_Cursor_hl = 'Visual'
            g.VM_Insert_hl = 'DiffChange'
            g.VM_highlight_matches = 'hi! Search ctermfg=228 cterm=underline'
            g.VM_highlight_matches = 'hi! link Search PmenuSel'
        end,
    }, -- ]]]>

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
