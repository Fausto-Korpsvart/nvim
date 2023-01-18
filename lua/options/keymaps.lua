local function keymap(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Neovim Core
keymap('n', 'so', ':source %<CR>') -- SourceFile
keymap('i', 'kj', '<Esc>') -- Map Esc to kj
keymap('n', '.', ':') -- Nvim Command Line
keymap('n', 'q', '<Nop>') -- Stop recording with q
keymap('n', 'Q', '<nop>') -- Stop registring with Q
keymap('n', '<CR>', ':noh<CR><CR>') -- No Highlight
keymap('n', 'H', '^<ESC>') -- Go to beginning of line
keymap('n', 'L', '$<ESC>') -- Go to end of line
keymap('n', 'dw', 'vb"_d') -- Delete a word backwards
-- Managing Buffers
keymap('n', '<C-h>', '<C-w>h') -- Move to Buffer Left
keymap('n', '<C-j>', '<C-w>j') -- Move to Buffer Down
keymap('n', '<C-k>', '<C-w>k') -- Move to Buffer Up
keymap('n', '<C-l>', '<C-w>l') -- Move to Buffer Right
keymap('n', '<leader>d', '<CMD>bp<cr>') -- Buffer Prev
keymap('n', '<leader>f', '<CMD>bn<cr>') -- Buffer Next
keymap('n', 'sv', '<C-w>v') -- Open Buffers Vertically
keymap('n', 'sh', '<C-w>s') -- Open Buffers Horizontally
keymap('n', '<M-y>', '<CMD>vertical resize -2<CR>') -- Resizing Left
keymap('n', '<M-u>', '<CMD>resize +2<CR>') -- Resizing Up
keymap('n', '<M-i>', '<CMD>resize -2<CR>') -- Resizing Down
keymap('n', '<M-o>', '<CMD>vertical resize +2<CR>') -- Resizing Right
-- Basic Moving Code
keymap('v', '>', '>gv') -- Indenting Code Right
keymap('v', '<', '<gv') -- Indenting Code Left
keymap('n', 'K', ':move .-2<CR>==') -- Moving Code Up Normal Mode
keymap('n', 'J', ':move .+1<CR>==') -- Moving Code Down Normal Mode
keymap('x', 'K', ":move '<-2<CR>gv-gv") -- Moving Code Up Visual Mode
keymap('x', 'J', ":move '>+1<cr>gv-gv") -- Moving Code Down Visual Mode
-- Basic Text Editing
keymap('n', '<Leader>w', '<CMD>w<CR>') -- Basic Save file
keymap('n', '<Leader>z', '<CMD>wa<CR>') -- Save all files
keymap('n', '<Leader>q', '<CMD>q<CR>') -- Quit Buffer
keymap('n', '<Leader>x', '<CMD>qa<CR>') -- Quit Buffer
keymap('n', '<Leader>s', '<CMD>Bdelete<CR>') -- Buffer Delete (plugin)
keymap('n', '=', '<C-a>') -- Increment
keymap('n', '-', '<C-x>') -- Decrement
keymap('v', '`', 'u') -- Case change in visual mode
keymap('v', '<A-`>', 'U') -- Case change in visual mode
keymap('v', 'y', 'ygv<ESC>') -- Cursor at the bottom after yank.
keymap('v', 'p', 'pgv<ESC>') -- Cursor at the bottom after paste
keymap('v', 'p', '"_dP') -- Better paste
keymap('n', 'x', '"_x') -- Don't yank with x
keymap('n', '<Leader>fm', 'gqap') -- Format paragraph at 80 character

-- Plugins
keymap('n', '<Leader>lz', '<CMD>Lazy<CR>')
keymap('n', 'ms', '<CMD>Mason<CR>')
keymap('n', 'nf', '<CMD>Format<CR>')
keymap('n', 'sk', '<CMD>Legendary<CR>')
keymap('n', 'ut', '<CMD>UndotreeToggle<CR>')
keymap('n', 'dm', '<CMD>delm!<CR>')
keymap('n', 'gl', '<CMD>Glow<CR>')
keymap('n', 'cg', '<CMD>Glow!<CR>')
keymap('n', 'tr', '<CMD>TroubleToggle<CR>')
keymap('n', 'vd', '<Plug>(toggle-lsp-diag)')
keymap('n', 'vs', '<CMD>ObsidianSearch<CR>')
keymap('n', 'mi', '<CMD>MindOpenMain<CR>')
keymap('n', 'cm', '<CMD>MindClose<CR>')
keymap('n', 'nz', '<CMD>ZenMode<CR>')

-- Git Plugins
keymap('n', 'ng', '<CMD>Neogit<CR>')
keymap('n', 'dv', '<CMD>DiffviewOpen<CR>')
keymap('n', 'gm', '<CMD>GitMessenger<CR>')
keymap('n', 'gs', '<CMD>Gitsigns toggle_signs<CR>')
keymap('n', 'cb', '<CMD>Gitsigns toggle_current_line_blame<CR>')

-- NeoTree
keymap('n', '<Leader>r', '<CMD>NeoTreeFocusToggle<CR>')
keymap('n', '<Leader>e', '<CMD>NeoTreeFloatToggle<CR>')
keymap('n', '<Leader>b', '<CMD>Neotree toggle show buffers<CR>')
keymap('n', '<Leader>g', '<CMD>Neotree git_status<CR>')

-- Comment
keymap('n', '<Leader>;', '<Plug>(comment_toggle_linewise_current)')
keymap('x', '<Leader>;', '<Plug>(comment_toggle_linewise_visual)')
keymap('x', '<Leader>l', '<Plug>(comment_toggle_blockwise_visual)')

-- Vim Surround
vim.cmd [[
xmap ' S'
xmap " S"
xmap [ S[
xmap { S{
xmap ( S(
]]

-- Easy Replace
keymap('n', 'wr', '<CMD>EasyReplaceWord<CR>')
keymap('n', 'rw', '<CMD>EasyReplaceCword<CR>')
keymap('v', 'wr', '<CMD>EasyReplaceWordInVisual<CR>')
keymap('v', 'rw', '<CMD>EasyReplaceCwordInVisual<CR>')

-- Spectre
keymap('n', 'os', '<CMD>lua require("spectre").open()<CR>')
keymap('n', 'sp', '<CMD>lua require("spectre").open_file_search()<CR>')

--Treesitter
keymap('n', 'ts', '<CMD>TSToggle<CR>')
keymap('n', 'tu', '<CMD>TSUpdateSync<CR>')
keymap('n', 'pg', '<CMD>TSPlaygroundToggle<CR>')

-- Todo Comment
keymap('n', 'to', '<CMD>TodoTrouble<CR>')
keymap('n', 'tc', '<CMD>TodoTelescope<CR>')

-- Telescope
keymap('n', 'nt', '<CMD>lua require"telescope".extensions.noice.noice(require("telescope.themes").get_dropdown({}))<CR>')
keymap('n', 'tg', '<CMD>lua require"telescope.builtin".live_grep()<CR>')
keymap('n', 'of', '<CMD>lua require"telescope.builtin".oldfiles()<CR>')
keymap('n', 'bt', '<CMD>lua require"telescope.builtin".buffers()<CR>')
keymap('n', 'sf', '<CMD>lua require"telescope.builtin".find_files()<CR>')
keymap('n', 'bf', '<CMD>lua require"telescope.builtin".current_buffer_fuzzy_find()<CR>')

-- Illuminate
keymap('n', 'nr', '<CMD>lua require("illuminate").goto_next_reference(wrap)<CR>')
keymap('n', 'pr', '<CMD>lua require("illuminate").goto_prev_reference(wrap)<CR>')
keymap('n', 'iob', '<CMD>lua require("illuminate").textobj_select()<CR>')

-- Emmet
keymap('i', '<Leader>a', '<plug>(emmet-expand-abbr)')
keymap('n', '<Leader>]', '<plug>(emmet-move-next)')
keymap('n', '<Leader>[', '<plug>(emmet-move-prev)')

-- Live Server
keymap('n', 'ss', '<CMD>LiveServerStart<CR>')
keymap('n', 'SS', '<CMD>LiveServerStop<CR>')

-- Markdown Preview
keymap('n', 'mp', '<CMD>MarkdownPreview<CR>')
keymap('n', 'sm', '<CMD>MarkdownPreviewStop<CR>')
keymap('n', 'mt', '<CMD>MarkdownPreviewToggle<CR>')

-- Open Browser
keymap('n', 'ob', '<Plug>(openbrowser-open)<CR>')
keymap('n', 'sw', '<Plug>(openbrowser-search) <cword><CR>')
keymap('n', 'sb', '<Plug>(openbrowser-smart-search)<CR>')

-- Hop
keymap('n', ';l', '<CMD>HopWord<CR>')
keymap('n', ';1', '<CMD>HopChar1<CR>')
keymap('n', ';2', '<CMD>HopChar2<CR>')
keymap('n', ';j', '<CMD>HopWordCurrentLine<CR>')
keymap('n', ';h', '<CMD>lua require"hop".hint_lines()<CR>')
keymap('v', ';l', '<CMD>HopWord<CR>')
keymap('v', ';1', '<CMD>HopChar1<CR>')
keymap('v', ';3', '<CMD>HopChar2<CR>')
keymap('v', ';j', '<CMD>HopWordCurrentLine<CR>')
keymap('v', ';h', '<CMD>lua require"hop".hint_lines()<CR>')

-- Toggleterm
keymap('n', 'tt', '<CMD>ToggleTerm<CR>')
function _G.set_terminal_keymaps()
    local opt = { noremap = true }
    local key = vim.api.nvim_buf_set_keymap
    key(0, 't', 'kj', [[<C-\><C-n>]], opt)
    key(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opt)
    key(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opt)
    key(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opt)
    key(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opt)
end
