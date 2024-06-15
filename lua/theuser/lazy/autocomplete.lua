return {
	'hrsh7th/nvim-cmp',
	event = { 'InsertEnter', 'CmdlineEnter' },
	dependencies = {
		{ 'hrsh7th/cmp-buffer' },
		{ 'hrsh7th/cmp-cmdline' },
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'hrsh7th/cmp-nvim-lua' },
		{ 'saadparwaiz1/cmp_luasnip' },
		{ 'hrsh7th/cmp-path' },
		{ 'lukas-reineke/cmp-rg' },
		{
			'dcampos/cmp-emmet-vim',
			dependencies = { 'mattn/emmet-vim' },
		},
		{
			'L3MON4D3/LuaSnip',
			event = { 'InsertEnter' },
			build = 'make install_jsregexp',
			dependencies = {
				'rafamadriz/friendly-snippets',
				config = function() require('luasnip.loaders.from_vscode').lazy_load() end,
			},
			config = function()
				local luasnip = require 'luasnip'
				local options = {
					history = true,
					updateevents = 'TextChanged,TextChangedI',
				}

				luasnip.config.set_config(options)
				require('luasnip.loaders.from_vscode').lazy_load {
					paths = vim.g.luasnippets_path or '',
				}

				vim.api.nvim_create_autocmd('InsertLeave', {
					callback = function()
						if
							require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
							and not require('luasnip').session.jump_active
						then
							require('luasnip').unlink_current()
						end
					end,
				})
			end,
		},
		{
			'tzachar/cmp-tabnine',
			event = { 'InsertEnter' },
			build = './install.sh',
			config = function()
				local tabnine = require 'cmp_tabnine.config'

				tabnine:setup {
					max_lines = 1000,
					max_num_results = 20,
					sort = true,
					run_on_every_keystroke = true,
					snippet_placeholder = '..',
					show_prediction_strength = false,
				}
			end,
		},
	},
	config = function()
		local cmp = require 'cmp'
		local luasnip = require 'luasnip'
		luasnip.config.setup {}
		local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		local icons = {
			Text = '󰈙',
			Method = '',
			Function = '󰊕',
			Constructor = '󱁤',
			Field = '󰽏',
			Variable = '',
			Class = '𝓒',
			Interface = '',
			Module = '',
			Property = '',
			Unit = '',
			Value = '󰎠',
			Enum = 'ℰ',
			Keyword = '󰌆',
			Snippet = '',
			Color = '󰏘',
			File = '󰈮',
			Reference = '',
			Folder = '',
			EnumMember = '',
			Constant = '',
			Struct = '𝓢',
			Event = '',
			Operator = '󰆕',
			TypeParameter = '𝙏',
		}
		cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

		cmp.setup {
			snippet = {
				expand = function(args) require('luasnip').lsp_expand(args.body) end,
			},

			mapping = {
				['<C-p>'] = cmp.mapping(
					require('cmp').mapping.select_prev_item(cmp_select),
					{ 'i', 'c', 's' }
				),
				['<C-n>'] = cmp.mapping(
					require('cmp').mapping.select_next_item(cmp_select),
					{ 'i', 'c', 's' }
				),
				['<C-y>'] = cmp.mapping(
					require('cmp').mapping.confirm { select = true },
					{ 'i', 'c' }
				),
				['<C-i>'] = cmp.mapping(require('cmp').mapping.scroll_docs(-4)),
				['<C-u>'] = cmp.mapping(require('cmp').mapping.scroll_docs(4)),
				['<C-d>'] = function()
					if cmp.visible_docs() then
						cmp.close_docs()
					else
						cmp.open_docs()
					end
				end,
				['<C-l>'] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then luasnip.expand_or_jump() end
				end, { 'i', 's' }),
				['<C-h>'] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then luasnip.jump(-1) end
				end, { 'i', 's' }),
			},

			sources = {
				{ name = 'luasnip' },
				{ name = 'nvim_lsp' },
				{ name = 'cmp_tabnine' },
				{ name = 'nvim_lua' },
				{ name = 'emmet_vim', option = { filetypes = { 'html', 'css' } } },
				{ name = 'rg' },
				{ name = 'path' },
				{ name = 'buffer' },
			},

			formatting = {
				fields = { 'kind', 'abbr', 'menu' },
				format = function(entry, vim_item)
					vim_item.kind = string.format(' %s ', icons[vim_item.kind])

					vim_item.menu = ({
						luasnip = 'snippet',
						nvim_lsp = 'nvim-lsp',
						cmp_tabnine = 'tabnine',
						nvim_lua = 'nvim-lua',
						emmet_vim = 'emmet',
						rg = 'ripgrep',
						path = 'path',
						buffer = 'buffer',
					})[entry.source.name]

					if entry.source.name == 'cmp_tabnine' then
						vim_item.kind = ' ⌬ ' -- ⌬ 
					end

					if entry.source.name == 'emmet_vim' then
						vim_item.kind = '  ' -- 󰌝  󱓞  󱣱
					end

					return vim_item
				end,
			},

			window = {
				completion = {
					border = 'single',
					col_offset = 0,
					side_padding = 0,
					scrollbar = false,
					winhighlight = 'FloatBorder:CursorLineNr,CursorLine:CmpItemKindUnit',
				},
				documentation = {
					border = 'single',
					col_offset = 0,
					side_padding = 0,
					scrollbar = false,
					winhighlight = 'FloatBorder:CursorLineNr',
				},
			},

			experimental = { ghost_text = true },
			view = {
				docs = {
					auto_open = false,
				},
			},
		}

		require('cmp').setup.cmdline({ '/', '?' }, {
			sources = { { name = 'buffer' } },
		})

		require('cmp').setup.cmdline(':', {
			sources = cmp.config.sources {
				{ name = 'cmdline' },
				{ name = 'path' },
			},
		})
	end,
}
