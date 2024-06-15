require('mason').setup {
	ui = {
		border = 'single',
		width = 0.85,
		height = 0.85,
		icons = {
			package_pending = '󱥸 ',
			package_installed = ' ',
			package_uninstalled = ' ',
		},
		keymaps = {
			toggle_package_expand = 'l',
			uninstall_package = 'x',
		},
	},
	log_level = vim.log.levels.INFO,
}

require('mason-lspconfig').setup {
	ensure_installed = {
		'bashls',
		'cssls',
		'emmet_ls',
		'eslint',
		'html',
		'hls',
		'jsonls',
		'lemminx',
		'lua_ls',
		'pyright',
		'tsserver',
		'vimls',
		'yamlls',
	},
	automatic_installation = true,
}
require('mason-tool-installer').setup {
	ensure_installed = {
		'bash-language-server',
		'beautysh',
		'black',
		'eslint_d',
		'flake8',
		'isort',
		'jsonlint',
		'lua-language-server',
		'luacheck',
		'markdownlint',
		'prettier',
		'prettierd',
		'shellcheck',
		'shfmt',
		'stylua',
		'vim-language-server',
		'xmlformatter',
		'yamlfmt',
		'yamllint',
	},
	auto_update = true,
}

vim.keymap.set('n', '<Leader>ms', '<CMD>Mason<CR>')
vim.keymap.set('n', '<Leader>ml', '<CMD>MasonLog<CR>')
vim.keymap.set('n', '<Leader>mti', '<CMD>MasonToolsInstall<CR>')
vim.keymap.set('n', '<Leader>mtu', '<CMD>MasonToolsUpdate<CR>')
vim.keymap.set('n', '<Leader>mtc', '<CMD>MasonToolsClean<CR>')
