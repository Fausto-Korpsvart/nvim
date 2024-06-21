return {
	{
		'neovim/nvim-lspconfig',
		event = { 'BufRead', 'BufReadPre', 'BufReadPost', 'BufNewfile' },
		dependencies = {
			{
				'williamboman/mason.nvim',
				event = 'VeryLazy',
				dependencies = {
					{ 'williamboman/mason-lspconfig.nvim' },
					{ 'WhoIsSethDaniel/mason-tool-installer.nvim' },
					{ 'jay-babu/mason-nvim-dap.nvim' },
				},

				config = function() require 'theuser.lazy.lsp.lsp-mason' end,
			},

			{
				'stevearc/conform.nvim',
				config = function() require 'theuser.lazy.lsp.lsp-conform' end,
			},

			{
				'mfussenegger/nvim-lint',
				config = function() require 'theuser.lazy.lsp.lsp-lint' end,
			},

			{
				'j-hui/fidget.nvim',
				config = function() require 'theuser.lazy.lsp.lsp-fidget' end,
			},

			{
				'luckasRanarison/clear-action.nvim',
				config = function() require 'theuser.lazy.lsp.lsp-actions' end,
			},

			{
				'Wansmer/symbol-usage.nvim',
				config = function() require 'theuser.lazy.lsp.lsp-symbols' end,
			},

			{
				'dnlhc/glance.nvim',
				config = function() require 'theuser.lazy.lsp.lsp-glance' end,
			},

			{
				'RRethy/vim-illuminate',
				config = function() require 'theuser.lazy.lsp.lsp-lumos' end,
			},

			{
				'hedyhli/outline.nvim',
				config = function() require 'theuser.lazy.lsp.lsp-outline' end,
			},

			{ 'b0o/schemastore.nvim' },
		},

		config = function() require 'theuser.lazy.lsp.lsp-config' end,
	},
}
