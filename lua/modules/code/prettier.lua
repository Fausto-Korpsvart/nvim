require('prettier').setup {
	bin = 'prettier',
	filetypes = {
		'css',
		'html',
		'json',
		'sass',
		'scss',
		'yaml',
		'javascript',
		'javascriptreact',
		'react',
		'typescript',
		'typescriptreact',
		'vue',
	},
	cli_options = {
		arrowParens = 'avoid',
		bracketSameLine = false,
		bracketSpacing = true,
		embeddedLanguageFormatting = 'auto',
		htmlWhitespaceSensitivity = 'css',
		insertPragma = false,
		jsxSingleQuote = true,
		printWidth = 80,
		proseWrap = 'preserve',
		quoteProps = 'as-needed',
		requirePragma = false,
		semi = false,
		singleAttributePerLine = false,
		singleQuote = true,
		tabWidth = 4,
		trailingComma = 'all',
		useTabs = true,
		vueIndentScriptAndStyle = false,
	},
	['null-ls'] = {
		condition = function()
			return require('prettier').config_exists {
				check_package_json = true,
			}
		end,
		runtime_condition = function()
			return true
		end,
		timeout = 5000,
	},
}
