return {
	'jose-elias-alvarez/null-ls.nvim',
	event = 'BufReadPre',
	config = function()
		require('null-ls').setup {
			sources = {
				require('null-ls').builtins.diagnostics.tidy.with {
					filetypes = { 'html', 'xml' },
				},
				require('null-ls').builtins.formatting.prettier.with {
					filetypes = {
						'css',
						'html',
						'json',
						'markdown',
						'sass',
						'scss',
						'yaml',
					},
					extra_args = {
						'--no-semi',
						'--single-quote',
						'--jsx-single-quote',
						'--fast',
					},
				},
				require('null-ls').builtins.diagnostics.eslint,
				require('null-ls').builtins.formatting.eslint.with {
					filetypes = {
						'json',
						'javascript',
						'javascriptreact',
						'react',
						'typescript',
						'typescriptreact',
						'vue',
					},
					extra_args = {
						'--fix-dry-run',
						'--format',
						'json',
						'--stdin',
						'--stdin-filename',
						'$FILENAME',
					},
				},
				require('null-ls').builtins.formatting.stylua,
				require('null-ls').builtins.formatting.black.with { extra_args = { '--fast' } },
				require('null-ls').builtins.diagnostics.flake8,
				require('null-ls').builtins.formatting.beautysh.with {
					filetypes = { 'bash', 'csh', 'ksh', 'sh', 'zsh' },
				},
			},
		}
	end,
}
