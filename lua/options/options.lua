local opt = vim.opt

opt.autoindent = true
opt.autoread = true
opt.autowrite = false
opt.backup = false
opt.backupskip = { '/tmp/*', '/private/tmp/*' }
opt.backspace = 'start,eol,indent'
opt.breakindent = true
opt.clipboard = 'unnamedplus'
opt.cmdheight = 1
opt.colorcolumn = '80'
opt.completeopt = { 'menuone', 'noselect' }
opt.conceallevel = 0
opt.confirm = true
opt.cursorcolumn = false
opt.cursorline = true
opt.cursorlineopt = { 'number', 'screenline' }
opt.encoding = 'utf-8'
opt.expandtab = true
opt.foldcolumn = '0'
opt.foldenable = true
opt.foldlevel = 1
opt.foldlevelstart = 0
opt.foldmarker = '<[[[,]]]>'
opt.foldmethod = 'marker'
opt.formatoptions = 'jcroqlnt'
opt.grepformat = '%f:%l:%c:%m'
opt.grepprg = 'rg --vimgrep'
opt.hidden = true
opt.history = 100
opt.hlsearch = true
opt.ignorecase = false
opt.inccommand = 'split'
opt.incsearch = true
opt.joinspaces = false
opt.laststatus = 2
opt.list = true
opt.modifiable = true
opt.mouse = 'n'
opt.number = true
opt.numberwidth = 1
opt.pumheight = 15
opt.relativenumber = true
opt.scrolloff = 20
opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize' }
opt.shiftwidth = 4
opt.shiftround = true
-- opt.shortmess = 'fFIlqx'
opt.showbreak = ' '
opt.showcmd = true
opt.showmode = true
opt.showtabline = 0
opt.sidescrolloff = 20
opt.signcolumn = 'yes:1'
opt.smartcase = false
opt.smartindent = true
opt.smarttab = true
opt.splitbelow = true
opt.splitright = true
opt.synmaxcol = 240
opt.syntax = 'on'
opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.timeoutlen = 300
opt.title = true
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.virtualedit = 'block'
opt.wildmenu = true
opt.wildmode = 'full'
opt.wildoptions = 'pum,tagfile'
opt.wrap = false
opt.writebackup = false
opt.path:append { '**' } -- Finding files - search down into sub-folders
opt.wildignore:append { '*/node_modules/*' }
opt.dictionary:append '/usr/share/dict/linux.words'

opt.listchars:append {
    eol = '↴',
    tab = '⇥ ',
    nbsp = '•',
    trail = '·',
    space = ' ',
    extends = '→',
    precedes = '←',
}

opt.fillchars:append {
    eob = ' ',
    vert = '│',
    fold = ' ',
    foldsep = '',
    foldopen = '⮮',
    foldclose = '│',
}

vim.g.loaded_perl_provider = 0
vim.g.markdown_recommended_style = 0 -- Markdown Fix Indentation Settings
vim.scriptencoding = 'utf-8'
vim.cmd 'filetype plugin on'
vim.cmd 'filetype plugin indent on'
vim.cmd 'set wildchar=<C-k>'
vim.cmd 'set guicursor=n-v-ve:block-blinkon200,i-c-ci-r:hor50-Cursor-blinkon10'

local disabled_built_ins = {
    'netrw',
    'netrwPlugin',
    'netrwSettings',
    'netrwFileHandlers',
    'gzip',
    'zip',
    'zipPlugin',
    'tar',
    'tarPlugin',
    'getscript',
    'getscriptPlugin',
    'vimball',
    'vimballPlugin',
    'tohtml',
    '2html_plugin',
    'logipat',
    'rrhelper',
    'spellfile_plugin',
    'matchit',
    'matchparen',
    'tutor',
    'tutor_mode_plugin',
    'logiPat',
    'rrhelper',
    'rplugin',
    'shada_plugin',
    'synmenu',
    'optwin',
    'compiler',
    'bugreport',
    'ftplugin',
}
for _, plugin in pairs(disabled_built_ins) do
    vim.g['loaded_' .. plugin] = 1
end
