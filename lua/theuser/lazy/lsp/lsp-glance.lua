local glance = require 'glance'
local actions = glance.actions

glance.setup {
	height = 15,
	zindex = 45,

	-- detached = true,
	detached = function(winid) return vim.api.nvim_win_get_width(winid) < 100 end,

	preview_win_opts = {
		cursorline = true,
		number = true,
		wrap = true,
	},
	border = {
		enable = true,
		top_char = '―',
		bottom_char = '―',
	},
	list = {
		position = 'right',
		width = 0.40,
	},
	theme = {
		enable = true,
		mode = 'auto',
	},
	mappings = {
		list = {
			['j'] = actions.next,
			['k'] = actions.previous,
			['<Down>'] = actions.next,
			['<Up>'] = actions.previous,
			['<Tab>'] = actions.next_location,
			['<S-Tab>'] = actions.previous_location,
			['e'] = actions.preview_scroll_win(2),
			['d'] = actions.preview_scroll_win(-2),
			['v'] = actions.jump_vsplit,
			['s'] = actions.jump_split,
			['t'] = actions.jump_tab,
			['l'] = actions.jump,
			['o'] = actions.jump,
			['L'] = actions.open_fold,
			['h'] = actions.close_fold,
			['<leader>p'] = actions.enter_win 'preview',
			['q'] = actions.close,
			['Q'] = actions.close,
			['<Esc>'] = actions.close,
			['<C-q>'] = actions.quickfix,
			-- ['<Esc>'] = false -- disable a mapping
		},
		preview = {
			['Q'] = actions.close,
			['<Tab>'] = actions.next_location,
			['<S-Tab>'] = actions.previous_location,
			['<leader>l'] = actions.enter_win 'list',
		},
	},
	folds = {
		fold_closed = '⏵',
		fold_open = '⏷',
		folded = true,
	},
	indent_lines = {
		enable = true,
		icon = '│',
	},
	winbar = {
		enable = false,
	},
	use_trouble_qf = false,
-- 	hooks = {
-- 		before_open = function(results, open, jump, method)
-- 			local uri = vim.uri_from_bufnr(0)
-- 			if #results == 1 then
-- 				local target_uri = results[1].uri or results[1].targetUri

-- 				if target_uri == uri then
-- 					jump(results[1])
-- 				else
-- 					open(results)
-- 				end
-- 			else
-- 				open(results)
-- 			end
-- 		end,
-- 	},
}

vim.keymap.set('n', 'gr', '<CMD>Glance references<CR>')
vim.keymap.set('n', 'gd', '<CMD>Glance definitions<CR>')
vim.keymap.set('n', 'gy', '<CMD>Glance type_definitions<CR>')
vim.keymap.set('n', 'gi', '<CMD>Glance implementations<CR>')
