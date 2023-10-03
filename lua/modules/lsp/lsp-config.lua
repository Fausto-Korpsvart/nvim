require('lspconfig.ui.windows').default_options.border = 'single'
vim.keymap.set('n', 'si', '<CMD>LspInfo<CR>', { desc = 'Show LSP Info' })

-- Global Keymaps
vim.keymap.set('n', 'dpd', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'dnd', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>of', vim.diagnostic.open_float)
vim.keymap.set('n', '<Leader>lk', vim.diagnostic.setloclist)

-- Diagnostics Signs
local signs = { Error = '•', Warn = '•', Hint = '•', Info = '•' }
for type, icon in pairs(signs) do
	local hl = 'DiagnosticSign' .. type
	vim.fn.sign_define(hl, {
		text = icon,
		texthl = hl,
		numhl = hl,
	})
end

-- Diagnostics Config
vim.diagnostic.config {
	severity_sort = true,
	underline = false,
	update_in_insert = false,
	signs = true,
	virtual_text = false,
	float = {
		show_header = true,
		focusable = true,
		source = 'if_many',
		border = 'single',
		header = ' 󱅫  LSP MESSAGE!! ',
		prefix = ' 󱧡  ',
	},
}

-- Handlers
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = 'single',
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = 'single',
})

-- On Attach
local on_attach = function(client, bufnr)
	client.server_capabilities.semanticTokensProvider = nil

	-- Inlay Hints
	local inlay_hint = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint

	-- Toggle Inlay Hints
	vim.g.toggle_inline_hints = false
	local function toggle_inline_hints()
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

	-- Keymaps
	local keymap = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, {
			buffer = bufnr,
			silent = true,
			noremap = true,
			desc = desc,
		})
	end

	-- Formatting{{{
	keymap('n', 'nf', function()
		vim.lsp.buf.format { async = true }
	end, 'LSP Format')
	vim.api.nvim_buf_create_user_command(bufnr, 'FormatNl', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format Buffer with LSP' })

	-- Range Formatting
	keymap('v', 'fr', function()
		vim.lsp.buf.format { async = true }
	end, 'LSP Format')
	vim.api.nvim_buf_create_user_command(bufnr, 'FormatRNl', function(_)
		vim.lsp.formatexpr()
	end, { desc = 'Range Format with LSP' })
	-- }}}

	-- Vim LSP Keymaps{{{
	keymap('n', 'dh', vim.lsp.buf.hover)
	keymap('n', 'gR', vim.lsp.buf.references)
	keymap('n', 'gD', vim.lsp.buf.declaration)
	keymap('n', 'gi', vim.lsp.buf.implementation)
	keymap('n', 'gd', vim.lsp.buf.definition)
	keymap('n', '<Leader>D', vim.lsp.buf.type_definition)
	keymap('n', '<Leader>ca', vim.lsp.buf.code_action)
	keymap('n', '<Leader>shd', vim.lsp.buf.signature_help)
	-- keymap('n', '<space>rn', vim.lsp.buf.rename)
	keymap('n', '<Leader>aw', vim.lsp.buf.add_workspace_folder)
	keymap('n', '<Leader>rw', vim.lsp.buf.remove_workspace_folder)
	keymap('n', '<Leader>lw', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end)
	keymap('n', '<Leader>ih', toggle_inline_hints, 'Toggle Inlay Hint')
	keymap('n', '<Leader>sd', toggle_diagnostics, 'Toggle Diagnostics')
	-- }}}

	-- LSP Saga Keymaps{{{
	keymap('n', '<Leader>sf', '<CMD>Lspsaga finder<CR>', 'Show Saga LSP Finder')
	keymap('n', '<Leader>pd', '<CMD>Lspsaga peek_definition<CR>', 'LSP Saga Show Peek Definition')
	keymap('n', '<Leader>gd', '<CMD>Lspsaga goto_definition<CR>', 'LSP Saga GoTo Definition')
	keymap('n', '<Leader>td', '<CMD>Lspsaga peek_type_definition<CR>', 'LSP Saga Show Peek Type Definition')
	keymap('n', '<Leader>gt', '<CMD>Lspsaga goto_type_definition<CR>', 'LSP Saga GoTo Type Definition')
	keymap('n', 'pd', '<CMD>Lspsaga diagnostic_jump_prev<CR>', 'LSP Saga Jump to Prev Diagnostic')
	keymap('n', 'nd', '<CMD>Lspsaga diagnostic_jump_next<CR>', 'LSP Saga Jump to Next Diagnostic')

	keymap('n', 'ne', function()
		require('lspsaga.diagnostic'):goto_next { severity = vim.diagnostic.severity.ERROR }
	end)
	keymap('n', 'pe', function()
		require('lspsaga.diagnostic'):goto_prev { severity = vim.diagnostic.severity.ERROR }
	end)
	keymap('n', 'nw', function()
		require('lspsaga.diagnostic'):goto_next { severity = vim.diagnostic.severity.WARN }
	end)
	keymap('n', 'pw', function()
		require('lspsaga.diagnostic'):goto_prev { severity = vim.diagnostic.severity.WARN }
	end)
	keymap('n', 'nh', function()
		require('lspsaga.diagnostic'):goto_next { severity = vim.diagnostic.severity.HINT }
	end)
	keymap('n', 'ph', function()
		require('lspsaga.diagnostic'):goto_prev { severity = vim.diagnostic.severity.HINT }
	end)
	keymap('n', 'ni', function()
		require('lspsaga.diagnostic'):goto_next { severity = vim.diagnostic.severity.INFO }
	end)
	keymap('n', 'pi', function()
		require('lspsaga.diagnostic'):goto_prev { severity = vim.diagnostic.severity.INFO }
	end)

	keymap('n', '<Leader>dh', '<CMD>Lspsaga hover_doc<CR>', 'LSP Saga Show Hover Documentation')
	keymap('n', '<Leader>Dh', '<CMD>Lspsaga hover_doc ++keep<CR>', 'LSP Saga Show Hover Documentation On Top Right Corner')
	keymap('n', '<Leader>ca', '<cmd>Lspsaga code_action<CR>', 'Show Saga LSP Code Actions')
	-- keymap('n', '<Leader>rn', '<cmd>Lspsaga rename<CR>', 'LSP Saga Rename Ocurrences on Hover Word')
	-- keymap('n', '<Leader>rp', '<cmd>Lspsaga rename ++project<CR>', 'LSP Saga Rename Ocurrences on Hover Word for selected files')
	keymap('n', '<Leader>sl', '<cmd>Lspsaga show_line_diagnostics<CR>', 'LSP Saga Show Line Diagnostics')
	keymap('n', '<Leader>sb', '<cmd>Lspsaga show_buf_diagnostics<CR>', 'LSP Saga Show Buffer Diagnostics')
	keymap('n', '<Leader>sw', '<cmd>Lspsaga show_workspace_diagnostics<CR>', 'LSP saga Show Workspace Diagnostics')
	keymap('n', '<Leader>sc', '<cmd>Lspsaga show_cursor_diagnostics<CR>', 'LSP Saga Show Cursor Diagnostics')
	keymap('n', '<Leader>ou', '<cmd>Lspsaga outline<CR>', 'LSP Saga Show Outline')
	keymap('n', '<Leader>ic', '<cmd>Lspsaga incoming_calls<CR>', 'LSP Saga Incoming Calls')
	keymap('n', '<Leader>oc', '<cmd>Lspsaga outgoing_calls<CR>', 'LSP Saga Outcoming Calls')
	keymap('n', '<Leader>st', '<cmd>Lspsaga term_toggle<CR>', 'LSP Saga Toggle Terminal')
	keymap('n', '<Leader>lg', '<cmd>Lspsaga term_toggle lazygit<CR>', 'LSP Saga Toggle Terminal')
	--}}}
end

-- Capabilities{{{
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
-- }}}

-- Servers Setup{{{
local lspconfig = require 'lspconfig'

-- bashls{{{
lspconfig.bashls.setup {
	on_attach = on_attach,
	capabilities = capabilities,

	settings = {
		bashIde = {
			globalPattern = '*@(.sh|.inc|.bash|.command)',
		},
	},
}
--}}}

-- cssls{{{
lspconfig.cssls.setup {
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
}
--}}}

-- emmet-ls{{{
lspconfig.emmet_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities,

	filetypes = {
		'astro',
		'css',
		'eruby',
		'html',
		'htmldjango',
		-- 'javascript',
		-- 'javascriptreact',
		'less',
		'pug',
		'sass',
		'scss',
		'svelte',
		-- 'typescriptreact',
		'vue',
	},
}
-- }}}

-- eslint{{{
lspconfig.eslint.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	command = 'EslintFixAll',
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
			enable = false,
			mode = 'all',
		},
		format = true,
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
}
--}}}

-- TODO: to config
-- eslintd{{{
-- lspconfig.eslintd.setup {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,

-- 	command = { '~/.npm-packages/bin/eslint_d' },
-- 	filetype = {
-- 		'javascript',
-- 		'javascriptreact',
-- 		'javascript.jsx',
-- 		'react',
-- 		'typescript',
-- 		'typescriptreact',
-- 		'typescript.tsx',
-- 		'vue',
-- 	},
-- }
--}}}

-- hls{{{
lspconfig.hls.setup {
	on_attach = on_attach,
	capabilities = capabilities,

	filetypes = { 'haskell', 'lhaskell', 'cabal' },
}
--}}}

-- ltex-ls{{{
-- https://valentjn.github.io/ltex/settings.html
lspconfig.ltex.setup {
	on_attach = on_attach,
	capabilities = capabilities,

	cmd = { 'ltex-ls' },
	filetypes = { 'markdown', 'text' },
	flags = { debounce_text_changes = 300 },
	settings = {
		ltex = {
			-- language = 'en-GB',
			language = 'es',
			-- language = 'auto',
		},
	},
}

--}}}

-- html_ls{{{
lspconfig.html.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
--}}}

-- jsonls{{{
local schemastore = require 'schemastore'

lspconfig.jsonls.setup {
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
}
--}}}

-- lemminx{{{
lspconfig.lemminx.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
-- }}}

-- lua_ls{{{
lspconfig.lua_ls.setup {
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
}
--}}}

-- pyright{{{
lspconfig.pyright.setup {
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
}
--}}}

-- remark_ls{{{
lspconfig.remark_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
--}}}

-- tsserver{{{
lspconfig.tsserver.setup {
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
}
--}}}

-- yamlls{{{
lspconfig.yamlls.setup {
	on_attach = on_attach,
	capabilities = capabilities,

	yaml = {
		schemaStore = {
			enable = true,
		},
	},
}
--}}}

-- yamlls{{{
lspconfig.yamlls.setup {
	on_attach = on_attach,
	capabilities = capabilities,

	yaml = {
		schemaStore = {
			enable = true,
		},
	},
}
--}}}
-- }}}
