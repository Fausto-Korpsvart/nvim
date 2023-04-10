return {
    -- https://github.com/mrjones2014/legendary.nvim
    'mrjones2014/legendary.nvim',
    event = 'BufRead',
    keys = {
        vim.keymap.set('n', 'mk', '<CMD>Legendary<CR>'),
    },
    config = function()
        require('legendary').setup {
            include_builtin = false,
            include_legendary_cmds = false,
            select_prompt = 'keymaps | Commands',
            col_separator_char = '│',
            most_recent_item_at_top = true,
            cache_path = string.format('%s/legendary/', vim.fn.stdpath 'cache'),
            keymaps = {
                {
                    itemgroup   = 'LSP Saga',
                    description = 'Keymaps for Core LSP & Saga',
                    icon        = '',
                    keymaps = {
                        { 'fs', '<CMD>Lspsaga lsp_finder<CR>',                                                                       description = 'Saga Finder' },
                        { 'gd', '<CMD>Lspsaga goto_definition<CR>',                                                                  description = 'Saga Goto Definitions' },
                        { 'pv', '<CMD>Lspsaga peek_definition<CR>',                                                                  description = 'Saga Peek Definitions' },
                        { 'bd', '<CMD>Lspsaga show_buf_diagnostics<CR>',                                                             description = 'Saga Buffer Diagnostic' },
                        { 'dl', '<CMD>Lspsaga show_line_diagnostics<CR>',                                                            description = 'Saga Line Diagnostic' },
                        { 'pd', '<CMD>Lspsaga diagnostic_jump_prev<CR>',                                                             description = 'Saga Diagnostic Prev' },
                        { 'nd', '<CMD>Lspsaga diagnostic_jump_next<CR>',                                                             description = 'Saga Diagnostic Next' },
                        { 'dh', '<CMD>Lspsaga hover_doc<CR>',                                                                        description = 'Saga Hover Documentation' },
                        { 'ca', '<CMD>Lspsaga code_action<CR>',                                                                      description = 'Saga Code Action' },
                        { 'ot', '<CMD>Lspsaga outline<CR>',                                                                          description = 'Saga Outline' },
                        { 'ci', '<CMD>Lspsaga incoming_calls<CR>',                                                                   description = 'Saga Incoming Calls' },
                        { 'co', '<CMD>Lspsaga outgoing_calls<CR>',                                                                   description = 'Saga Outgoing Calls' },
                        { '<Leader>t', '<CMD>Lspsaga term_toggle<CR>',                                                               description = 'Saga Float Terminal Toggle' },
                        { 'rn', '<CMD>Lspsaga rename<CR>',                                                                           description = 'Saga Rename' },
                        -- LSP Core
                        { 'td', '<CMD>lua vim.lsp.buf.type_definition()<CR>',                                                        description = 'Core LSP Type Definition' },
                        { 'gD', '<CMD>lua vim.lsp.buf.declaration()<CR>',                                                            description = 'Core LSP GoTo Declaration' },
                        { 'gI', '<CMD>lua vim.lsp.buf.implementation()<CR>',                                                         description = 'Core LSP GoTo Implementation' },
                    },
                },
                {
                    itemgroup   = 'LSP Diagnostic',
                    description = 'Keymaps for Toggle LSP Diagnostics',
                    icon        = '',
                    keymaps = {
                        { 'vd', '<Plug>(toggle-lsp-diag)<CR>',                                                                       description = 'Toogle LSP Diagnostics' },
                        { 'tln', '<Plug>(toggle-lsp-diag-on)<CR>',                                                                   description = 'Toogle LSP Diagnostics ON' },
                        { 'tlf', '<Plug>(toggltoggle-lsp-diag-off)<CR>',                                                             description = 'Toogle LSP Diagnostics OFF' },
                        { 'tld', '<Plug>(toggle-lsp-diag-default)<CR>',                                                              description = 'Toogle LSP Diagnostics Default' },
                        { 'tls', '<Plug>(toggle-lsp-diag-signs)<CR>',                                                                description = 'Toogle LSP Diagnostics Signs' },
                        { 'tlv', '<Plug>(toggle-lsp-diag-vtext)<CR>',                                                                description = 'Toogle LSP Diagnostics VirtText' },
                        { 'tlu', '<Plug>(toggle-lsp-diag-update_in_insert)<CR>',                                                     description = 'Toogle LSP Diagnostics Update in Insert' },
                    },
                },
                {
                    itemgroup   = 'Illuminate',
                    description = 'Keymaps for Illuminate Current Word',
                    icon        = '',
                    keymaps = {
                        { 'tgi', '<CMD>lua require("illuminate").toggle()<CR>',                                                      description = 'Illuminate Toggle' },
                        { 'pgi', '<CMD>lua require("illuminate").pause()<CR>',                                                       description = 'Illuminate Pause' },
                        { 'rgi', '<CMD>lua require("illuminate").resume()<CR>',                                                      description = 'Illuminate Resume' },
                        { 'ti', '<CMD>lua require("illuminate").toggle_buf()<CR>',                                                   description = 'Illuminate Buf Toggle' },
                        { 'pi', '<CMD>lua require("illuminate").pause_buf()<CR>',                                                    description = 'Illuminate Buf Pause' },
                        { 'ri', '<CMD>lua require("illuminate").resume_buf()<CR>',                                                   description = 'Illuminate Buf Resume' },
                        { 'tp', '<CMD>lua require("illuminate").toggle_pause()<CR>',                                                 description = 'Illuminate Toggle Pause' },
                        { 'tob', '<CMD>lua require("illuminate").textobj_select()<CR>',                                              description = 'Illuminate Text Object Select' },
                        { 'nr', '<CMD>lua require("illuminate").goto_next_reference(wrap)<CR>',                                      description = 'Illuminate Next Reference' },
                        { 'pr', '<CMD>lua require("illuminate").goto_prev_reference(wrap)<CR>',                                      description = 'Illuminate Prev Reference' },
                    },
                },
                {
                    itemgroup   = 'Utilities',
                    description = 'Keymaps for some Individual Plugins',
                    icon        = '',
                    keymaps = {
                        { '<Leader>lz', '<CMD>Lazy<CR>',                                                                             description = 'Lazy Manageer' },
                        { 'ms', '<CMD>Mason<CR>',                                                                                    description = 'Mason' },
                        { 'nf', '<CMD>Format<CR>',                                                                                   description = 'Format File' },
                        { 'dm', '<CMD>delm!<CR>',                                                                                    description = 'Delete Marks' },
                        { 'gl', '<CMD>Glow<CR>',                                                                                     description = 'Glow MD Preview' },
                        { 'cg', '<CMD>Glow!<CR>',                                                                                    description = 'Close Glow' },
                        { 'nz', '<CMD>ZenMode<CR>',                                                                                  description = 'Toggle Zen Mode' },
                    },
                },
                {
                    itemgroup   = 'Git Plugins',
                    description = 'Keymaps for Git Plugins',
                    icon        = '',
                    keymaps = {
                        { 'ng', '<CMD>Neogit<CR>',                                                                                   description = 'NeoGit' },
                        { 'dv', '<CMD>DiffviewOpen<CR>',                                                                             description = 'DiffView' },
                        { 'tgs', '<CMD>Gitsigns toggle_signs<CR>',                                                                   description = 'GitSigns Toggle' },
                        { 'tcb', '<CMD>Gitsigns toggle_current_line_blame<CR>',                                                      description = 'GitSigns Line Blame' },
                    },
                },
                {
                    itemgroup   = 'TODO Comment',
                    description = 'Keymaps for Block & Line Comments',
                    icon        = '',
                    keymaps = {
                        { 'to', '<CMD>TodoTrouble<CR>',                                                                              description = 'Todo Comments in Trouble' },
                        { 'ttc', '<CMD>TodoTelescope<CR>',                                                                           description = 'Todo Comments in Telescope' },
                    },
                },
                {
                    itemgroup   = 'Trouble',
                    description = 'Keymaps for Trouble Diagnostics Navigation',
                    icon        = '飯',
                    keymaps = {
                        { 'trb', '<CMD>Trouble<CR>',                                                                                 description = 'Trouble' },
                        { 'tr', '<CMD>TroubleToggle<CR>',                                                                            description = 'Trouble' },
                        { 'tw', '<CMD>TroubleToggle workspace_diagnostics<CR>',                                                      description = 'Trouble Workspace Diagnostics' },
                        { 'td', '<CMD>TroubleToggle document_diagnostics<CR>',                                                       description = 'Trouble Document Diagnostics' },
                        { 'trs', '<CMD>TroubleToggle lsp_references<CR>',                                                            description = 'Trouble Lsp References' },
                        { 'trl', '<CMD>TroubleToggle loclist<CR>',                                                                   description = 'Trouble in loclist' },
                        { 'trf', '<CMD>TroubleToggle quickfix<CR>',                                                                  description = 'Trouble in quickfix' },
                    },
                },
                {
                    itemgroup   = 'Spectre',
                    description = 'Keymaps for Spectre',
                    icon        = '',
                    keymaps = {
                        { 'os', '<CMD>lua require("spectre").open()<CR>',                                                            description = 'Spectre' },
                        { 'sp', '<CMD>lua require("spectre").open_file_search()<CR>',                                                description = 'Spectre File Search' },
                        { 'spw', '<CMD>lua require("spectre").open_visual({select_word=true})<CR>',                                  description = 'Spectre Select Word' },
                    },
                },
                {
                    itemgroup   = 'Snip Run',
                    description = 'Keymaps for Sniprun',
                    icon        = '',
                    keymaps = {
                        { 'sr', '<Plug>SnipRun',                                                                                     description = 'Sniprun' },
                        { 'sc', '<Plug>SnipClose',                                                                                   description = 'Sniprun Close' },
                        { 'sro', '<Plug>SnipRunOperator',                                                                            description = 'Sniprun Operator' },
                    },
                },
                {
                    itemgroup   = 'Tree Split Join',
                    description = 'Keymaps for TSS',
                    icon        = '',
                    keymaps = {
                        { 'tsj', '<CMD>TSJJoin<CR>',                                                                                 description = 'TreeSJ Join' },
                        { 'tss', '<CMD>TSJSplit<CR>',                                                                                description = 'TreeSJ Split' },
                        { 'tst', '<CMD>TSJToggle<CR>',                                                                               description = 'TreeSJ Toggle' },
                    },
                },
                {
                    itemgroup   = 'Treesitter',
                    description = 'Keymaps for Treesitter',
                    icon        = '',
                    keymaps = {
                        { 'ts', '<CMD>TSToggle<CR>',                                                                                 description = 'Treesitter Toggle' },
                        { 'tu', '<CMD>TSUpdateSync<CR>',                                                                             description = 'Treesitter UpdateSync' },
                        { 'pg', '<CMD>TSPlaygroundToggle<CR>',                                                                       description = 'Treesitter Playground' },
                    },
                },
                {
                    itemgroup   = 'Hop',
                    description = 'Keymaps for Hop Easy Move',
                    icon        = '',
                    keymaps = {
                        { ';j', '<CMD>HopWord<CR>',                                                                                  description = 'Hop by Word', mode = { silent = true } },
                        { ';1', '<CMD>HopChar1<CR>',                                                                                 description = 'Hop by One Characters', mode = { silent = true } },
                        { ';2', '<CMD>HopChar2<CR>',                                                                                 description = 'Hop by Two Characters', mode = { silent = true } },
                        { ';l', '<CMD>HopWordCurrentLine<CR>',                                                                       description = 'Hop by Hint in current Line' },
                        { ';h', '<CMD>lua require"hop".hint_lines()<CR>',                                                            description = 'Hop by Hint in current Column' },
                    },
                },
                {
                    itemgroup   = 'Emmet',
                    description = 'Keymaps for Emmet',
                    icon        = '',
                    keymaps = {
                        { '/a', { i = '<Plug>(emmet-expand-abbr)' },                                                                 description = 'Emmet Expand Abbreviation' },
                        { '/w', { i = '<Plug>(emmet-expand-word)' },                                                                 description = 'Emmet Expand Word' },
                        { '/n', { i = '<Plug>(emmet-move-next)' },                                                                   description = 'Emmet Move Next' },
                        { '/b', { i = '<Plug>(emmet-move-prev)' },                                                                   description = 'Emmet Move Prev' },
                        { 'eut', '<Plug>(emmet-update-tag)',                                                                         description = 'Emmet Update Tag' },
                        { 'bti', '<Plug>(emmet-balance-tag-inward)',                                                                 description = 'Emmet Balance Tag Inward' },
                        { 'etc', '<Plug>(emmet-toggle-comment)',                                                                     description = 'Emmet Toggle Comment' },
                        { 'ert', '<Plug>(emmet-remove-tag)',                                                                         description = 'Emmet Remove Tags' },
                        { 'eau', '<Plug>(emmet-anchorize-url)',                                                                      description = 'Emmet Anchorize URL' },
                        { 'eas', '<Plug>(emmet-anchorize-summary)',                                                                  description = 'Emmet Anchorize Summary' },
                        { 'eml', '<Plug>(emmet-merge-lines)',                                                                        description = 'Emmet Merge Lines' },
                    },
                },
                {
                    itemgroup   = 'Live Server Preview',
                    description = 'Keymaps for Live Server Preview',
                    icon        = '',
                    keymaps = {
                        { 'ss', '<CMD>LiveServerStart<CR>',                                                                          description = 'Start Live Server' },
                        { 'SS', '<CMD>LiveServerStop<CR>',                                                                           description = 'Stop Live Server' },
                    },
                },
                {
                    itemgroup   = 'Markdown Live Preview',
                    description = 'Keymaps for Markdown Live Preview',
                    icon        = '',
                    keymaps = {
                        { 'mp', '<CMD>MarkdownPreview<CR>',                                                                          description = 'Markdown Live Server' },
                        { 'sm', '<CMD>MarkdownPreviewStop<CR>',                                                                      description = 'Stop Markdown Live Server' },
                        { 'mt', '<CMD>MarkdownPreviewToggle<CR>',                                                                    description = 'Toggle Markdown Live Server' },
                    },
                },
                {
                    itemgroup   = 'Open in Browser',
                    description = 'Keymaps for Open Links in Browser',
                    icon        = '',
                    keymaps = {
                        { 'ob', '<Plug>(openbrowser-open)<CR>',                                                                      description = 'Open Link in Browser' },
                        { 'oi', '<Plug>(openbrowser-open-incognito)<CR>',                                                            description = 'Open Link in Browser incongnito' },
                        { 'fw', '<Plug>(openbrowser-search) <cword><CR>',                                                            description = 'Search Word under cursor' },
                    },
                },
                {
                    itemgroup   = 'Telescope',
                    description = 'Keymaps for Telescope',
                    icon        = '',
                    keymaps = {
                        { 'tl', '<CMD>Telescope<CR>',                                                                                description = 'Telescope Peek Module' },
                        { 'no', '<CMD>Telescope notify<CR>',                                                                         description = 'Telescope Notify' },
                        { 'fb', '<CMD>Telescope file_browser path=%:p:h default_selection_index=2<CR>',                              description = 'Telescope File Browser' },
                        { 'bf', '<CMD>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>',                             description = 'Telescope In-Buffer Finder' },
                        { 'bu', '<CMD>lua require("telescope.builtin").buffers()<CR>',                                               description = 'Telescope Show Buffers' },
                        { 'sf', '<CMD>lua require("telescope.builtin").find_files()<CR>',                                            description = 'Telescope Find Files' },
                        { 'gt', '<CMD>lua require("telescope.builtin").git_status()<CR>',                                            description = 'Telescope Git Status' },
                        { 'gc', '<CMD>lua require("telescope.builtin").git_commits()<CR>',                                           description = 'Telescope Git Commits' },
                        { 'tg', '<CMD>lua require("telescope.builtin").live_grep()<CR>',                                             description = 'Telescope Live Grep' },
                        { 'of', '<CMD>lua require("telescope.builtin").oldfiles()<CR>',                                              description = 'Telescope Recent Files' },
                        { 'gs', '<CMD>lua require("telescope.builtin").grep_string({ search = vim.fn.input "String: " })<CR>',       description = 'Telescope Grep Strings' },
                    },
                },
            },
            commands = {
                {
                    itemgroup   = 'Commands',
                    description = 'Neovim Default Commands',
                    icon        = '',
                    commands = {
                        { ':WriteBuffer', '<CMD>w',                                                                                  description = 'Save changes in current buffer', opts = { } },
                        { ':WriteQuit', '<CMD>wq!',                                                                                  description = 'Write and Quit', opts = {} },
                        { ':WriteAll', '<CMD>wa',                                                                                    description = 'Write all buffers', opts = {} },
                        { ':QuitBuffer', '<CMD>q',                                                                                   description = 'Quit current buffer', opts = {} },
                        { ':QuitNoWrite', '<CMD>q!',                                                                                 description = 'Quit buffer Without Write', opts = { } },
                        { ':DeleteBuffer', '<CMD>Bdelete',                                                                           description = 'Buffer Delete', opts = { } },
                        { ':SourceFile', ':source %',                                                                                description = 'Source Current File' },
                        { ':ListChar', '<CMD>set list! list?',                                                                       description = 'Toogle EOL List Character' },
                        { ':LineNumber', '<CMD>set nu! rnu!',                                                                        description = 'Toogle Line Numbers' },
                        { ':Terminal', '<CMD>ToggleTerm',                                                                            description = 'Run Terminal' },
                        { ':SearchReplace', '<CMD>EasyReplaceWord',                                                                  description = 'Search and Replace' },
                        { ':ReplaceWord', '<CMD>EasyReplaceCword',                                                                   description = 'Search and Replace word under cursor' },
                    },
                },
            },
        }
    end,
}
