return {
	-- https://github.com/VonHeikemen/lsp-zero.nvim
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v2.x',
	dependencies = {
		'neovim/nvim-lspconfig',
		'b0o/schemastore.nvim',
		{
			-- https://github.com/WhoIsSethDaniel/toggle-lsp-diagnostics.nvim
			'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
			event = 'BufReadPost',
			keys = {
				vim.keymap.set('n', 'vd', '<Plug>(toggle-lsp-diag)'),
			},
			config = function()
				require('toggle_lsp_diagnostics').init(vim.diagnostic.config())
			end,
		},
	},
	config = function()
		local lspzero = require('lsp-zero').preset {
			name = 'lsp-ony',
			float_border = 'single',
			setup_servers_on_start = true,
			call_servers = 'local',
			suggest_lsp_servers = false,
			configure_diagnostics = false,
			cmp_capabilities = false,
			manage_nvim_cmp = false,
			set_lsp_keymaps = false,
		}

		lspzero.set_sign_icons {
			error = '•',
			warn = '•',
			hint = '•',
			info = '•',
		}

		lspzero.on_attach(function(client, bufnr)
			vim.notify(' LSP Loading: ' .. client.name)
			local bufopt = { noremap = true, silent = true, buffer = bufnr }
			local keymap = vim.keymap.set
			keymap('n', 'fs', '<CMD>Lspsaga lsp_finder<CR>', bufopt)
			keymap('n', 'gd', '<CMD>Lspsaga goto_definition<CR>', bufopt)
			keymap('n', 'pv', '<CMD>Lspsaga peek_definition<CR>', bufopt)
			keymap('n', 'bd', '<CMD>Lspsaga show_buf_diagnostics<CR>', bufopt)
			keymap('n', 'dl', '<CMD>Lspsaga show_line_diagnostics<CR>', bufopt)
			keymap('n', 'cd', '<CMD>Lspsaga show_cursor_diagnostics<CR>', bufopt)
			keymap('n', 'pd', '<CMD>Lspsaga diagnostic_jump_prev<CR>', bufopt)
			keymap('n', 'nd', '<CMD>Lspsaga diagnostic_jump_next<CR>', bufopt)
			keymap('n', 'dh', '<CMD>Lspsaga hover_doc<CR>', bufopt)
			keymap('n', 'ca', '<CMD>Lspsaga code_action<CR>', bufopt)
			keymap('v', 'va', '<CMD>Lspsaga code_action<CR>', bufopt)
			keymap('n', 'ot', '<CMD>Lspsaga outline<CR>', bufopt)
			keymap('n', 'ci', '<CMD>Lspsaga incoming_calls<CR>', bufopt)
			keymap('n', 'co', '<CMD>Lspsaga outgoing_calls<CR>', bufopt)
			keymap('n', 'rn', '<CMD>Lspsaga rename<CR>', bufopt)
			keymap('n', 'gI', '<CMD>lua vim.lsp.buf.implementation()<CR>', bufopt)
			keymap({ 'n', 't' }, '<Leader>t', '<CMD>Lspsaga term_toggle<CR>', bufopt)
			keymap('n', 'nf', function()
				vim.lsp.buf.format { async = true, timeout_ms = 10000 }
			end, bufopt)
			vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]]
		end)

		-- Languages Settings<[[[
		local lspconfig = require 'lspconfig'
		-- cssls <[[[
		lspconfig.cssls.setup {
			filename = {
				'css',
				'sass',
				'scss',
			},
			settings = {
				css = {
					lint = {
						unknownAtRules = 'ignore',
					},
				},
				scss = {
					lint = {
						unknownAtRules = 'ignore',
					},
				},
			},
		}
		-- ]]]>
		-- eslint <[[[
		lspconfig.eslint.setup {
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
		-- ]]]>
		-- jsonls <[[[
		local schemastore = require 'schemastore'

		lspconfig.jsonls.setup {
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
		-- ]]]>
		-- pyright <[[[
		lspconfig.pyright.setup {
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
		-- ]]]>
		-- lua_ls <[[[
		lspconfig.lua_ls.setup {
			settings = {
				Lua = {
					hint = {
						enable = true,
						arrayIndex = 'Enable', -- "Enable", "Auto", "Disable"
						await = true,
						paramName = 'All',     -- "All", "Literal", "Disable"
						paramType = true,
						semicolon = 'All',     -- "All", "SameLine", "Disable"
						setType = true,
					},
					diagnostics = {
						globals = { 'vim' },
					},
				},
			},
		}
		-- ]]]>
		-- tsserver <[[[
		lspconfig.tsserver.setup {
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
		-- ]]]>
		-- yamlls <[[[
		lspconfig.yamlls.setup {
			yaml = {
				schemaStore = {
					enable = true,
				},
			},
		}
		-- ]]]>
		-- ]]]>

		lspzero.setup()

		vim.diagnostic.config {
			virtual_text = {
				source = 'always', -- never|true|always|if_many
				prefix = '',
			},
			signs = true,
			underline = true,
			severity_sort = true,
			update_in_insert = true,
			float = true,
		}
	end,
}
