local lspconfig = require 'lspconfig'
require('lspconfig.ui.windows').default_options.border = 'single'

-- Global Keymaps
vim.keymap.set('n', 'ilsp', '<CMD>LspInfo<CR>', { desc = 'Show LSP Info' })
vim.keymap.set('n', 'slsp', '<CMD>LspStart<CR>', { desc = 'Show LSP Info' })
vim.keymap.set('n', 'elsp', '<CMD>LspStop<CR>', { desc = 'Show LSP Info' })
vim.keymap.set('n', 'pd', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'nd', vim.diagnostic.goto_next)
vim.keymap.set('n', '<Leader>of', vim.diagnostic.open_float)
vim.keymap.set('n', '<Leader>sl', vim.diagnostic.setloclist, { desc = 'Diag to locklist' })

-- Diagnostics Config
vim.diagnostic.config {
	severity_sort = true,
	underline = false,
	update_in_insert = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = '•',
			[vim.diagnostic.severity.WARN] = '•',
			[vim.diagnostic.severity.HINT] = '•',
			[vim.diagnostic.severity.INFO] = '•',
		},
		linehl = {
			[vim.diagnostic.severity.ERROR] = 'ErrorMsg',
			[vim.diagnostic.severity.WARN] = 'WarningMsg',
			[vim.diagnostic.severity.HINT] = 'HintMsg',
			[vim.diagnostic.severity.INFO] = 'InfoMsg',
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = 'ErrorMsg',
			[vim.diagnostic.severity.WARN] = 'WarningMsg',
			[vim.diagnostic.severity.HINT] = 'HintMsg',
			[vim.diagnostic.severity.INFO] = 'InfoMsg',
		},
	},
	virtual_text = false,
	-- virtual_text = {
	-- 	prefix = '•', -- ● ▎■
	-- },
	float = {
		show_header = true,
		focusable = true,
		source = 'always',
		border = 'single',
		header = ' 󰺻  LSP MESSAGE!! ',
		prefix = '   ',
	},
}

-- Define common handlers
local common_handlers = {
	border = 'single',
}

-- Set handlers for hover and signatureHelp
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, common_handlers)
vim.lsp.handlers['textDocument/signatureHelp'] =
	vim.lsp.with(vim.lsp.handlers.signature_help, common_handlers)

-- On Attach
local on_attach = function(client, bufnr)
	client.server_capabilities.semanticTokensProvider = nil

	-- Toggle LSP for Current Buffer
	local function toggle_lsp_client()
		local buf = vim.api.nvim_get_current_buf()
		local clients = vim.lsp.get_active_clients { bufnr = buf }
		if not vim.tbl_isempty(clients) then
			vim.cmd 'LspStop'
		else
			vim.cmd 'LspStart'
		end
	end

	-- Toggle Inlay Hints
	vim.g.toggle_inline_hints = false

	local function toggle_inline_hints()
		local inlay_hint = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint
		if vim.g.toggle_inline_hints then
			vim.g.toggle_inline_hints = false
			inlay_hint(bufnr, false)
		else
			if client.server_capabilities.inlayHintProvider then
				vim.g.toggle_inline_hints = true
				inlay_hint(bufnr, true)
			else
				print 'no inlay hints available'
			end
		end
	end

	-- Toggle Diagnostics
	vim.g.toggle_diagnostics = true

	local function toggle_diagnostics()
		if vim.g.toggle_diagnostics then
			vim.g.toggle_diagnostics = false
			vim.diagnostic.disable()
		else
			vim.g.toggle_diagnostics = true
			vim.diagnostic.enable()
		end
	end

	-- Keymaps{{{
	local function keymap(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, {
			buffer = bufnr,
			silent = true,
			noremap = true,
			desc = desc,
		})
	end

	-- Nvim LSP Keymaps
	keymap('n', 'dh', vim.lsp.buf.hover)
	keymap('n', 'gR', vim.lsp.buf.references)
	keymap('n', 'gD', vim.lsp.buf.definition)
	keymap('n', 'gdc', vim.lsp.buf.declaration)
	keymap('n', 'gI', vim.lsp.buf.implementation)
	keymap({ 'n', 'v' }, 'qa', vim.lsp.buf.code_action)
	keymap('n', '<Leader>sh', vim.lsp.buf.signature_help)
	keymap('n', '<Leader>D', vim.lsp.buf.type_definition)
	keymap('n', '<space>rn', vim.lsp.buf.rename)
	-- keymap('n', '<Leader>aw', vim.lsp.buf.add_workspace_folder)
	-- keymap('n', '<Leader>rw', vim.lsp.buf.remove_workspace_folder)
	-- keymap('n', '<Leader>lw', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)
	keymap('n', '<Leader>lt', toggle_lsp_client, 'Toggle LSP On Buffer')
	keymap('n', '<Leader>ih', toggle_inline_hints, 'Toggle Inlay Hint')
	keymap('n', '<Leader>sd', toggle_diagnostics, 'Toggle Diagnostics')
	-- }}}

	-- Formatting{{{
	keymap('n', 'fl', function() vim.lsp.buf.format { async = true } end, 'LSP Format')
	vim.api.nvim_buf_create_user_command(
		bufnr,
		'Format',
		function(_) vim.lsp.buf.format() end,
		{ desc = 'Format Buffer with LSP' }
	)

	-- Range Formatting
	keymap('v', 'fr', function() vim.lsp.buf.format { async = true } end, 'LSP Range Format')
	vim.api.nvim_buf_create_user_command(
		bufnr,
		'FormatR',
		function(_) vim.lsp.formatexpr() end,
		{ desc = 'Range Format with LSP' }
	)

	keymap(
		{ 'n', 'v' },
		'cf',
		function() require('conform').format { async = true, lsp_fallback = true } end,
		'Format with Conform'
	)
	vim.api.nvim_buf_create_user_command(
		bufnr,
		'FormatC',
		function(_) vim.lsp.formatexpr() end,
		{ desc = 'Format with Conform' }
	)
	-- }}}
