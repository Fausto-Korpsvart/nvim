return {
	'windwp/nvim-autopairs',
	event = 'InsertEnter',
	config = function()
		require('nvim-autopairs').setup {
			disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
			disable_in_macro = true,
			disable_in_visualblock = false,
			disable_in_replace_mode = true,
			ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
			enable_moveright = true,
			enable_afterquote = true,
			enable_check_bracket_line = true,
			enable_bracket_in_quote = true,
			enable_abbr = false,
			break_undo = true,
			check_ts = false,
			map_cr = true,
			map_bs = true,
			map_c_h = false,
			map_c_w = false,
		}
	end,
}

--  ultimate-autopair{{{
-- return {
-- 	'altermo/ultimate-autopair.nvim',
-- 	branch = 'v0.6',
-- 	event = 'VeryLazy',
-- 	init = function()
-- 		require('ultimate-autopair').setup {
-- 			profile = 'default',
-- 			map = true,
-- 			cmap = true,
-- 			pair_map = true,
-- 			pair_cmap = true,
-- 			multiline = true,
-- 			bs = {
-- 				enable = true,
-- 				map = '<bs>',
-- 				cmap = '<bs>',
-- 				overjumps = true,
-- 				space = true,
-- 				indent_ignore = false,
-- 				single_delete = false,
-- 				conf = {},
-- 				multi = false,
-- 			},
-- 			cr = {
-- 				enable = true,
-- 				map = '<cr>',
-- 				autoclose = false,
-- 				conf = { cond = function(fn) return not fn.in_lisp() end },
-- 				multi = false,
-- 			},
-- 			space = {
-- 				enable = true,
-- 				map = ' ',
-- 				cmap = ' ',
-- 				check_box_ft = { 'markdown', 'vimwiki', 'org' },
-- 				_check_box_ft2 = { 'norg' },
-- 				conf = {},
-- 				multi = false,
-- 			},
-- 			space2 = {
-- 				enable = false,
-- 				match = [[\k]],
-- 				conf = {},
-- 				multi = false,
-- 			},
-- 			fastwarp = {
-- 				enable = true,
-- 				enable_normal = true,
-- 				enable_reverse = true,
-- 				hopout = false,
-- 				map = '<A-e>',
-- 				rmap = '<A-E>',
-- 				cmap = '<A-e>',
-- 				rcmap = '<A-E>',
-- 				multiline = true,
-- 				nocursormove = true,
-- 				do_nothing_if_fail = true,
-- 				no_filter_nodes = { 'string', 'raw_string', 'string_literals', 'character_literal' },
-- 				faster = false,
-- 				conf = {},
-- 				multi = false,
-- 			},
-- 			close = {
-- 				enable = true,
-- 				map = '<A-)>',
-- 				cmap = '<A-)>',
-- 				conf = {},
-- 				multi = false,
-- 				do_nothing_if_fail = true,
-- 			},
-- 			tabout = {
-- 				enable = false,
-- 				map = '<A-tab>',
-- 				cmap = '<A-tab>',
-- 				conf = {},
-- 				multi = false,
-- 				hopout = false,
-- 				do_nothing_if_fail = true,
-- 			},
-- 			extensions = {
-- 				cmdtype = { skip = { '/', '?', '@', '-' }, p = 100 },
-- 				filetype = { p = 90, nft = { 'TelescopePrompt' }, tree = true },
-- 				escape = { filter = true, p = 80 },
-- 				utf8 = { p = 70 },
-- 				tsnode = {
-- 					p = 60,
-- 					separate = {
-- 						'comment',
-- 						'string',
-- 						'char',
-- 						'character',
-- 						'raw_string', --fish/bash/sh
-- 						'char_literal',
-- 						'string_literal', --c/cpp
-- 						'string_value', --css
-- 						'str_lit',
-- 						'char_lit', --clojure/commonlisp
-- 						'interpreted_string_literal',
-- 						'raw_string_literal',
-- 						'rune_literal', --go
-- 						'quoted_attribute_value', --html
-- 						'template_string', --javascript
-- 						'LINESTRING',
-- 						'STRINGLITERALSINGLE',
-- 						'CHAR_LITERAL', --zig
-- 						'string_literals',
-- 						'character_literal',
-- 						'line_comment',
-- 						'block_comment',
-- 						'nesting_block_comment', --d #62
-- 					},
-- 				},
-- 				cond = { p = 40, filter = true },
-- 				alpha = { p = 30, filter = false, all = false },
-- 				suround = { p = 20 },
-- 				fly = {
-- 					other_char = { ' ' },
-- 					nofilter = false,
-- 					p = 10,
-- 					undomapconf = {},
-- 					undomap = nil,
-- 					undocmap = nil,
-- 					only_jump_end_pair = false,
-- 				},
-- 			},
-- 			internal_pairs = {
-- 				{ '[', ']', fly = true, dosuround = true, newline = true, space = true },
-- 				{ '(', ')', fly = true, dosuround = true, newline = true, space = true },
-- 				{ '{', '}', fly = true, dosuround = true, newline = true, space = true },
-- 				{ '"', '"', suround = true, multiline = false },
-- 				{
-- 					"'",
-- 					"'",
-- 					suround = true,
-- 					cond = function(fn) return not fn.in_lisp() or fn.in_string() end,
-- 					alpha = true,
-- 					nft = { 'tex' },
-- 					multiline = false,
-- 				},
-- 				{
-- 					'`',
-- 					'`',
-- 					cond = function(fn) return not fn.in_lisp() or fn.in_string() end,
-- 					nft = { 'tex' },
-- 					multiline = false,
-- 				},
-- 				{ '``', "''", ft = { 'tex' } },
-- 				{ '```', '```', newline = true, ft = { 'markdown' } },
-- 				{ '<!--', '-->', ft = { 'markdown', 'html' } },
-- 				{ '"""', '"""', newline = true, ft = { 'python' } },
-- 				{ "'''", "'''", newline = true, ft = { 'python' } },
-- 			},
-- 			config_internal_pairs = {
-- 				--configure internal pairs
-- 				--example:
-- 				-- { '{', '}', suround = true },
-- 			},
-- 		}
-- 	end,
-- }
--}}}
