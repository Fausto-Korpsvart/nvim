return {
	{
		'nvim-lua/plenary.nvim',
		event = 'VeryLazy',
	},

	{
		'kyazdani42/nvim-web-devicons',
	},

	{
		'kevinhwang91/nvim-bqf',
		event = 'VeryLazy',
		config = function()
			require('bqf').setup {
				auto_enable = true,
				auto_resize_height = true, -- highly recommended enable
				preview = {
					win_height = 15,
					win_vheight = 15,
					delay_syntax = 80,
					border = 'single', -- { '┏', '━', '┓', '┃', '┛', '━', '┗', '┃' },
					show_title = true,
					winblend = 0,
					should_preview_cb = function(bufnr)
						local ret = true
						local bufname = vim.api.nvim_buf_get_name(bufnr)
						local fsize = vim.fn.getfsize(bufname)
						if fsize > 100 * 1024 then
							-- skip file size greater than 100k
							ret = false
						end
						return ret
					end,
				},
				-- make `drop` and `tab drop` to become preferred
				func_map = {
					split = '<C-h>',
					vplit = '<C-v>',
					pscrollup = '<C-e>',
					pscrolldown = '<C-d>',
					ptogglemode = 'z,',
					drop = 'o',
					openc = 'O',
				},
			}
		end,
	},

	{
		'NvChad/nvim-colorizer.lua',
		event = 'BufReadPre',
		config = function()
			require('colorizer').setup {
				filetypes = { '*' },
				user_default_options = {
					mode = 'background',
					RGB = true,
					RRGGBB = true,
					names = true,
					RRGGBBAA = true,
					AARRGGBB = true,
					rgb_fn = true,
					hsl_fn = true,
					css = true,
					css_fn = true,
					tailwind = { enable = true, parsers = { 'css' } },
					sass = { enable = true, parsers = { 'css' } },
				},
			}
		end,
	},

	{
		'numToStr/Comment.nvim',
		event = 'VeryLazy',
		config = function()
			require('Comment').setup {
				ignore = '^$',
				-- pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
			}

			vim.keymap.set('n', '<Leader>;', '<Plug>(comment_toggle_linewise_current)')
			vim.keymap.set('x', '<Leader>;', '<Plug>(comment_toggle_blockwise_visual)')
			vim.keymap.set('x', "<Leader>'", '<Plug>(comment_toggle_linewise_visual)')
		end,
	},

	{
		'kqito/vim-easy-replace',
		event = 'VeryLazy',
		config = function()
			vim.g.easy_replace_highlight_ctermbg = 'lightblue'
			vim.g.easy_replace_highlight_guibg = '#c53b53'

			vim.keymap.set('n', 'wr', '<CMD>EasyReplaceWord<CR>')
			vim.keymap.set('n', 'rw', '<CMD>EasyReplaceCword<CR>')
			vim.keymap.set('v', 'wr', '<CMD>EasyReplaceWordInVisual<CR>')
			vim.keymap.set('v', 'rw', '<CMD>EasyReplaceCwordInVisual<CR>')
		end,
	},

	{
		'ellisonleao/glow.nvim',
		event = 'VeryLazy',
		config = function()
			require('glow').setup {
				border = 'single',
				style = 'dark',
				width = 150,
				height = 150,
			}

			vim.keymap.set('n', 'gl', '<CMD>Glow<CR>')
			vim.keymap.set('n', 'cg', '<CMD>Glow!<CR>')
		end,
	},

	{
		'kevinhwang91/nvim-hlslens',
		event = 'VeryLazy',
		config = function()
			require('hlslens').setup {
				override_lens = function(render, posList, nearest, idx, relIdx)
					local sfw = vim.v.searchforward == 1
					local indicator, text, chunks
					local absRelIdx = math.abs(relIdx)
					if absRelIdx > 1 then
						indicator = ('%d%s'):format(
							absRelIdx,
							sfw ~= (relIdx > 1) and '▲' or '▼'
						)
					elseif absRelIdx == 1 then
						indicator = sfw ~= (relIdx == 1) and '▲' or '▼'
					else
						indicator = ''
					end

					local lnum, col = unpack(posList[idx])
					if nearest then
						local cnt = #posList
						if indicator ~= '' then
							text = ('[%s %d/%d]'):format(indicator, idx, cnt)
						else
							text = ('[%d/%d]'):format(idx, cnt)
						end
						chunks = { { ' ' }, { text, 'HlSearchLensNear' } }
					else
						text = ('[%s %d]'):format(indicator, idx)
						chunks = { { ' ' }, { text, 'HlSearchLens' } }
					end
					render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
				end,
			}
		end,
	},

	{
		'm4xshen/hardtime.nvim',
		event = 'VeryLazy',
		config = function()
			require('hardtime').setup {
				disable_mouse = false,
				disabled_filetypes = {
					'plenary',
					'TelescopePrompt',
					'alpha',
					'checkhealth',
					'dapui*',
					'Diffview*',
					'Dressing*',
					'help',
					'httpResult',
					'lazy',
					'mason',
					'neo-tree',
					'netrw',
					'prompt',
					'qf',
					'trouble',
					'fugit2',
					'Fugit2',
					'Fugit2Graph',
					'nui',
					'Outline',
				},
				disabled_keys = {
					['<Up>'] = {},
					['<Down>'] = {},
					['<Left>'] = {},
					['<Right>'] = {},
				},
			}
		end,
		vim.keymap.set('n', '<Leader>ht', '<CMD>Hardtime toggle<CR>'),
	},

	{
		'aurum77/live-server.nvim',
		event = 'VeryLazy',
		config = function()
			require('live_server.util').install()
			require('live_server').setup {
				port = 8080,
				browser_command = '',
				quiet = false,
				no_css_inject = true,
				-- install_path = vim.fn.stdpath 'config' .. '/live-server/',
			}

			vim.keymap.set('n', '<Leader>ls', '<CMD>LiveServer<CR>')
			vim.keymap.set('n', '<Leader>ssj', '<CMD>LiveServerStop<CR>')
		end,
	},

	{
		'iamcco/markdown-preview.nvim',
		cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
		ft = { 'markdown' },
		event = 'VeryLazy',
		lazy = 'true',
		build = function() vim.fn['mkdp#util#install']() end,
		config = function()
			vim.g.mkdp_auto_close = 0
			vim.g.mkdp_refresh_slow = 1
			vim.g.mkdp_theme = 'dark'

			vim.keymap.set('n', '<Leader>mm', '<CMD>MarkdownPreview<CR>')
			vim.keymap.set('n', '<Leader>sm', '<CMD>MarkdownPreviewStop<CR>')
			vim.keymap.set('n', '<Leader>mt', '<CMD>MarkdownPreviewToggle<CR>')
		end,
	},

	{
		'andymass/vim-matchup',
		branch = 'master',
		event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
		config = function()
			vim.g.matchup_matchparen_offscreen = {
				method = 'popup',
				fullwidth = 0,
				syntax_hl = 1,
				highlight = 'OffscreenPopup',
			}

			vim.g.matchup_matchparen_enabled = 1
			vim.g.matchup_matchparen_deferred = 0
			vim.g.matchup_matchparen_hi_surround_always = 1

			vim.keymap.set('n', '<Leader>m', '<PLUG>(matchup-%)')
			vim.keymap.set('n', '<Leader>h', '<PLUG>(matchup-g%)')
			vim.keymap.set('n', '<Leader>[', '<PLUG>(matchup-[%)')
			vim.keymap.set('n', '<Leader>]', '<PLUG>(matchup-]%)')
			vim.keymap.set('n', '<Leader>z', '<PLUG>(matchup-z%)')
			vim.keymap.set('n', '<Leader>wa', '<CMD>MatchupWhereAmI??<CR>')
			vim.keymap.set('n', '<Leader>aw', '<CMD>MatchupWhereAmI?<CR>')
		end,
	},

	{
		'2kabhishek/nerdy.nvim',
		event = 'VeryLazy',
		cmd = 'Nerdy',
	},

	{
		'tyru/open-browser.vim',
		event = 'VeryLazy',
		config = function()
			vim.g.openbrowser_default_search = 'brave'
			vim.g.openbrowser_fix_hosts = { ['google.com'] = 'search.brave.com' }
			vim.g.openbrowser_fix_schemes = { ['http'] = 'https' }
			vim.g.openbrowser_search_engines = {
				['brave'] = 'https://search.brave.com/search?q={query}',
				['fedora'] = 'https://fedoramagazine.org/search?q={query}',
				['neovim'] = 'https://neovim.io/',
				['github'] = 'https://github.com/search?q={query}',
				['python'] = 'https://docs.python.org/dev/search.html?q={query}&check_keywords=yes&area=default',
				['devdocs'] = 'https://devdocs.io/#q={query}',
				['fileformat'] = 'https://www.fileformat.info/info/unicode/char/{query}/',
			}

			vim.keymap.set('n', '<Leader>ob', '<Plug>(openbrowser-open)<CR>')
			vim.keymap.set('n', '<Leader>sw', '<Plug>(openbrowser-search) <cword><CR>')
			vim.keymap.set('n', '<Leader>sb', '<Plug>(openbrowser-smart-search)<CR>')
		end,
	},

	{
		'vuki656/package-info.nvim',
		event = 'BufEnter',
		dependencies = {
			{ 'MunifTanjim/nui.nvim', lazy = true },
		},
		config = function()
			require('package-info').setup {
				colors = {
					up_to_date = '#3C4048',
					outdated = '#d19a66',
				},
				icons = {
					enable = true,
					style = {
						up_to_date = '|  ',
						outdated = '|  ',
					},
				},
				autostart = true,
				hide_up_to_date = false,
				hide_unstable_versions = false,
				package_manager = 'npm',
			}

			vim.keymap.set(
				{ 'n' },
				'<Leader>ns',
				require('package-info').show,
				{ silent = true, noremap = true }
			)

			vim.keymap.set(
				{ 'n' },
				'<Leader>nc',
				require('package-info').hide,
				{ silent = true, noremap = true }
			)

			vim.keymap.set(
				{ 'n' },
				'<Leader>nt',
				require('package-info').toggle,
				{ silent = true, noremap = true }
			)

			vim.keymap.set(
				{ 'n' },
				'<Leader>nu',
				require('package-info').update,
				{ silent = true, noremap = true }
			)

			vim.keymap.set(
				{ 'n' },
				'<Leader>nd',
				require('package-info').delete,
				{ silent = true, noremap = true }
			)

			vim.keymap.set(
				{ 'n' },
				'<Leader>ni',
				require('package-info').install,
				{ silent = true, noremap = true }
			)

			vim.keymap.set(
				{ 'n' },
				'<Leader>np',
				require('package-info').change_version,
				{ silent = true, noremap = true }
			)
		end,
	},

	{
		'dstein64/nvim-scrollview',
		event = 'VimEnter',
		init = function()
			require('scrollview').setup {
				current_only = true,
				base = 'auto', -- right, buffer
				column = 1,
				hover = true,
				winblend = 80,
				-- winblend_gui = 40,
				zindex = 40,

				signs_column = 0,
				signs_max_per_row = 1,
				signs_overflow = 'left', -- right
				signs_show_in_folds = true,
				signs_on_startup = { 'diagnostics', 'search', 'folds' }, -- all, false

				-- Scroll Signs
				diagnostics_error_symbol = { '·', '⠊', '⠋' },
				diagnostics_warn_symbol = { '·', '⠊', '⠋' },
				diagnostics_hint_symbol = { '·', '⠊', '⠋' },
				diagnostics_info_symbol = { '·', '⠊', '⠋' },
				folds_symbol = '·',
				search_symbol = '·',

				excluded_filetypes = { 'alpha' },
			}

			vim.keymap.set('n', '<Leader>sv', '<CMD>ScrollViewToggle<CR>')
			vim.keymap.set('n', '<Leader>svf', '<CMD>ScrollViewFirst<CR>')
			vim.keymap.set('n', '<Leader>svl', '<CMD>ScrollViewLast<CR>')
			vim.keymap.set('n', '<Leader>svn', '<CMD>ScrollViewNext<CR>')
			vim.keymap.set('n', '<Leader>svp', '<CMD>ScrollViewPrev<CR>')
		end,
	},

	{
		'michaelb/sniprun',
		event = 'VeryLazy',
		build = 'sh install.sh',
		config = function()
			require('sniprun').setup {
				display = { 'VirtualTextOk' }, -- VirtualText tempfloatingwindow
				live_display = { 'VirtualTextOk', 'VirtualTextErr' },
				display_options = { terminal_width = 40 },
			}

			vim.keymap.set('n', 'sr', '<Plug>SnipRun')
			vim.keymap.set('v', 'sr', '<Plug>SnipRun')
			vim.keymap.set('n', 'sc', '<Plug>SnipClose')
			vim.keymap.set('n', 'sro', '<Plug>SnipRunOperator')
			vim.keymap.set('v', 'sro', '<Plug>SnipRunOperator')
		end,
	},

	{
		'cshuaimin/ssr.nvim',
		event = 'VeryLazy',
		config = function()
			require('ssr').setup {
				border = 'single',
				min_width = 50,
				min_height = 5,
				max_width = 120,
				max_height = 25,
				adjust_window = true,
				keymaps = {
					close = 'q',
					next_match = 'n',
					prev_match = 'N',
					replace_confirm = '<cr>',
					replace_all = '<leader><cr>',
				},
			}

			vim.keymap.set({ 'n', 'x' }, '<leader>sr', function() require('ssr').open() end)
		end,
	},

	{
		'luukvbaal/statuscol.nvim',
		event = 'VimEnter',
		config = function()
			require('statuscol').setup {
				setopt = true,
				relculright = true,
				ft_ignore = {
					'alpha',
					'DiffviewFiles',
					'help',
					'lazy',
					'lazyterm',
					'Lazy',
					'LazyVim',
					'Mundo',
					'NeogitStatus',
					'neo-tree',
					'Outline',
					'toggleterm',
					'TSPlayground',
					'trouble',
					'tagbar',
					'undotree',
				},
				bt_ignore = {
					'TSPlayground',
				},
				clickmod = 'c',
				segments = {
					{
						text = {
							require('statuscol.builtin').foldfunc,
						},
						click = 'v:lua.ScFa',
					},
					{
						text = {
							require('statuscol.builtin').lnumfunc,
							' │',
						},
						click = 'v:lua.ScFa',
					},
				},
			}
		end,
	},

	{
		'christoomey/vim-tmux-navigator',
	},

	{
		'akinsho/toggleterm.nvim',
		event = 'VeryLazy',
		version = '*',
		config = function()
			require('toggleterm').setup {
				-- size = 15,
				size = function(term)
					if term.direction == 'horizontal' then
						return 15
					elseif term.direction == 'vertical' then
						return vim.o.columns * 0.3
					end
				end,
			}

			vim.keymap.set('n', '<Leader>ft', '<CMD>ToggleTerm direction=float<CR>')
			vim.keymap.set('n', '<Leader>tt', '<CMD>1ToggleTerm direction=horizontal<CR>')
			vim.keymap.set('n', '<Leader>t2', '<CMD>2ToggleTerm direction=horizontal<CR>')
			vim.keymap.set('n', '<Leader>t3', '<CMD>3ToggleTerm direction=horizontal<CR>')
			vim.keymap.set('n', '<Leader>vt', '<CMD>4ToggleTerm direction=vertical<CR>')
			vim.keymap.set('n', '<Leader>v2', '<CMD>5ToggleTerm direction=vertical<CR>')
			vim.keymap.set('n', '<Leader>v3', '<CMD>6ToggleTerm direction=vertical<CR>')
		end,
	},

	{
		'folke/todo-comments.nvim',
		event = 'VeryLazy',
		config = function()
			local fix = '#db4b4b'
			local hack = '#ff9e64'
			local note = '#1abc9c'
			local todo = '#0db9d7'
			local warn = '#ffc777'
			local perf = '#bb9af7'
			local test = '#3e68d7'

			require('todo-comments').setup {
				keywords = {
					FIX = { icon = '', color = fix },
					HACK = { icon = '', color = hack },
					NOTE = { icon = '󱇗', color = note },
					PERF = { icon = '󰾅', color = perf },
					TODO = { icon = '', color = todo },
					WARN = { icon = '', color = warn },
					TEST = { icon = '󰙨', color = test },
				},
			}

			vim.keymap.set('n', 'to', '<CMD>TodoTrouble<CR>')
			vim.keymap.set('n', 'tk', '<CMD>TodoLocList<CR>')
			vim.keymap.set(
				'n',
				'nt',
				function() require('todo-comments').jump_next() end,
				{ desc = 'Next todo comment' }
			)
			vim.keymap.set(
				'n',
				'pt',
				function() require('todo-comments').jump_prev() end,
				{ desc = 'Prev todo comment' }
			)
		end,
	},

	{
		'folke/trouble.nvim',
		event = 'VeryLazy',
		config = function()
			require('trouble').setup {
				modes = {
					diagnostics = {
						focus = true,
						preview = {
							type = 'split',
							relative = 'win',
							position = 'right',
							size = 0.5,
						},
					},
					todo = {
						focus = true,
						preview = {
							type = 'split',
							relative = 'win',
							position = 'right',
							size = 0.5,
						},
					},
					symbols = {
						focus = true,
						win = {
							position = 'bottom',
						},
						preview = {
							type = 'split',
							relative = 'win',
							position = 'right',
							size = 0.5,
						},
					},
					lsp = {
						focus = true,
						preview = {
							type = 'split',
							relative = 'win',
							position = 'right',
							size = 0.5,
						},
					},
				},
			}

			vim.keymap.set('n', 'td', '<CMD>Trouble diagnostics toggle<CR>')
			vim.keymap.set('n', 'to', '<CMD>Trouble todo toggle filter.buf=0<CR>')
			vim.keymap.set('n', 'tg', '<CMD>Trouble todo toggle<CR>')
			vim.keymap.set('n', 'ts', '<CMD>Trouble symbols toggle<CR>')
			vim.keymap.set('n', 'tl', '<CMD>Trouble lsp toggle<CR>')
		end,
	},

	{
		'mg979/vim-visual-multi',
		branch = 'master',
		event = 'BufEnter',
		mame = 'multicursor',
		init = function()
			vim.g.VM_mouse_mappings = 1
			vim.g.VM_theme_set_by_colorscheme = 1
			vim.g.VM_highlight_matches = 'red'
			vim.g.VM_set_statusline = 3
			vim.g.VM_quit_after_leaving_insert_mode = 1
			vim.g.VM_verbose_commands = 1
			vim.g.VM_skip_empty_lines = 1
			vim.g.VM_case_setting = 'sensitive'
			vim.g.VM_disable_syntax_in_imode = 0
			vim.g.VM_custom_remaps = { ['q'] = '<Esc>' }
			vim.g.VM_maps = {
				['Find Prev'] = 'p',
				['Goto Next'] = ']',
				['Goto Prev'] = '[',
				['Select Cursor Up'] = '<C-S-k>',
				['Select Cursor Down'] = '<C-S-j>',
				['Align'] = 'A',
				['Numbers'] = '1',
				['Numbers Append'] = '2',
				['Zero Numbers'] = '3',
				['Zero Numbers Append'] = '4',
				['Duplicate'] = '5',
				['Visual Subtract'] = '6',
				['Tools Menu'] = '7',
				['Skip Region'] = 'Q',
				['Remove Region'] = 'R',
				['Remove Last Region'] = 'qr',
				['Merge Regions'] = 'mg',
				['Shrink'] = '_',
				['Enlarge'] = '+',
				['Start Regex Search'] = 'sr',
				['Visual Find'] = 'f',
				['Visual Cursors'] = 'C',
				-- Menu
				['Case Conversion Menu'] = 'cc',
				['Search Menu'] = 'ss',
				-- Toogles
				-- ['Toggle Block'] = '<BS>',
				-- ['Toggle Single Region'] = '<CR>',
				-- ['Toggle Multiline'] = 'M',
			}
		end,
	},

	{
		'anuvyklack/windows.nvim',
		event = 'VeryLazy',
		dependencies = { 'anuvyklack/middleclass' },
		config = function()
			vim.o.winwidth = 10
			vim.o.winminwidth = 10
			vim.o.equalalways = true

			require('windows').setup {
				autowidth = {
					enable = true,
					winwidth = 0,
					filetype = {
						help = 2,
					},
				},
				ignore = {
					buftype = { 'quickfix', 'toggleterm', 'terminal' },
					filetype = { 'neo-tree', 'toggleterm', 'terminal' },
				},
				animation = {
					enable = false,
					duration = 100,
					fps = 60,
					easing = 'in_out_sine',
				},
			}

			vim.keymap.set('n', '<Leader>wt', '<CMD>WindowsToggleAutowidth<CR>')
			vim.keymap.set('n', '<Leader>ew', '<CMD>WindowsEnableAutowidth<CR>')
			vim.keymap.set('n', '<Leader>dw', '<CMD>WindowsDisableAutowidth<CR>')
			vim.keymap.set('n', '<Leader>we', '<CMD>WindowsEqualize<CR>')
			vim.keymap.set('n', '<Leader>wm', '<CMD>WindowsMaximize<CR>')
			vim.keymap.set('n', '<Leader>wv', '<CMD>WindowsMaximizeVertically<CR>')
			vim.keymap.set('n', '<Leader>wh', '<CMD>WindowsMaximizeHorizontally<CR>')
		end,
	},

	-- Local Plugins{{{
	--[[ {
		dir = '~/korpsvart/nvim-plugins/search_replace.nvim',
		event = 'VeryLazy',
		keys = {
			{ 'sr', '<cmd>SearchReplaceString<cr>', desc = 'Search & Replace String' },
			{ 'cs', '<cmd>SearchReplaceCode<cr>', desc = 'Search & Replace Code' },
			{ 'sw', '<cmd>SearchForString<cr>', desc = 'Search for String' },
			{ 'rw', '<cmd>ChangeCurrentString<cr>', desc = 'Replace Current String' },
		},
		config = function() require 'search_replace' end,
	}, ]]
	-- }}}
}