end

-- Define capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem = {
	documentationFormat = { 'markdown', 'plaintext' },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			'documentation',
			'detail',
			'additionalTextEdits',
		},
	},
}

-- Set up LSP servers
local schemastore = require 'schemastore'
local servers = {
	{ -- bashls {{{
		name = 'bashls',
		config = {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				bashIde = {
					globalPattern = '*@(.sh|.inc|.bash|.command)',
				},
			},
		},
	}, -- }}}
	{ -- cssls{{{
		name = 'cssls',
		config = {
			on_attach = on_attach,
			capabilities = capabilities,
			filename = {
				'css',
				'sass',
				'scss',
			},
			settings = {
				css = {
					lint = {
						unknownAtRules = 'ignore',
						unknownProperties = 'ignore',
						vendorPrefix = 'ignore',
					},
				},
				scss = {
					lint = {
						unknownAtRules = 'ignore',
						unknownProperties = 'ignore',
						vendorPrefix = 'ignore',
					},
				},
			},
		},
	}, -- }}}
	{ -- emmet_ls{{{
		name = 'emmet_ls',
		config = {
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = {
				'astro',
				'css',
				'eruby',
				'html',
				'htmldjango',
				'javascript',
				'javascriptreact',
				'less',
				'pug',
				'sass',
				'scss',
				'svelte',
				'typescriptreact',
				'vue',
			},
		},
	}, -- }}}
	{ -- eslint{{{
		name = 'eslint',
		config = {
			on_attach = on_attach,
			capabilities = capabilities,
			filetype = {
				'javascript',
				'javascriptreact',
				'javascript.jsx',
				'react',
				'typescript',
				'typescriptreact',
				'typescript.tsx',
				'vue',
			},
			settings = {
				codeAction = {
					disableRuleComment = {
						enable = true,
						location = 'separateLine',
					},
					showDocumentation = {
						enable = true,
					},
				},
				codeActionOnSave = {
					enable = true,
					mode = 'all',
				},
				format = false,
				nodePath = '',
				onIgnoredFiles = 'off',
				packageManager = 'npm',
				quiet = false,
				rulesCustomizations = {},
				run = 'onType',
				useESLintClass = false,
				validate = 'on',
				workingDirectory = {
					mode = 'location',
				},
			},
		},
	}, -- }}}
	{ -- hls{{{
		name = 'hls',
		config = {
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { 'haskell', 'lhaskell', 'cabal' },
		},
	}, -- }}}
	{ -- html{{{
		name = 'html',
		config = {
			on_attach = on_attach,
			capabilities = capabilities,
		},
	}, -- }}}
	{ -- jsonls{{{
		name = 'jsonls',
		config = {
			on_attach = on_attach,
			capabilities = capabilities,

			init_options = {
				provideFormatter = false,
			},
			settings = {
				json = {
					schemas = schemastore.json.schemas(),
				},
			},
			setup = {
				commands = {
					Format = {
						function()
							vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line '$', 0 })
						end,
					},
				},
			},
		},
	}, -- }}}
	{ -- lemminx{{{
		name = 'lemminx',
		config = {
			on_attach = on_attach,
			capabilities = capabilities,
		},
	}, -- }}}
	{ -- ltex{{{
		name = 'ltex',
		config = {
			on_attach = on_attach,
			capabilities = capabilities,

			cmd = { 'ltex-ls' },
			filetypes = { 'markdown', 'text' },
			flags = { debounce_text_changes = 300 },
			settings = {
				ltex = {
					language = 'en-GB',
					-- language = 'es',
					-- language = 'auto',
				},
			},
		},
	}, -- }}}
	{ -- lua_ls{{{
		name = 'lua_ls',
		config = {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					hint = {
						enable = true,
						arrayIndex = 'Enable', -- "Enable", "Auto", "Disable"
						await = true,
						paramName = 'All', -- "All", "Literal", "Disable"
						paramType = true,
						semicolon = 'All', -- "All", "SameLine", "Disable"
						setType = true,
					},
					diagnostics = {
						globals = { 'vim', 'awesome', 'client', 'screen', 'mouse' },
					},
				},
			},
		},
	}, -- }}}
	{ -- pyright{{{
		name = 'pyright',
		config = {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				python = {
					analysis = {
						typeCheckingMode = 'basic',
						diagnosticMode = 'workspace',
						inlayHints = {
							variableTypes = true,
							functionReturnTypes = true,
						},
					},
				},
			},
		},
	}, -- }}}
	{ -- tsserver{{{
		name = 'tsserver',
		config = {
			on_attach = on_attach,
			capabilities = capabilities,

			settings = {
				disable_formatting = true,
				settings = {
					javascript = {
						inlayHints = {
							includeInlayEnumMemberValueHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all';
							includeInlayParameterNameHintsWhenArgumentMatchesName = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayVariableTypeHints = true,
						},
					},
					typescript = {
						inlayHints = {
							includeInlayEnumMemberValueHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all';
							includeInlayParameterNameHintsWhenArgumentMatchesName = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayVariableTypeHints = true,
						},
					},
				},
			},
		},
	},
	-- }}}
	{ -- yamlls{{{
		name = 'yamlls',
		config = {
			on_attach = on_attach,
			capabilities = capabilities,

			yaml = {
				schemaStore = {
					enable = true,
				},
			},
		},
	}, -- }}}
}

for _, server in pairs(servers) do
	lspconfig[server.name].setup(server.config)
end
