local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local general = augroup('General Settings', { clear = true })

autocmd('BufEnter', {
    desc = 'Disable New Line Comment',
    group = general,
    callback = function()
        vim.opt.formatoptions:remove { 'c', 'r', 'o' }
    end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
    desc = 'Go To The Last Cursor Postion',
    group = general,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

autocmd('BufWritePre', {
    desc = 'Remove Whitespace On Save',
    pattern = '*',
    callback = function()
        vim.cmd ':%s/\\s\\+$//e'
    end,
    group = general,
})

autocmd('TextYankPost', {
    desc = 'Highlight On Yank',
    group = general,
    callback = function()
        require('vim.highlight').on_yank {
            higroup = 'YankHighlight',
            timeout = 100,
        }
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    desc = 'Close Some Filetypes With <q>',
    group = general,
    pattern = {
        'qf',
        'help',
        'man',
        'notify',
        'lspinfo',
        'startuptime',
        'spectre_panel',
        'tsplayground',
        'PlenaryTestPopup',
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
    end,
})

autocmd({ 'BufRead', 'BufNewFile' }, {
    desc = 'Check Spell In Some File',
    group = general,
    pattern = { '*.gitcommit', '*.txt', '*.md', '*.text' },
    callback = function()
        vim.opt_local.spell = true
    end,
})

autocmd('FileType', {
    desc = 'Enable Wrap In Some filetypes',
    pattern = { 'gitcommit', 'markdown', 'text', 'log' },
    group = general,
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

augroup('setIndent', { clear = true })
autocmd('Filetype', {
    desc = 'Set indentation To 2 Spaces In Some Filetypes',
    group = 'setIndent',
    pattern = { 'xml', 'html', 'xhtml', 'css', 'md', 'scss', 'yaml' },
    callback = function()
        -- vim.cmd 'setlocal shiftwidth=2 tabstop=2'
        vim.bo.shiftwidth = 2
        vim.bo.tabstop = 2
    end,
})

autocmd('FileType', {
    desc = 'Set indentation To 4 Spaces In Some Filetypes',
    group = general,
    pattern = { 'c', 'cpp', 'py', 'java', 'cs' },
    callback = function()
        vim.bo.shiftwidth = 4
        vim.bo.tabstop = 4
    end,
})

augroup('setLineLenght', { clear = true })
autocmd('Filetype', {
    desc = 'Disable line lenght marker',
    group = 'setLineLenght',
    pattern = { 'text', 'markdown', 'html', 'xhtml', 'javascript', 'typescript' },
    callback = function()
        vim.cmd 'setlocal cc=0'
    end,
})

autocmd({ 'FileType' }, {
    desc = 'iskeyword+=- In Some Webdev Filetypes',
    group = general,
    pattern = { 'css', 'html' },
    callback = function()
        vim.cmd 'setlocal iskeyword+=-'
    end,
})

autocmd('VimResized', {
    desc = 'Equalize Splits',
    group = general,
    callback = function()
        vim.cmd 'wincmd ='
    end,
})

-- Plugins
vim.cmd [[autocmd TermOpen term://* lua set_terminal_keymaps()]]

autocmd({ 'User' }, {
    desc = 'Hide Tabs, Status & CMD in Alpha',
    group = general,
    pattern = { 'AlphaReady' },
    callback = function()
        vim.cmd [[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=0
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=2
      set cmdheight=0 | autocmd BufUnload <buffer> set cmdheight=1
    ]]
    end,
})

autocmd('FileType', {
    desc = 'Disable Indentscope in Some BufType',
    pattern = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
    group = general,
    callback = function()
        vim.b.miniindentscope_disable = true
    end,
})

autocmd({ 'BufNewFile', 'BufRead' }, {
    desc = 'Set FileType For BBCode',
    group = general,
    pattern = { '*.bbcode' },
    callback = function()
        vim.cmd 'set filetype=bbcode'
    end,
})
