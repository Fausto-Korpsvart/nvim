local cmp = require 'cmp'
-- local cmp_autopairs = require 'nvim-autopairs.completion.cmp'

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

-- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })

cmp.setup {
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},

	mapping = {
		['<C-p>'] = cmp.mapping(require('cmp').mapping.select_prev_item(), { 'i', 's', 'c' }),
		['<C-n>'] = cmp.mapping(require('cmp').mapping.select_next_item(), { 'i', 's', 'c' }),
		['<C-l>'] = cmp.mapping(require('cmp').mapping.confirm { select = true }, { 'i', 's', 'c' }),
		['<C-i>'] = cmp.mapping(require('cmp').mapping.scroll_docs(-4)),
		['<C-u>'] = cmp.mapping(require('cmp').mapping.scroll_docs(4)),
		['<C-d>'] = function()
			if cmp.visible_docs() then
				cmp.close_docs()
			else
				cmp.open_docs()
			end
		end,
	},

	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'cmp_tabnine' },
		{
			name = 'emmet_vim',
			option = {
				filetypes = { 'html', 'css' },
			},
		},
		{ name = 'rg' },
		{ name = 'async_path' },
		{ name = 'buffer' },
		{ name = 'nvim_lua' },
		{
			name = 'html-css',
			option = {
				enable_on = { 'html' },
				file_extensions = { 'css', 'sass', 'less' },
				style_sheets = {
					'https://cdnjs.cloudflare.com/ajax/libs/sass.js/0.9.2/sass.min.js',
					-- More Sources{{{
					-- 'https://unpkg.com/tailwindcss-jit-cdn',
					-- 'https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css',
					-- 'https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css',
					-- 'https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css',
					-- }}}
				},
			},
		},
	},

	formatting = {
		fields = { 'kind', 'abbr', 'menu' },
		format = function(entry, vim_item)
			-- Kind Menu Alt{{{
			-- vim_item.kind = require('lspkind').symbolic(vim_item.kind, { mode = 'symbol_text' })
			-- local kind = require('lspkind').cmp_format { mode = 'symbol_text' }(entry, vim_item)
			-- local strings = vim.split(kind.kind, '%s', { trimempty = true })
			-- kind.kind = ' ' .. (strings[1] or '') .. ' '
			-- kind.menu = ' ' .. (strings[2] or '') .. ' '
			-- }}}

			vim_item.kind = string.format(' %s ', icons[vim_item.kind])

			vim_item.menu = ({
				nvim_lsp = 'nvim-lsp',
				luasnip = 'snippet',
				cmp_tabnine = 'tabnine',
				emmet_vim = 'emmet',
				buffer = 'buffer',
				async_path = 'async-path',
				rg = 'ripgrep',
				nvim_lua = 'nvim-lua',
			})[entry.source.name]

			-- Default Tabnine Menu{{{
			-- if entry.source.name == 'cmp_tabnine' then
			-- 	local detail = (entry.completion_item.labelDetails or {}).detail

			-- 	vim_item.kind = '⌬ Tabnine'
			-- 	if detail and detail:find '.*%%.*' then
			-- 		vim_item.kind = vim_item.kind .. ' ' .. detail
			-- 	end

			-- 	if (entry.completion_item.data or {}).multiline then
			-- 		vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
			-- 	end
			-- end
			-- }}}

			if entry.source.name == 'cmp_tabnine' then
				vim_item.kind = ' ⌬ ' -- ⌬ 
			end

			if entry.source.name == 'emmet_vim' then
				vim_item.kind = '  ' -- 󰌝  󱓞  󱣱
			end

			if entry.source.name == 'html-css' then
				vim_item.kind = '  '
				vim_item.menu = entry.completion_item.menu
			end

			return vim_item
		end,
	},

	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,

			function(entry1, entry2)
				local _, entry1_under = entry1.completion_item.label:find '^_+'
				local _, entry2_under = entry2.completion_item.label:find '^_+'
				entry1_under = entry1_under or 0
				entry2_under = entry2_under or 0
				if entry1_under > entry2_under then
					return false
				elseif entry1_under < entry2_under then
					return true
				end
			end,

			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},

	window = {
		completion = {
			border = 'none',
			col_offset = 0,
			side_padding = 0,
			scrollbar = true,
		},
		documentation = {
			border = 'none',
			col_offset = 0,
			side_padding = 0,
			scrollbar = true,
			winhighlight = 'NormalFloat:TelescopeNormal,FloatBorder:TelescopeBorder',
			-- winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder',
		},
	},

	experimental = { ghost_text = true },
	view = {
		docs = {
			auto_open = false,
		},
		-- entries = {
		-- 	name = 'custom',
		-- 	selection_order = 'near_cursor',
		-- },
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
