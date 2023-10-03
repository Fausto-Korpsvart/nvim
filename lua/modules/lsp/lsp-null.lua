require('null-ls').setup {
	sources = {
		-- Linters
		require('null-ls').builtins.diagnostics.eslint,
		require('null-ls').builtins.diagnostics.eslint_d,
		require('null-ls').builtins.diagnostics.flake8,
		require('null-ls').builtins.diagnostics.markdownlint,
		require('null-ls').builtins.diagnostics.tidy.with {
			{ 'html', 'xml' },
		},
		-- Formatters
		require('null-ls').builtins.formatting.beautysh,
		require('null-ls').builtins.formatting.black,
		require('null-ls').builtins.formatting.prettierd.with {
			filetypes = {
				'css',
				'html',
				'javascript',
				'javascriptreact',
				'json',
				'sass',
				'scss',
				'yaml',
				'react',
				'typescript',
				'typescriptreact',
				'vue',
			},
			extra_args = {
				'--no-semi',
				'--single-quote',
				'--jsx-single-quote',
			},
		},
		require('null-ls').builtins.formatting.remark,
		require('null-ls').builtins.formatting.stylua,
		require('null-ls').builtins.formatting.xmllint,
		require('null-ls').builtins.formatting.xmlformat,
	},
}
