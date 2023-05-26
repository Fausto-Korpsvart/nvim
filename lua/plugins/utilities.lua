return {
	{	-- https://github.com/vuciv/vim-bujo
		'vuciv/vim-bujo',
		config = function()
			vim.keymap.set('n', '<Leader>b', ':Todo g<CR>')
			vim.keymap.set('n', '<Leader>bc', '<CMD>Todo<CR>')
			vim.keymap.set('n', '<Leader>ad', '<Plug>BujoAddnormal<CR>')
			vim.keymap.set('n', '<Leader>ai', '<Plug>BujoAddinsert<CR>')
			vim.keymap.set('n', '<Leader>cn', '<Plug>BujoChecknormal<CR>')
			vim.keymap.set('n', '<Leader>ci', '<Plug>BujoCheckinsert<CR>')
			vim.cmd [[
				let g:bujo#todo_file_path = $HOME . "/.cache/bujo"
				let g:bujo#window_width = 40
			]]
		end,
	},
	{
		-- https://github.com/ellisonleao/glow.nvim
		'ellisonleao/glow.nvim',
		event = 'VeryLazy',
		keys = {
			vim.keymap.set('n', 'gl', '<CMD>Glow<CR>'),
			vim.keymap.set('n', 'cg', '<CMD>Glow!<CR>'),
		},
		config = function()
			require('glow').setup { border = 'single', style = 'dark', width = 150, height = 150 }
		end,
	},
	{
		-- https://github.com/vigoux/notifier.nvim
		'vigoux/notifier.nvim',
		event = 'VeryLazy',
		config = function()
			require('notifier').setup {
				components = { 'nvim', 'lsp' },
				notify = { clear_time = 5000, min_level = vim.log.levels.INFO },
				component_name_recall = false,
				zindex = 50,
			}
		end,
	},
	{
		-- https://github.com/tyru/open-browser.vim
		'tyru/open-browser.vim',
		event = 'VeryLazy',
		keys = {
			vim.keymap.set('n', 'ob', '<Plug>(openbrowser-open)<CR>'),
			vim.keymap.set('n', 'sw', '<Plug>(openbrowser-search) <cword><CR>'),
			vim.keymap.set('n', 'sb', '<Plug>(openbrowser-smart-search)<CR>'),
		},
		config = function()
			vim.cmd [[
                let g:openbrowser_fix_hosts = {"google.com": "search.brave.com"}
                let g:openbrowser_fix_schemes = {"http": "https"}
                let g:openbrowser_search_engines = {
                    \ 'brave': 'https://search.brave.com/search?q={query}',
                    \ 'fedora': 'https://fedoramagazine.org/search?q={query}',
                    \ 'neovim': 'https://neovim.io/',
                    \ 'github': 'https://github.com/search?q={query}',
                    \ 'python': 'https://docs.python.org/dev/search.html?q={query}&check_keywords=yes&area=default',
                    \ 'twitter-search': 'https://twitter.com/search/{query}',
                    \ 'twitter-user': 'https://twitter.com/{query}',
                    \ 'devdocs': 'https://devdocs.io/#q={query}',
                    \ 'fileformat': 'https://www.fileformat.info/info/unicode/char/{query}/',
                    \}
                let g:openbrowser_default_search = "brave"
            ]]
		end,
	},
}
