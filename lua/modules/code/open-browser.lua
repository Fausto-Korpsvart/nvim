vim.g.openbrowser_default_search = 'brave'
vim.g.openbrowser_fix_hosts = { ['google.com'] = 'search.brave.com' }
vim.g.openbrowser_fix_schemes = { ['http'] = 'https' }
vim.g.openbrowser_search_engines = {
	['brave'] = 'https://search.brave.com/search?q={query}',
	['fedora'] = 'https://fedoramagazine.org/search?q={query}',
	['neovim'] = 'https://neovim.io/',
	['github'] = 'https://github.com/search?q={query}',
	['python'] = 'https://docs.python.org/dev/search.html?q={query}&check_keywords=yes&area=default',
	['devdocs'] = 'https://devdocs.io/#q={query}',
	['fileformat'] = 'https://www.fileformat.info/info/unicode/char/{query}/',
}

vim.keymap.set('n', '<Leader>ob', '<Plug>(openbrowser-open)<CR>')
vim.keymap.set('n', '<Leader>sw', '<Plug>(openbrowser-search) <cword><CR>')
vim.keymap.set('n', '<Leader>sb', '<Plug>(openbrowser-smart-search)<CR>')
