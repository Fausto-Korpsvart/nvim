require('mason').setup {
	ui = {
		border = 'single',
		width = 0.85,
		height = 0.80,
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
		'remark_ls',
		'tsserver',
		'yamlls',
	},
	automatic_installation = true,
}

require('mason-null-ls').setup {
	ensure_installed = {
		'eslint',
		'eslint_d',
		'tydy',
		'flake8',
		'markdownlint',
		'stylua',
		'prettier',
		'prettierd',
		'black',
		'beautysh',
		'shellcheck',
		'shfmt',
		'xmlformatter',
	},
}
vim.keymap.set('n', 'ms', '<CMD>Mason<CR>')
vim.keymap.set('n', 'ml', '<CMD>MasonLog<CR>')
