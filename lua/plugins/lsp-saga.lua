return {
	-- https://github.com/glepnir/lspsaga.nvim
	'glepnir/lspsaga.nvim',
	event = 'LspAttach',
	config = function()
		require('lspsaga').setup {
			finder = {
				keys = {
					edit = 'l',
					vsplit = 'v',
					split = 's',
					tabe = 't',
				},
			},
			definition = {
				edit = '<C-o>',
				vsplit = '<C-v>',
				split = '<C-s>',
				tabe = '<C-t>',
			},
			diagnostic = {
				on_insert = true,
				on_insert_follow = false,
				show_virt_line = true,
				text_hl_follow = true,
				keys = {
					exec_action = 'o',
					quit = 'q',
					go_action = 'g',
				},
			},
			rename = {
				quit = 'q',
				exec = '<CR>',
				in_select = true,
				whole_project = false,
			},
			outline = {
				win_width = 40,
				auto_preview = false,
				auto_close = false,
				keys = {
					jump = 'l',
					expand_collapse = 'h',
					quit = 'q',
				},
			},
			callhierarchy = {
				show_detail = true,
				keys = { vsplit = 'v', split = 's', jump = 'n' },
			},
			symbol_in_winbar = {
				enable = false,
				separator = ' ',
				hide_keyword = true,
				show_file = true,
				folder_level = 3,
				respect_root = false,
				color_mode = true,
			},
			beacon = {
				enable = true,
				frequency = 5,
			},
			ui = {
				title = false,
				border = 'single',
				expand = '▸',
				collaspe = '▾',
				code_action = '',
				diagnostic = ' ',
				colors = {
					normal_bg = '#191726',
					title_bg = '#191726',
					red = '#ff757f',
					magenta = '#c099ff',
					orange = '#ff966c',
					yellow = '#ffc777',
					green = '#c3e88d',
					cyan = '#86e1fc',
					blue = '#7ca1f2',
					purple = '#fca7ea',
					white = '#c8d3f5',
					black = '#191726',
				},
			},
		}
	end,
}
