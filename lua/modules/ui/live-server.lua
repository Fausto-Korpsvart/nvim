require('live_server.util').install()
require('live_server').setup {
	port = 8080,
	browser_command = '',
	quiet = false,
	no_css_inject = true,
	-- install_path = vim.fn.stdpath 'config' .. '/live-server/',
}

vim.keymap.set('n', '<Leader>ls', '<CMD>LiveServer<CR>')
vim.keymap.set('n', '<Leader>ssj', '<CMD>LiveServerStop<CR>')
