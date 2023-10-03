-- Variables{{{
local alpha = require 'alpha'
local theta = require 'alpha.themes.theta'
local dashboard = require 'alpha.themes.dashboard'
local plenary_path = require 'plenary.path'
local cdir = vim.fn.getcwd()
local if_nil = vim.F.if_nil
local nvim_web_devicons = { enabled = true, highlight = true }
local color_pick = require('core-nv.utils').color_picker()
local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new { cmd = 'lazygit', direction = 'float', hidden = true }

function Lazygit_toggle()
	lazygit:toggle()
end

-- }}}

-- Alpha Theme{{{
-- -- Header{{{
-- local function getHeader()
-- 	local header = {
-- 		[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
-- 		[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
-- 		[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
-- 		[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
-- 		[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
-- 		[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],

-- 		-- More Headers{{{
-- 		-- [[                      .^!^                                           .!~:                      ]],
-- 		-- [[                 ^!JPB&B!.                                            !&&BPJ!:                 ]],
-- 		-- [[             ^?P#@@@@@G.                   :       :                   !@@@@@&BY!:             ]],
-- 		-- [[          ^JB@@@@@@@@@7                   .#~     ?P                   .&@@@@@@@@&G?:          ]],
-- 		-- [[       .7G@@@@@@@@@@@@#!                  ?@#^   ~@@^                 .5@@@@@@@@@@@@@G7.       ]],
-- 		-- [[     .?#@@@@@@@@@@@@@@@@BY!^.             B@@&BBB&@@Y              :~Y&@@@@@@@@@@@@@@@@#?.     ]],
-- 		-- [[    !#@@@@@@@@@@@@@@@@@@@@@@#G5Y?!~^:..  !@@@@@@@@@@#.   ..::^!7J5B&@@@@@@@@@@@@@@@@@@@@@B!    ]],
-- 		-- [[  .5@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&##B#@@@@@@@@@@@BBBB##&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Y   ]],
-- 		-- [[ :B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@5  ]],
-- 		-- [[.B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@? ]],
-- 		-- [[5@&#BGGPPPPPGGB&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&BGGPP5PPPGBB#&#.]],
-- 		-- [[^:..           .^!YB@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&57^.            .:^.]],
-- 		-- [[                    ~G@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Y.                    ]],
-- 		-- [[                      P@@@#BGGGGB#@@@@@@@@@@@@@@@@@@@@@@@@@#BP5555PG#@@@P                      ]],
-- 		-- [[                      :J!:.      .^!JG&@@@@@@@@@@@@@@@@#57^.        .:!5~                      ]],
-- 		-- [[                                      :?G@@@@@@@@@@@@P!.                                       ]],
-- 		-- [[                                         ~5@@@@@@@@5^                                          ]],
-- 		-- [[                                           ^P@@@@G^                                            ]],
-- 		-- [[                                             !#@?                                              ]],
-- 		-- [[                                              :^												]],

-- 		-- [[  |   |\    /|  /~\  |\    | |\  /|]],
-- 		-- [[\ |   | \  / | /   \ | \   | | \/ |]],
-- 		-- [[ \|   |  \/  | \   / |  \  | | /\ |]],
-- 		-- [[  |\  |      |  \ /  |   | | |/  \|]],
-- 		-- [[  | \ |      |  / \  |   | | |    |]],
-- 		-- [[  |   |      | /   \ |   | | |    |]],

-- 		-- [['|.   '|''||''''| ..|''||'||'  '|''||''||    ||']],
-- 		-- [[ |'|   |  ||  .  .|'    ||'|.  .'  ||  |||  ||| ]],
-- 		-- [[ | '|. |  ||''|  ||      ||||  |   ||  |'|..'|| ]],
-- 		-- [[ |   |||  ||     '|.     || |||    ||  | '|' || ]],
-- 		-- [[.|.   '| .||.....|''|...|'   |    .||..|. | .||.]],

-- 		-- [[888  ,d8  ,d8PPPP88888888d88   888888d88b_o8b]],
-- 		-- [[888_dPY8  d88ooo 888  888d88   888888d88 8'8b]],
-- 		-- [[8888' 88,88'     888  888d88_o8P'8888d88   8b]],
-- 		-- [[Y8P   Y888bdPPP  888oo888Y88P'   8888Y88   8P]],

-- 		-- [[8"""8 8"""" 8"""88 88   8 8  8""8""8]],
-- 		-- [[8   8 8     8    8 88   8 8  8  8  8]],
-- 		-- [[8e  8 8eeee 8    8 88  e8 8e 8e 8  8]],
-- 		-- [[88  8 88    8    8 "8  8  88 88 8  8]],
-- 		-- [[88  8 88    8    8  8  8  88 88 8  8]],
-- 		-- [[88  8 88eee 8eeee8  8ee8  88 88 8  8]],

-- 		-- [[███    ███████████████ ██    ███████    ███ ]],
-- 		-- [[████   ████    ██    ████    ████████  ████ ]],
-- 		-- [[██ ██  ███████ ██    ████    ██████ ████ ██ ]],
-- 		-- [[██  ██ ████    ██    ██ ██  ██ ████  ██  ██ ]],
-- 		-- [[██   █████████████████   ████  ████      ██ ]],

-- 		-- [[                               __                ]],
-- 		-- [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
-- 		-- [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
-- 		-- [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
-- 		-- [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
-- 		-- [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],

-- 		-- [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
-- 		-- [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
-- 		-- [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
-- 		-- [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
-- 		-- [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
-- 		-- [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
-- 		-- }}}
-- 	}

-- 	return {
-- 		type = 'text',
-- 		val = header,
-- 		opts = {
-- 			position = 'center',
-- 			hl = 'DiagnosticSignHint',
-- 		},
-- 	}
-- end
-- -- }}}

-- -- More Recent Used{{{
-- local function get_extension(fn)
-- 	local match = fn:match '^.+(%..+)$'
-- 	local ext = ''

-- 	if match ~= nil then
-- 		ext = match:sub(2)
-- 	end

-- 	return ext
-- end

-- local function icon(fn)
-- 	local nwd = require 'nvim-web-devicons'
-- 	local ext = get_extension(fn)

-- 	return nwd.get_icon(fn, ext, { default = true })
-- end

-- local function file_button(fn, sc, short_fn, autocd)
-- 	short_fn = short_fn or fn

-- 	local ico_txt
-- 	local fb_hl = {}

-- 	if nvim_web_devicons.enabled then
-- 		local ico, hl = icon(fn)

-- 		local hl_option_type = type(nvim_web_devicons.highlight)

-- 		if hl_option_type == 'boolean' then
-- 			if hl and nvim_web_devicons.highlight then
-- 				table.insert(fb_hl, { hl, 0, 3 })
-- 			end
-- 		end
-- 		if hl_option_type == 'String' then
-- 			table.insert(fb_hl, { nvim_web_devicons.highlight, 0, 3 })
-- 		end
-- 		ico_txt = ico .. '  '
-- 	else
-- 		ico_txt = ''
-- 	end

-- 	local cd_cmd = (autocd and ' | cd %:h:t' or '')

-- 	local file_button_el =
-- 		dashboard.button(sc, ico_txt .. short_fn, '<cmd>e ' .. fn .. cd_cmd .. ' <CR>')

-- 	local fn_start = short_fn:match '.*[/\\]'

-- 	if fn_start ~= nil then
-- 		table.insert(fb_hl, { 'Type', #ico_txt - 2, #fn_start + #ico_txt })
-- 	end

-- 	file_button_el.opts.hl = fb_hl

-- 	return file_button_el
-- end

-- local default_mru_ignore = { 'gitcommit' }

-- local mru_opts = {
-- 	ignore = function(path, ext)
-- 		return (string.find(path, 'COMMIT_EDITMSG')) or (vim.tbl_contains(default_mru_ignore, ext))
-- 	end,
-- 	autocd = false,
-- }

-- local function mru(start, cwd, items_number, opts)
-- 	opts = opts or mru_opts
-- 	items_number = if_nil(items_number, 10)

-- 	local oldfiles = {}

-- 	for _, v in pairs(vim.v.oldfiles) do
-- 		if #oldfiles == items_number then
-- 			break
-- 		end

-- 		local cwd_cond

-- 		if not cwd then
-- 			cwd_cond = true
-- 		else
-- 			cwd_cond = vim.startswith(v, cwd)
-- 		end

-- 		local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
-- 		if (vim.fn.filereadable(v) == 1) and cwd_cond and not ignore then
-- 			oldfiles[#oldfiles + 1] = v
-- 		end
-- 	end

-- 	local target_width = 40

-- 	local tbl = {}

-- 	for i, fn in ipairs(oldfiles) do
-- 		local short_fn

-- 		if cwd then
-- 			short_fn = vim.fn.fnamemodify(fn, ':p:.')
-- 		else
-- 			short_fn = vim.fn.fnamemodify(fn, ':~')
-- 		end

-- 		if #short_fn > target_width then
-- 			short_fn = plenary_path.new(short_fn):shorten(1, { -2, -1 })
-- 			if #short_fn > target_width then
-- 				short_fn = plenary_path.new(short_fn):shorten(1, { -1 })
-- 			end
-- 		end

-- 		local shortcut = tostring(i + start - 2)
-- 		local file_button_el = file_button(fn, shortcut, short_fn, opts.autocd)
-- 		tbl[i] = file_button_el
-- 	end

-- 	return {
-- 		type = 'group',
-- 		val = tbl,
-- 		opts = { hl = 'colors' },
-- 	}
-- end

-- local recent = {
-- 	type = 'group',
-- 	val = {
-- 		{
-- 			type = 'text',
-- 			val = 'Recents',
-- 			opts = {
-- 				hl = 'colors',
-- 				shrink_margin = false,
-- 				position = 'center',
-- 			},
-- 		},
-- 		{ type = 'padding', val = 1 },
-- 		{
-- 			type = 'group',
-- 			val = function()
-- 				return { mru(1, cdir, 10) }
-- 			end,
-- 			opts = {
-- 				hl = 'colors',
-- 				shrink_margin = false,
-- 			},
-- 		},
-- 	},
-- }
-- -- }}}

-- -- Old Buttons{{{
-- local getButtons = {
-- 	type = 'group',
-- 	position = 'center',
-- 	val = {
-- 		{ type = 'text', val = 'Utilities', opts = { hl = 'colors', position = 'center' } },
-- 		{ type = 'padding', val = 1 },
-- 		dashboard.button('F', '󰈞  Find Files', '<CMD>Telescope find_files<CR>'),
-- 		dashboard.button('S', '󰊢  Git Status', '<CMD>Telescope git_status<CR>'),
-- 		dashboard.button('C', '  Git Commit', '<CMD>Telescope git_commits<CR>'),
-- 		dashboard.button('Z', '  Lazy Git', '<CMD>lua Lazygit_toggle()<CR>'),
-- 		dashboard.button('G', '󰈮  Grep Code', '<CMD>Telescope live_grep<CR>'),
-- 		dashboard.button('N', '󰈔  New File', '<CMD>ene <BAR> startinsert<CR>'),
-- 		dashboard.button('T', '  Terminal', '<CMD>ToggleTerm<CR>'),
-- 		dashboard.button(
-- 			'I',
-- 			'󰔎  Colorschemes',
-- 			'<CMD>e ~/.config/nvim/lua/themes/init.lua<CR>'
-- 		),
-- 		dashboard.button('M', '󰪩  Mason Manager', '<CMD>Mason<CR>'),
-- 		dashboard.button('U', '󰂠  Lazy Manager', '<CMD>Lazy check<CR>'),
-- 		dashboard.button('L', '  Neovim Init', '<CMD>e ~/.config/nvim/init.lua<CR>'),
-- 		dashboard.button(
-- 			'P',
-- 			'󰏗  Neovim Plugs',
-- 			'<CMD>e ~/.config/nvim/lua/plugins/init.lua<CR>'
-- 		),
-- 		dashboard.button('H', '󰗶  Neovim Health', '<CMD>checkhealth<CR>'),
-- 		dashboard.button('Q', '󰩈  Exit Neovim', '<CMD>qa<CR>'),
-- 	},
-- }
-- -- }}}

-- -- Footer{{{
-- local function getFooter()
-- 	local stats = require('lazy').stats()
-- 	local total = '󰏗 Total.' .. stats.count
-- 	local load = 'Load.' .. stats.loaded .. ' 󰞑'
-- 	local date = os.date '%a.%d.%b 󰸗'
-- 	local vers = ' ' .. vim.version().major .. '.' .. vim.version().minor
-- 	-- .. '.'
-- 	-- .. vim.version().patch
-- 	-- local nvim = ' ' .. tostring(vim.version())

-- 	local info_string = vers .. ' | ' .. total .. ' | ' .. load

-- 	return {
-- 		type = 'text',
-- 		val = info_string,
-- 		opts = { hl = 'colors', position = 'center' },
-- 	}
-- end

-- local function get_date()
-- 	local datetime = os.date '󰨲 %a.%d.%b | %H:%M:%S 󰦖'
-- 	local info_string = datetime
-- 	return {
-- 		type = 'text',
-- 		val = info_string,
-- 		opts = {
-- 			hl = 'colors',
-- 			position = 'center',
-- 		},
-- 	}
-- end
-- -- }}}

-- local opts = {
-- 	layout = {
-- 		{ type = 'padding', val = 4 },
-- 		getHeader(),
-- 		{ type = 'padding', val = 1 },
-- 		recent,
-- 		{ type = 'padding', val = 1 },
-- 		getButtons,
-- 		{ type = 'padding', val = 1 },
-- 		getFooter(),
-- 		{ type = 'padding', val = 1 },
-- 		get_date(),
-- 	},
-- 	opts = { margin = 5 },
-- }

-- alpha.setup(opts)
-- }}}

-- Theta Theme{{{
-- -- Header{{{
-- local function getHeader()
-- 	local header = {

-- 		[[88  ,d8    ,d8PPPP  888888  88   88  88  88b_o88]],
-- 		[[88_dPY8    d88ooo   88  88  88   88  88  88 8'88]],
-- 		[[888' 88  ,88'       88  88  88_o8P'  88  88   88]],
-- 		[[8P   Y8  88bdPPP    88oo88  88P'     88  88   88]],

-- 		-- More Headers{{{
-- 		-- [[                               ''            ]],
-- 		-- [[`||''|,  .|''|, .|''|, \\  //  ||  '||),,(|, ]],
-- 		-- [[ ||  ||  ||..|| ||  ||  \\//   ||   || || || ]],
-- 		-- [[.||  ||. `|...  `|..|'   \/   .||. .||    ||.]],

-- 		-- [[                         .__         ]],
-- 		-- [[  ____   ____  _______  _|__| _____  ]],
-- 		-- [[ /    \_/ __ \/  _ \  \/ /  |/     \ ]],
-- 		-- [[|   |  \  ___(  <_> )   /|  |  Y Y  \]],
-- 		-- [[|___|  /\___  >____/ \_/ |__|__|_|  /]],
-- 		-- [[     \/     \/                    \/ ]],

-- 		-- [[ ____,   ____, ____, __  _, ____, _____, ]],
-- 		-- [[(-|  |  (-|_, (-/  \(-\ |  (-|   (-| | | ]],
-- 		-- [[ _|  |_, _|__,  \__/   \|   _|__, _| | |_]],
-- 		-- [[(       (                  (     (       ]],

-- 		-- [[                                   ||            ]],
-- 		-- [[.. ...     ....    ...   .... ... ...  .. .. ..  ]],
-- 		-- [[ ||  ||  .|...|| .|  '|.  '|.  |   ||   || || || ]],
-- 		-- [[ ||  ||  ||      ||   ||   '|.|    ||   || || || ]],
-- 		-- [[.||. ||.  '|...'  '|..|'    '|    .||. .|| || ||.]],

-- 		-- [[                                    oo           ]],
-- 		-- [[                                                 ]],
-- 		-- [[88d888b. .d8888b. .d8888b. dP   .dP dP 88d8b.d8b.]],
-- 		-- [[88'  `88 88ooood8 88'  `88 88   d8' 88 88'`88'`88]],
-- 		-- [[88    88 88.  ... 88.  .88 88 .88'  88 88  88  88]],
-- 		-- [[dP    dP `88888P' `88888P' 8888P'   dP dP  dP  dP]],

-- 		-- [[                                    ,e,            ]],
-- 		-- [[888 8e   ,e e,   e88 88e  Y8b Y888P  "  888 888 8e ]],
-- 		-- [[888 88b d88 88b d888 888b  Y8b Y8P  888 888 888 88b]],
-- 		-- [[888 888 888   , Y888 888P   Y8b "   888 888 888 888]],
-- 		-- [[888 888  "YeeP"  "88 88"     Y8P    888 888 888 888]],

-- 		-- [[                        _)       ]],
-- 		-- [[    \    -_)   _ \ \ \ / |   ` \ ]],
-- 		-- [[ _| _| \___| \___/  \_/ _| _|_|_|]],

-- 		-- [[.______  ._______._______  .___     .___ ._____.___ ]],
-- 		-- [[:      \ : .____/: .___  \ |   |___ : __|:         |]],
-- 		-- [[|       || : _/\ | :   |  ||   |   || : ||   \  /  |]],
-- 		-- [[|   |   ||   /  \|     :  ||   :   ||   ||   |\/   |]],
-- 		-- [[|___|   ||_.: __/ \_. ___/  \      ||   ||___| |   |]],
-- 		-- [[    |___|   :/      :/       \____/ |___|      |___|]],
-- 		-- [[                    :                               ]],

-- 		-- [[  |   |\    /|  /~\  |\    | |\  /|]],
-- 		-- [[\ |   | \  / | /   \ | \   | | \/ |]],
-- 		-- [[ \|   |  \/  | \   / |  \  | | /\ |]],
-- 		-- [[  |\  |      |  \ /  |   | | |/  \|]],
-- 		-- [[  | \ |      |  / \  |   | | |    |]],
-- 		-- [[  |   |      | /   \ |   | | |    |]],

-- 		-- [['|.   '|''||''''| ..|''||'||'  '|''||''||    ||']],
-- 		-- [[ |'|   |  ||  .  .|'    ||'|.  .'  ||  |||  ||| ]],
-- 		-- [[ | '|. |  ||''|  ||      ||||  |   ||  |'|..'|| ]],
-- 		-- [[ |   |||  ||     '|.     || |||    ||  | '|' || ]],
-- 		-- [[.|.   '| .||.....|''|...|'   |    .||..|. | .||.]],

-- 		-- [[888  ,d8   ,d8PPPP 88888888 d88   88 8888 d88b_o8b]],
-- 		-- [[888_dPY8   d88ooo  888  888 d88   88 8888 d88 8'8b]],
-- 		-- [[8888' 88 ,88'      888  888 d88_o8P' 8888 d88   8b]],
-- 		-- [[Y8P   Y8 88bdPPP   888oo888 Y88P'    8888 Y88   8P]],

-- 		-- [[8"""8 8"""" 8"""88 88   8 8  8""8""8]],
-- 		-- [[8   8 8     8    8 88   8 8  8  8  8]],
-- 		-- [[8e  8 8eeee 8    8 88  e8 8e 8e 8  8]],
-- 		-- [[88  8 88    8    8 "8  8  88 88 8  8]],
-- 		-- [[88  8 88    8    8  8  8  88 88 8  8]],
-- 		-- [[88  8 88eee 8eeee8  8ee8  88 88 8  8]],

-- 		-- [[                               __                ]],
-- 		-- [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
-- 		-- [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
-- 		-- [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
-- 		-- [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
-- 		-- [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],

-- 		-- [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
-- 		-- [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
-- 		-- [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
-- 		-- [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
-- 		-- [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
-- 		-- [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],

-- 		-- [[╔╗╔┌─┐┌─┐┬  ┬┬┌┬┐]],
-- 		-- [[║║║├┤ │ │└┐┌┘││││]],
-- 		-- [[╝╚╝└─┘└─┘ └┘ ┴┴ ┴]],
-- 		-- [[      .-.                                        ]],
-- 		-- [[        ;  :                .-.  .-.             ]],
-- 		-- [[      .;:  :  .-.  .-. _.;  :    `-' . ,';.,';.  ]],
-- 		-- [[     .;' \ :.;.-' ;   ;';   ;   ;'   ;;  ;;  ;;  ]],
-- 		-- [[ .:'.;    \: `:::'`;;'  `._.'_.;:._.';  ;;  ';   ]],
-- 		-- [[(__.'      `.                      _;        `-' ]],

-- 		-- [[eeeee eeee eeeee ee   e e  eeeeeee]],
-- 		-- [[8   8 8    8  88 88   8 8  8  8  8]],
-- 		-- [[8e  8 8eee 8   8 88  e8 8e 8e 8  8]],
-- 		-- [[88  8 88   8   8  8  8  88 88 8  8]],
-- 		-- [[88  8 88ee 8eee8  8ee8  88 88 8  8]],

-- 		-- [[ _ __   ___  _____   ___ _ __ ___  ]],
-- 		-- [[| '_ \ / _ \/ _ \ \ / / | '_ ` _ \ ]],
-- 		-- [[| | | |  __/ (_) \ V /| | | | | | |]],
-- 		-- [[|_| |_|\___|\___/ \_/ |_|_| |_| |_|]],

-- 		-- [[                      .^!^                                           .!~:                      ]],
-- 		-- [[                 ^!JPB&B!.                                            !&&BPJ!:                 ]],
-- 		-- [[             ^?P#@@@@@G.                   :       :                   !@@@@@&BY!:             ]],
-- 		-- [[          ^JB@@@@@@@@@7                   .#~     ?P                   .&@@@@@@@@&G?:          ]],
-- 		-- [[       .7G@@@@@@@@@@@@#!                  ?@#^   ~@@^                 .5@@@@@@@@@@@@@G7.       ]],
-- 		-- [[     .?#@@@@@@@@@@@@@@@@BY!^.             B@@&BBB&@@Y              :~Y&@@@@@@@@@@@@@@@@#?.     ]],
-- 		-- [[    !#@@@@@@@@@@@@@@@@@@@@@@#G5Y?!~^:..  !@@@@@@@@@@#.   ..::^!7J5B&@@@@@@@@@@@@@@@@@@@@@B!    ]],
-- 		-- [[  .5@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&##B#@@@@@@@@@@@BBBB##&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Y   ]],
-- 		-- [[ :B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@5  ]],
-- 		-- [[.B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@? ]],
-- 		-- [[5@&#BGGPPPPPGGB&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&BGGPP5PPPGBB#&#.]],
-- 		-- [[^:..           .^!YB@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&57^.            .:^.]],
-- 		-- [[                    ~G@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Y.                    ]],
-- 		-- [[                      P@@@#BGGGGB#@@@@@@@@@@@@@@@@@@@@@@@@@#BP5555PG#@@@P                      ]],
-- 		-- [[                      :J!:.      .^!JG&@@@@@@@@@@@@@@@@#57^.        .:!5~                      ]],
-- 		-- [[                                      :?G@@@@@@@@@@@@P!.                                       ]],
-- 		-- [[                                         ~5@@@@@@@@5^                                          ]],
-- 		-- [[                                           ^P@@@@G^                                            ]],
-- 		-- [[                                             !#@?                                              ]],
-- 		-- [[                                              :^												]],
-- 		-- }}}
-- 	}

-- 	return {
-- 		type = 'text',
-- 		val = header,
-- 		opts = {
-- 			position = 'center',
-- 			hl = 'colors',
-- 		},
-- 	}
-- end
-- -- }}}

-- -- Recents{{{
-- local function getRecents(max_shown)
-- 	local tbl = {
-- 		{
-- 			type = 'text',
-- 			val = '  Recent Archives.',
-- 			opts = { hl = 'DiagnosticSignHint', position = 'center' },
-- 		},
-- 		{
-- 			type = 'padding',
-- 			val = 1,
-- 		},
-- 	}

-- 	local mru_list = theta.mru(0, '', max_shown)
-- 	for _, file in ipairs(mru_list.val) do
-- 		table.insert(tbl, file)
-- 	end

-- 	return {
-- 		type = 'group',
-- 		val = tbl,
-- 		opts = {},
-- 	}
-- end
-- -- }}}

-- -- Projects{{{
-- local function getProjects(max_shown)
-- 	local alphabet = 'abcdefghijknopqrstuvwxyz'

-- 	local tbl = {
-- 		{
-- 			type = 'text',
-- 			val = '  Recent Projects',
-- 			opts = { hl = 'DiagnosticSignHint', position = 'center' },
-- 		},
-- 		{ type = 'padding', val = 1 },
-- 	}

-- 	local project_list = require('telescope._extensions.project.utils').get_projects 'recent'
-- 	for i, project in ipairs(project_list) do
-- 		if i > max_shown then
-- 			break
-- 		end

-- 		local icon = ' '

-- 		local target_width = 35
-- 		local display_path = project.path:gsub('/\\', '/\\')
-- 		if #display_path > target_width then
-- 			display_path = plenary_path.new(display_path):shorten(2, { -2, -1 })
-- 			if #display_path > target_width then
-- 				display_path = plenary_path.new(display_path):shorten(1, { -1 })
-- 			end
-- 		end

-- 		local letter
-- 		local project_name = display_path:match '[/\\][%w%s%.%-]*$'
-- 		if project_name == nil then
-- 			project_name = display_path
-- 		end
-- 		project_name = project_name:gsub('[/\\]', ' ')
-- 		letter = string.sub(project_name, 1, 1):lower()

-- 		if string.find(alphabet, letter) == nil then
-- 			letter = string.sub(alphabet, 1, 1):lower()
-- 		end

-- 		alphabet = alphabet:gsub(letter, '')

-- 		local file_button_el = dashboard.button(
-- 			letter,
-- 			icon .. display_path,
-- 			"<cmd>lua require('telescope.builtin').find_files( { cwd = '"
-- 				.. project.path:gsub('\\', '/')
-- 				.. "' }) <cr>"
-- 		)

-- 		local fb_hl = {}
-- 		table.insert(fb_hl, {
-- 			'Directory',
-- 			0,
-- 			#icon + #display_path - #project_name,
-- 		})
-- 		file_button_el.opts.hl = fb_hl

-- 		table.insert(tbl, file_button_el)
-- 	end

-- 	return {
-- 		type = 'group',
-- 		val = tbl,
-- 		opts = {},
-- 	}
-- end
-- -- }}}

-- -- Buttons{{{
-- local function getButtons()
-- 	local buttons = {
-- 		{
-- 			type = 'text',
-- 			val = '󱁤  Quick Utilities',
-- 			opts = { hl = 'DiagnosticSignHint', position = 'center' },
-- 		},
-- 		{ type = 'padding', val = 1 },
-- 		dashboard.button('f', '  Find Files', '<CMD>Telescope find_files<CR>'),
-- 		dashboard.button('g', '  Lazy Git', '<CMD>lua Lazygit_toggle()<CR>'),
-- 		dashboard.button('l', '  Lazy Manager', '<CMD>Lazy check<CR>'),
-- 		dashboard.button('m', '󰒋  Mason Manager', '<CMD>Mason<CR>'),
-- 		dashboard.button('i', '  Neovim Init', '<CMD>e ~/.config/nvim/init.lua<CR>'),
-- 		dashboard.button('p', '󰏗  Neovim Plugs', '<CMD>e ~/.config/nvim/lua/modules/init.lua<CR>'),
-- 		dashboard.button('h', '󰗶  Neovim Health', '<CMD>checkhealth<CR>'),
-- 		dashboard.button('t', '󰔎  Color Schemes', '<CMD>e ~/.config/nvim/lua/colors/init.lua<CR>'),
-- 	}

-- 	return {
-- 		type = 'group',
-- 		val = buttons,
-- 		opts = { position = 'center', spacing = 0 },
-- 	}
-- end
-- -- local function getButtons(){{{
-- -- 	local function button(sc, txt, keybind)
-- -- 		local sc_ = sc:gsub('%s', ''):gsub('SPC', '<leader>')

-- -- 		local opts = {
-- -- 			position = 'center',
-- -- 			text = txt,
-- -- 			shortcut = sc,
-- -- 			cursor = 6,
-- -- 			width = 50,
-- -- 			align_shortcut = 'right',
-- -- 			hl_shortcut = 'DiagnosticSignError',
-- -- 			hl = 'Directory',
-- -- 		}
-- -- 		if keybind then
-- -- 			opts.keymap = { 'n', sc_, keybind, { noremap = true, silent = true } }
-- -- 		end

-- -- 		return {
-- -- 			type = 'button',
-- -- 			val = txt,
-- -- 			on_press = function()
-- -- 				local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
-- -- 				vim.api.nvim_feedkeys(key, 'normal', false)
-- -- 			end,
-- -- 			opts = opts,
-- -- 		}
-- -- 	end

-- -- 	local buttons = {
-- -- 		{
-- -- 			type = 'text',
-- -- 			val = '󱁤  Utilities',
-- -- 			opts = { hl = 'DiagnosticSignHint', position = 'center' },
-- -- 		},
-- -- 		{ type = 'padding', val = 1 },
-- -- 		button('F', '  Find Files', '<CMD>Telescope find_files<CR>'),
-- -- 		button('Z', '  Lazy Git', '<CMD>lua Lazygit_toggle()<CR>'),
-- -- 		button('Y', '󰔎  Colorschemes', '<CMD>e ~/.config/nvim/lua/colors/init.lua<CR>'),
-- -- 		button('U', '󰒲  Lazy Manager', '<CMD>Lazy check<CR>'),
-- -- 		button('M', '󰒋  Mason Manager', '<CMD>Mason<CR>'),
-- -- 		button('I', '  Neovim Init', '<CMD>e ~/.config/nvim/init.lua<CR>'),
-- -- 		button('P', '󰏗  Neovim Plugs', '<CMD>e ~/.config/nvim/lua/plugins/init.lua<CR>'),
-- -- 		button('H', '󰗶  Neovim Health', '<CMD>checkhealth<CR>'),
-- -- 		button('Q', '󰩈  Neovim Quit', '<CMD>qa<CR>'),
-- -- 	}

-- -- 	return {
-- -- 		type = 'group',
-- -- 		val = buttons,
-- -- 		opts = { position = 'center', spacing = 0 },
-- -- 	}
-- -- end
-- -- }}}
-- -- }}}

-- -- Greeting{{{
-- local function getGreeting()
-- 	local function greetHead(name)
-- 		local tableTime = os.date '*t'
-- 		local hour = tableTime.hour
-- 		local greetingsTable = {
-- 			[1] = '  Sleep well',
-- 			[2] = '  Good morning',
-- 			[3] = '  Good afternoon',
-- 			[4] = '  Good evening',
-- 			[5] = '望 Good night',
-- 		}
-- 		local greetingIndex = 0
-- 		if hour == 23 or hour < 7 then
-- 			greetingIndex = 1
-- 		elseif hour < 12 then
-- 			greetingIndex = 2
-- 		elseif hour >= 12 and hour < 18 then
-- 			greetingIndex = 3
-- 		elseif hour >= 18 and hour < 21 then
-- 			greetingIndex = 4
-- 		elseif hour >= 21 then
-- 			greetingIndex = 5
-- 		end
-- 		return greetingsTable[greetingIndex] .. ', ' .. name
-- 	end

-- 	local userName = 'f.korpsvart'
-- 	local greeting = greetHead(userName)

-- 	return {
-- 		type = 'text',
-- 		val = greeting,
-- 		opts = {
-- 			position = 'center',
-- 			hl = 'DiagnosticSignHint',
-- 		},
-- 	}
-- end
-- -- }}}

-- -- Footer{{{
-- local function getFooter()
-- 	local stats = require('lazy').stats()
-- 	local total = '󰏗 Total.' .. stats.count
-- 	local load = 'Load.' .. stats.loaded .. ' 󰞑'
-- 	local date = os.date '%a.%d.%b 󰸗'
-- 	local start = '󰠠  ' .. (math.floor(stats.startuptime * 100 + 0.5) / 100) .. ' ms'
-- 	local vers = ' ' .. vim.version().major .. '.' .. vim.version().minor
-- 	-- .. '.'
-- 	-- .. vim.version().patch
-- 	-- local nvim = ' ' .. tostring(vim.version())

-- 	local info_string = vers .. ' | ' .. total .. ' | ' .. load .. ' | ' .. date

-- 	return {
-- 		type = 'text',
-- 		val = info_string,
-- 		opts = { hl = 'colors', position = 'center' },
-- 	}
-- end
-- -- }}}

-- theta.config.layout = {
-- 	{ type = 'padding', val = 4 },
-- 	getHeader(),
-- 	{ type = 'padding', val = 2 },
-- 	getRecents(6),
-- 	{ type = 'padding', val = 1 },
-- 	getProjects(6),
-- 	{ type = 'padding', val = 1 },
-- 	getButtons(),
-- 	{ type = 'padding', val = 2 },
-- 	getGreeting(),
-- 	{ type = 'padding', val = 1 },
-- 	getFooter(),
-- }

-- require('alpha').setup(theta.config)
-- }}}

-- Dashboard Theme
-- Header{{{
local function getHeader()
	local header = {
		[[                               __                ]],
		[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
		[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
		[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
		[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
		[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
	}

	return {
		type = 'text',
		val = header,
		opts = {
			position = 'center',
			hl = color_pick,
		},
	}
end
-- }}}

-- Buttons{{{

local function getButtons()
	local function button(sc, txt, keybind)
		local sc_ = sc:gsub('%s', ''):gsub('SPC', '<leader>')

		local opts = {
			position = 'center',
			text = txt,
			shortcut = sc,
			cursor = 6,
			width = 45,
			align_shortcut = 'right',
			hl_shortcut = 'DiagnosticSignError',
			hl = 'Directory',
		}
		if keybind then
			opts.keymap = { 'n', sc_, keybind, { noremap = true, silent = true } }
		end

		return {
			type = 'button',
			val = txt,
			on_press = function()
				local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
				vim.api.nvim_feedkeys(key, 'normal', false)
			end,
			opts = opts,
		}
	end

	local buttons = {
		button('r', '  Recent Files', '<CMD>Telescope oldfiles<CR>'),
		button('f', '  Find Files', '<CMD>Telescope find_files<CR>'),
		button('P', '󱉟  Projects', '<CMD>lua require("telescope").extensions.project.project({initial_mode = "normal", layout_strategy = "vertical"})<CR>'),
		button('c', '󰔎  Colorschemes', '<CMD>e ~/.config/nvim/lua/colors/init.lua<CR>'),
		button('t', '  Terminal', '<CMD>ToggleTerm<CR>'),
		button('g', '  Lazy Git', '<CMD>lua Lazygit_toggle()<CR>'),
		button('l', '󰋣  Lazy Manager', '<CMD>Lazy check<CR>'),
		button('m', '󰪩  Mason Manager', '<CMD>Mason<CR>'),
		button('i', '  Neovim Init', '<CMD>e ~/.config/nvim/init.lua<CR>'),
		button('p', '  Neovim Modules', '<CMD>e ~/.config/nvim/lua/modules/init.lua<CR>'),
		button('h', '󰗶  Neovim Health', '<CMD>checkhealth<CR>'),
		button('q', '󰩈  Neovim Quit', '<CMD>qa<CR>'),
	}

	return {
		type = 'group',
		val = buttons,
		opts = {
			position = 'center',
			spacing = 1,
		},
	}
end
-- }}}

-- Greeting{{{
local function getGreeting()
	local function greetHead(name)
		local tableTime = os.date '*t'
		local hour = tableTime.hour
		local greetingsTable = {
			[1] = '  Sleep well',
			[2] = '  Good morning',
			[3] = '  Good afternoon',
			[4] = '  Good evening',
			[5] = '望 Good night',
		}
		local greetingIndex = 0
		if hour == 23 or hour < 7 then
			greetingIndex = 1
		elseif hour < 12 then
			greetingIndex = 2
		elseif hour >= 12 and hour < 18 then
			greetingIndex = 3
		elseif hour >= 18 and hour < 21 then
			greetingIndex = 4
		elseif hour >= 21 then
			greetingIndex = 5
		end
		return greetingsTable[greetingIndex] .. ', ' .. name
	end

	local userName = 'f.korpsvart'
	local greeting = greetHead(userName)

	return {
		type = 'text',
		val = greeting,
		opts = {
			position = 'center',
			hl = 'DiagnosticSignError',
		},
	}
end
-- }}}

-- Footer{{{
local function getFooter()
	local stats = require('lazy').stats()
	local total = '󰏗 Total.' .. stats.count
	local load = 'Load.' .. stats.loaded .. ' 󰞑'
	local date = os.date '%a.%d.%b 󰸗'
	local vers = ' ' .. vim.version().major .. '.' .. vim.version().minor
	-- local start = '󰠠  ' .. (math.floor(stats.startuptime * 100 + 0.5) / 100) .. ' ms'
	-- .. '.'
	-- .. vim.version().patch
	-- local nvim = ' ' .. tostring(vim.version())

	local info_string = vers .. ' | ' .. total .. ' | ' .. load .. ' | ' .. date

	return {
		type = 'text',
		val = info_string,
		opts = { hl = color_pick, position = 'center' },
	}
end
-- }}}

local section = {
	header = getHeader(),
	greetHeading = getGreeting(),
	buttons = getButtons(),
	footer = getFooter(),
}

local opts = {
	layout = {
		{ type = 'padding', val = 4 },
		section.header,
		{ type = 'padding', val = 2 },
		section.buttons,
		{ type = 'padding', val = 1 },
		section.greetHeading,
		{ type = 'padding', val = 2 },
		section.footer,
	},
	opts = {
		margin = 5,
	},
}

alpha.setup(opts)
