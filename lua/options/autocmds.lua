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

autocmd('BufReadPost', {
    desc = 'Go To The Last Cursor Postion',
    group = general,
    callback = function()
        if vim.fn.line '\'"' > 1 and vim.fn.line '\'"' <= vim.fn.line '$' then
            vim.cmd 'normal! g`"'
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

autocmd('FileType', {
    desc = 'Close Some Filetypes With <q>',
    group = general,
    pattern = {
        'qf',
        'help',
        'man',
        'lspinfo',
        'spectre_panel',
        'tsplayground',
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
    pattern = { 'c', 'cpp', 'py', 'java', 'cs', 'javascript' },
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

-- autocmd('TermOpen', {
--     desc = 'Start TermMode When TermBuf Open.',
--     group = general,
--     callback = function()
--         vim.opt_local.number = false
--         vim.opt_local.relativenumber = false
--     end,
-- })

-- Plugins
vim.cmd [[autocmd TermOpen term://* lua set_terminal_keymaps()]]

autocmd({ 'User' }, {
    desc = 'Hide Tabs, Status & CMD in Alpha',
    group = general,
    pattern = { 'AlphaReady' },
    callback = function()
        vim.opt.showtabline = 0
        vim.opt.cmdheight = 0
        vim.opt.laststatus = 0
        autocmd('BufUnload', {
            pattern = '<buffer>',
            callback = function()
                vim.opt.showtabline = 0
                vim.opt.cmdheight = 0
                vim.opt.laststatus = 2
            end,
        })
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
