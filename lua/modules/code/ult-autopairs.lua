local upair = require 'ultimate-autopair'
_G.UA_DEV = true
local configs = {
	upair.extend_default {
		space2 = { enable = true },
		bs = {
			space = 'balance',
			indent_ignore = true,
			single_delete = true,
		},
		cr = { autoclose = true },
		fastwarp = {
			multi = true,
			{},
			{
				faster = true,
				map = '<C-A-e>',
				cmap = '<C-A-e>',
				rmap = '<C-A-S-e>',
				rcmap = '<C-A-S-e>',
			},
		},
		tabout = {
			enable = true,
			hopout = true,
		},
		extensions = {
			fly = { nofilter = true },
			cond = {
				cond = function(fn)
					return not fn.in_node { 'comment' }
				end,
			},
		},
		config_internal_pairs = {
			{ '"', '"', fly = true, bs_overjumps = true, multiline = true },
			{ "'", "'", fly = true },
			{ '{', '}', suround = true },
		},
		{ '\\(', '\\)' },
		{
			'>',
			'</',
			disable_start = true,
			disable_end = true,
			backspace = false,
			ft = { 'html' },
		},
	},
	{ profile = require('ultimate-autopair.experimental.terminal').init },
	{ profile = require('ultimate-autopair.experimental.matchpair').init },
	{ profile = require('ultimate-autopair.experimental.addons_.comma_after_table').init },
	{ profile = require('ultimate-autopair.experimental.addons_.fix_ts_endwise').init },
}
require('ultimate-autopair.core').modes = { 'i', 'c', 'n', 't' }
if not upair._check_depreciated(configs[1]) then
	upair.init(configs)
end

-- Default conf {{{
-- require('ultimate-autopair').init = {
-- 	profile = 'default',
-- 	map = true,
-- 	cmap = true,
-- 	pair_map = true,
-- 	pair_cmap = true,
-- 	multiline = true,
-- 	bs = {
-- 		enable = true,
-- 		map = '<bs>',
-- 		cmap = '<bs>',
-- 		overjumps = true,
-- 		space = true,
-- 		indent_ignore = false,
-- 		single_delete = false,
-- 		conf = {},
-- 		multi = false,
-- 	},
-- 	cr = {
-- 		enable = true,
-- 		map = '<cr>',
-- 		autoclose = false,
-- 		conf = {
-- 			cond = function(fn)
-- 				return not fn.in_lisp()
-- 			end,
-- 		},
-- 		multi = false,
-- 	},
-- 	space = {
-- 		enable = true,
-- 		map = ' ',
-- 		cmap = ' ',
-- 		check_box_ft = { 'markdown', 'vimwiki' },
-- 		conf = {},
-- 		multi = false,
-- 	},
-- 	space2 = {
-- 		enable = false,
-- 		match = [[\k]],
-- 		conf = {},
-- 		multi = false,
-- 	},
-- 	fastwarp = {
-- 		enable = true,
-- 		enable_normal = true,
-- 		enable_reverse = true,
-- 		hopout = false,
-- 		map = '<A-e>',
-- 		rmap = '<A-E>',
-- 		cmap = '<A-e>',
-- 		rcmap = '<A-E>',
-- 		multiline = true,
-- 		nocursormove = true,
-- 		do_nothing_if_fail = true,
-- 		no_filter_nodes = { 'string', 'raw_string' },
-- 		faster = false,
-- 		conf = {},
-- 		multi = false,
-- 	},
-- 	close = {
-- 		enable = true,
-- 		map = '<A-)>',
-- 		cmap = '<A-)>',
-- 		conf = {},
-- 		multi = false,
-- 		do_nothing_if_fail = true,
-- 	},
-- 	tabout = {
-- 		enable = true,
-- 		map = '<A-tab>',
-- 		cmap = '<A-tab>',
-- 		conf = {},
-- 		multi = false,
-- 		hopout = false,
-- 		do_nothing_if_fail = true,
-- 	},
-- 	--[[ extensions = {
-- 		cmdtype = { skip = { '/', '?', '@', '-' }, p = 100 },
-- 		filetype = { p = 90, nft = { 'TelescopePrompt' }, tree = true },
-- 		escape = { filter = true, p = 80 },
-- 		utf8 = { p = 70 },
-- 		tsnode = { p = 60, separate = { 'comment', 'string', 'raw_string' } },
-- 		cond = { p = 40, filter = true },
-- 		alpha = { p = 30, filter = false, all = false },
-- 		suround = { p = 20 },
-- 		fly = {
-- 			other_char = { ' ' },
-- 			nofilter = false,
-- 			p = 10,
-- 			undomapconf = {},
-- 			undomap = nil,
-- 			undocmap = nil,
-- 			only_jump_end_pair = false,
-- 		},
-- 	}, ]]
-- 	internal_pairs = {
-- 		{
-- 			'[',
-- 			']',
-- 			fly = true,
-- 			dosuround = true,
-- 			newline = true,
-- 			space = true,
-- 		},
-- 		{
-- 			'(',
-- 			')',
-- 			fly = true,
-- 			dosuround = true,
-- 			newline = true,
-- 			space = true,
-- 		},
-- 		{
-- 			'{',
-- 			'}',
-- 			fly = true,
-- 			dosuround = true,
-- 			newline = true,
-- 			space = true,
-- 		},
-- 		{
-- 			'"',
-- 			'"',
-- 			suround = true,
-- 			multiline = false,
-- 			alpha = {
-- 				'txt',
-- 			},
-- 		},
-- 		{
-- 			"'",
-- 			"'",
-- 			suround = true,
-- 			cond = function(fn)
-- 				return not fn.in_lisp() or fn.in_string()
-- 			end,
-- 			alpha = true,
-- 			nft = {
-- 				'tex',
-- 				'latex',
-- 			},
-- 			multiline = false,
-- 		},
-- 		{ '`', '`', nft = { 'tex', 'latex' }, multiline = false },
-- 		{ '``', "''", ft = { 'tex', 'latex' } },
-- 		{ '```', '```', newline = true, ft = { 'markdown' } },
-- 		{ '<!--', '-->', ft = { 'markdown', 'html' } },
-- 		{ '"""', '"""', newline = true, ft = { 'python' } },
-- 		{ "'''", "'''", newline = true, ft = { 'python' } },
-- 	},
-- 	config_internal_pairs = {
-- 		{ '{', '}', suround = true },
-- 	},
-- }
-- }}}
