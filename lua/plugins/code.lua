return {
	{
		-- https://github.com/windwp/nvim-autopairs
		'windwp/nvim-autopairs',
		event = 'VeryLazy',
		config = function()
			require('nvim-autopairs').setup {
				check_ts = true,
				ts_config = {
					lua = { 'string', 'source' },
					javascript = { 'string', 'template_string' },
				},
				disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
			}
			require('cmp').event:on(
				'confirm_done',
				require('nvim-autopairs.completion.cmp').on_confirm_done { map_char = { tex = '' } }
			)
		end,
	},
	{
		-- https://github.com/numToStr/Comment.nvim
		'numToStr/Comment.nvim',
		event = 'VeryLazy',
		keys = {
			vim.keymap.set('n', '<Leader>;', '<Plug>(comment_toggle_linewise_current)'),
			vim.keymap.set('x', '<Leader>;', '<Plug>(comment_toggle_linewise_visual)'),
			vim.keymap.set('x', '<Leader>l', '<Plug>(comment_toggle_blockwise_visual)'),
		},
		config = function()
			require('Comment').setup {
				ignore = '^$',
				pre_hook = function()
					require('ts_context_commentstring.internal').update_commentstring {}
				end,
			}
			require('Comment.ft').set('json', { '// %s', '/* %s */' })
		end,
	},
	{
		-- https://github.com/kqito/vim-easy-replace
		'kqito/vim-easy-replace',
		event = 'BufEnter',
		keys = {
			vim.keymap.set('n', 'wr', '<CMD>EasyReplaceWord<CR>'),
			vim.keymap.set('n', 'rw', '<CMD>EasyReplaceCword<CR>'),
			vim.keymap.set('v', 'wr', '<CMD>EasyReplaceWordInVisual<CR>'),
			vim.keymap.set('v', 'rw', '<CMD>EasyReplaceCwordInVisual<CR>'),
		},
		config = function()
			vim.g.easy_replace_highlight_ctermbg = 'lightgreen'
			vim.g.easy_replace_highlight_guibg = '#c53b53'
		end,
	},
	{
		-- https://github.com/mattn/emmet-vim
		'mattn/emmet-vim',
		event = 'VeryLazy',
		keys = {
			vim.keymap.set('i', '/a', '<Plug>(emmet-expand-abbr)'),
			vim.keymap.set('i', '/w', '<Plug>(emmet-expand-word)'),
			vim.keymap.set('i', '/n', '<Plug>(emmet-move-next)'),
			vim.keymap.set('i', '/b', '<Plug>(emmet-move-prev)'),
			vim.keymap.set('n', 'eut', '<Plug>(emmet-update-tag)'),
			vim.keymap.set('n', 'bti', '<Plug>(emmet-balance-tag-inward)'),
			vim.keymap.set('n', 'etc', '<Plug>(emmet-toggle-comment)'),
			vim.keymap.set('n', 'ert', '<Plug>(emmet-remove-tag)'),
			vim.keymap.set('n', 'eau', '<Plug>(emmet-anchorize-url)'),
			vim.keymap.set('n', 'eas', '<Plug>(emmet-anchorize-summary)'),
			vim.keymap.set('n', 'eml', '<Plug>(emmet-merge-lines)'),
		},
		config = function()
			vim.g.user_emmet_mode = 'a'
			vim.g.user_emmet_install_global = 0
			vim.cmd [[autocmd FileType html,css EmmetInstall]]
			vim.g.user_emmet_settings = {
				html = {
					filters = 'html,t',
				},
			}
		end,
	},
	{
		-- https://github.com/aurum77/live-server.nvim
		'aurum77/live-server.nvim',
		event = 'VeryLazy',
		keys = {
			vim.keymap.set('n', 'ss', '<CMD>LiveServerStart<CR>'),
			vim.keymap.set('n', 'SS', '<CMD>LiveServerStop<CR>'),
		},
		config = function()
			require('live_server.util').install()
			require('live_server').setup {}
		end,
		cmd = { 'LiveServer', 'LiveServerStart', 'LiveServerStop' },
	},
	{
		-- https://github.com/iamcco/markdown-preview.nvi
		'iamcco/markdown-preview.nvim',
		event = 'VeryLazy',
		keys = {
			vim.keymap.set('n', 'mm', '<CMD>MarkdownPreview<CR>'),
			vim.keymap.set('n', 'sm', '<CMD>MarkdownPreviewStop<CR>'),
			vim.keymap.set('n', 'mt', '<CMD>MarkdownPreviewToggle<CR>'),
		},
		build = function()
			vim.fn['mkdp#util#install']()
		end,
		ft = 'markdown',
	},
	{
		-- https://github.com/nvim-pack/nvim-spectre
		'windwp/nvim-spectre',
		keys = {
			vim.keymap.set('n', 'os', '<CMD>lua require("spectre").open()<CR>'),
			vim.keymap.set('n', 'sp', '<CMD>lua require("spectre").open_file_search()<CR>'),
		},
		config = function()
			require('spectre').setup {
				line_sep = '',
				line_sep_start = '',
				result_padding = '',
				mapping = {
					['enter_file'] = { map = 'l' },
					['send_to_qf'] = { map = '<leader>sf' },
				},
			}
		end,
	},
	{
		-- https://github.com/tpope/vim-surround
		'tpope/vim-surround',
		event = 'VeryLazy',
		config = function()
			vim.cmd [[
                xmap ' S'
                xmap " S"
                xmap [ S[
                xmap { S{
                xmap ( S(
                ]]
		end,
	},
	{
		-- https://github.com/mg979/vim-visual-multi
		'mg979/vim-visual-multi',
		branch = 'master',
		event = 'VeryLazy',
		config = function()
			vim.cmd [[
                " Settings
                let g:VM_set_statusline = 3
                let g:VM_quit_after_leaving_insert_mode = 1
                let g:VM_verbose_commands = 1
                let g:VM_skip_empty_lines = 1
                let g:VM_case_setting = 'sensitive'
                let g:VM_disable_syntax_in_imode = 1
                " Mappings
                let g:VM_custom_remaps                = {'q': '<Esc>'}
                let g:VM_maps['Find Next']            = 'n'
                let g:VM_maps['Find Prev']            = 'p'
                let g:VM_maps['Goto Next']            = ']'
                let g:VM_maps['Goto Prev']            = '['
                let g:VM_maps["Align"]                = 'A'
                let g:VM_maps["Numbers"]              = '1'
                let g:VM_maps["Numbers Append"]       = '2'
                let g:VM_maps["Zero Numbers"]         = '3'
                let g:VM_maps["Zero Numbers Append"]  = '4'
                let g:VM_maps["Duplicate"]            = '5'
                let g:VM_maps["Visual Subtract"]      = '6'
                let g:VM_maps["Tools Menu"]           = '7'
                let g:VM_maps['Skip Region']          = 'sk'
                let g:VM_maps['Remove Region']        = 'rr'
                let g:VM_maps["Remove Last Region"]   = 'qr'
                let g:VM_maps["Shrink"]               = "_"
                let g:VM_maps["Enlarge"]              = "+"
                " Visual Multi Theme
                if exists(':VMTheme')
                    let g:VM_theme_set_by_colorscheme = 1
                    if &background == 'dark'
                        hi VM_Extend guibg=#545c7e guifg=#eae8ff
                        hi VM_Cursor guibg=#41a6b5 guifg=#16161e
                        hi VM_Insert guibg=#9d7cd8 guifg=#16161e
                        hi VM_Mono   guibg=#c53b53 guifg=#eae8ff
                    endif
                endif
            ]]
		end,
	},
}
