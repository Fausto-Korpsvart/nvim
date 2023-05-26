local function keymap(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- Neovim Core
keymap('n', 'so', ':source %<CR>')                  -- SourceFile
keymap('i', 'kj', '<Esc>')                          -- Map Esc to kj
keymap('n', '.', ':')                               -- Nvim Command Line
keymap('n', 'q', '<Nop>')                           -- Stop recording with q
keymap('n', 'Q', '<nop>')                           -- Stop registring with Q
keymap('n', '<CR>', ':noh<CR>')                     -- No Highlight
keymap('n', 'H', '^<ESC>')                          -- Go to beginning of line
keymap('n', 'L', '$<ESC>')                          -- Go to end of line
keymap('n', 'dw', 'vb"_d')                          -- Delete a word backwards
-- Managing Buffers & Tabs
keymap('n', '<C-h>', '<C-w>h')                      -- Move to Buffer Left
keymap('n', '<C-j>', '<C-w>j')                      -- Move to Buffer Down
keymap('n', '<C-k>', '<C-w>k')                      -- Move to Buffer Up
keymap('n', '<C-l>', '<C-w>l')                      -- Move to Buffer Right
keymap('n', '<leader>d', '<CMD>bp<CR>')             -- Buffer Prev
keymap('n', '<leader>f', '<CMD>bn<CR>')             -- Buffer Next
keymap('n', 'nt', '<CMD>tabnew<CR>')                -- Buffer Prev
keymap('n', 'tp', '<CMD>tabn<CR>')                  -- Buffer Prev
keymap('n', 'tn', '<CMD>tabp<CR>')                  -- Buffer Next
keymap('n', 'sv', '<C-w>v')                         -- Open Buffers Vertically
keymap('n', 'sh', '<C-w>s')                         -- Open Buffers Horizontally
keymap('n', '<M-y>', '<CMD>vertical resize -2<CR>') -- Resizing Left
keymap('n', '<M-u>', '<CMD>resize +2<CR>')          -- Resizing Up
keymap('n', '<M-i>', '<CMD>resize -2<CR>')          -- Resizing Down
keymap('n', '<M-o>', '<CMD>vertical resize +2<CR>') -- Resizing Right
-- Basic Moving Code
keymap('v', '>', '>gv')                             -- Indenting Code Right
keymap('v', '<', '<gv')                             -- Indenting Code Left
keymap('n', 'K', ':move .-2<CR>==')                 -- Moving Code Up Normal Mode
keymap('n', 'J', ':move .+1<CR>==')                 -- Moving Code Down Normal Mode
keymap('x', 'K', ":move '<-2<CR>gv-gv")             -- Moving Code Up Visual Mode
keymap('x', 'J', ":move '>+1<CR>gv-gv")             -- Moving Code Down Visual Mode
-- Basic Text Editing
keymap('n', '<Leader>w', '<CMD>w<CR>')              -- Basic Save file
keymap('n', '<Leader>z', '<CMD>wa<CR>')             -- Save all files
keymap('n', '<Leader>q', '<CMD>q<CR>')              -- Quit Buffer
keymap('n', '<Leader>x', '<CMD>qa<CR>')             -- Quit Buffer
keymap('n', '=', '<C-a>')                           -- Increment
keymap('n', '-', '<C-x>')                           -- Decrement
keymap('v', '`', 'u')                               -- Case change in visual mode
keymap('v', '<A-`>', 'U')                           -- Case change in visual mode
keymap('v', 'y', 'ygv<ESC>')                        -- Cursor at the bottom after yank.
keymap('v', 'p', 'pgv<ESC>')                        -- Cursor at the bottom after paste
keymap('v', 'p', '"_dP')                            -- Better paste
keymap('n', 'x', '"_x')                             -- Don't yank with x
keymap('n', '<Leader>fm', 'gqap')                   -- Format paragraph at 80 character
-- Terminal
function _G.set_terminal_keymaps()
	local opt = { noremap = true }
	local key = vim.api.nvim_buf_set_keymap
	key(0, 't', 'kj', [[<C-\><C-n>]], opt)
	key(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opt)
	key(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opt)
	key(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opt)
	key(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opt)
end
