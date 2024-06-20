local options = {
	autowrite = true,
	breakindent = false,
	clipboard = 'unnamedplus',
	cmdheight = 1,
	colorcolumn = '87',
	completeopt = { 'menuone', 'noselect', 'preview' },
	conceallevel = 3,
	confirm = false,
	copyindent = false,
	cursorcolumn = false,
	cursorline = true,
	cursorlineopt = { 'number', 'screenline' },
	encoding = 'utf-8',
	filetype = 'on',
	fillchars = {
		-- {{{
		eob = ' ',
		vert = '│',
		fold = ' ',
		foldsep = '', --  │
		foldopen = '🢓',
		foldclose = '🢒',
	}, -- }}}
	foldcolumn = '1',
	foldenable = true,
	foldlevel = 99,
	foldlevelstart = 0,
	foldmethod = 'marker',
	formatoptions = 'jcroqlnt',
	grepformat = '%f:%l:%c:%m',
	grepprg = 'rg --vimgrep',
	guicursor = 'n-v-ve:block-blinkon200,i-c-ci-r:hor50-Cursor-blinkon10',
	incsearch = true,
	laststatus = 1,
	lazyredraw = false,
	list = false,
	listchars = {
		-- {{{
		eol = '↴',
		tab = '  ',
		nbsp = ' ',
		trail = '·',
		space = ' ',
		extends = '🢒',
		precedes = '🢐',
	}, -- }}}
	mousescroll = 'ver:1',
	number = true,
	pumheight = 15,
	relativenumber = true,
	ruler = false,
	scrolloff = 25,
	sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize' },
	shiftround = true,
	shiftwidth = 4,
	shortmess = {
		-- {{{
		A = true,
		c = true,
		F = true,
		I = true,
		W = true,
	}, -- }}}
	showtabline = 0,
	sidescrolloff = 20,
	signcolumn = 'auto', -- yes:1|number|auto
	smartindent = false,
	smoothscroll = true,
	spell = false,
	spelllang = { 'en_gb', 'es' },
	spellsuggest = { 'best,9' },
	splitbelow = true,
	splitright = true,
	-- statuscolumn{{{
	-- statuscolumn = '%s %{&nu?(&rnu && v:relnum?v:relnum:v:lnum):""}%=%C│',
	-- statuscolumn = '%=%{&nu?(&rnu && v:relnum?v:relnum:v:lnum):""}%=%C│',
	-- statuscolumn = '%@SignCb@%s%=%T%@NumCb@%r│%T',
	-- }}}
	swapfile = false,
	syntax = 'on',
	tabstop = 4,
	termguicolors = true,
	timeoutlen = 300,
	undofile = true,
	undolevels = 10000,
	updatetime = 200,
	virtualedit = 'block',
	winminwidth = 5,
	wrap = false,
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

vim.opt.path:append '**'
vim.opt.wildignore:append '*/node_modules/*'
vim.opt.dictionary:append '/usr/share/dict/linux.words'
vim.scriptencoding = 'utf-8'
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.markdown_recommended_style = 0
vim.cmd [[set iskeyword+=-]]
vim.cmd 'set scroll=1'
-- vim.cmd 'set wildchar=<C-k>'
-- Desabled Builtins{{{
local builtins = {
	'2html_plugin',
	'getscript',
	'getscriptPlugin',
	'gzip',
	'logipat',
	'netrw',
	'netrwPlugin',
	'netrwSettings',
	'netrwFileHandlers',
	'matchit',
	'matchparen',
	'tar',
	'tarPlugin',
	'rrhelper',
	'spellfile_plugin',
	'vimball',
	'vimballPlugin',
	'zip',
	'zipPlugin',
	'logipat',
	'tutor',
	'rplugin',
	'syntax',
	'synmenu',
	'optwin',
	'compiler',
	'bugreport',
	'ftplugin',
	'fzf',
	'tutor_mode_plugin',
	'sleuth',
	'vimgrep',
}

for _, plugin in ipairs(builtins) do
	vim.g['loaded_' .. plugin] = 1
end
-- }}}
