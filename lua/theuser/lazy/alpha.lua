return {
	'goolord/alpha-nvim',
	event = 'VimEnter',
	config = function()
		-- Variables
		local alpha = require 'alpha'
		local color_pick = require('theuser').color_picker()
		local Terminal = require('toggleterm.terminal').Terminal
		local lazygit = Terminal:new { cmd = 'lazygit', direction = 'float', hidden = true }
		function Lazygit_toggle() lazygit:toggle() end

		-- Header
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

		-- Buttons
		local function getButtons()
			local function button(sc, txt, keybind)
				local sc_ = sc:gsub('%s', ''):gsub('SPC', '<leader>')

				local opts = {
					position = 'center',
					text = txt,
					shortcut = sc,
					cursor = 50, -- 3
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
				button('c', '󰔎  Colorschemes', '<CMD>e ~/.config/nvim/lua/theuser/lazy/colorschemes.lua<CR>'),
				button('t', '  Terminal', '<CMD>ToggleTerm<CR>'),
				button('g', '  Lazy Git', '<CMD>lua Lazygit_toggle()<CR>'),
				button('p', '  Lazy Init', '<CMD>e ~/.config/nvim/lua/theuser/lazy/init.lua<CR>'),
				button('l', '󰂙  Lazy Manager', '<CMD>Lazy check<CR>'),
				button('m', '󰪩  Mason Manager', '<CMD>Mason<CR>'),
				button('i', '  Neovim Init', '<CMD>e ~/.config/nvim/lua/theuser/init.lua<CR>'),
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

		-- Greeting
		local function getGreeting()
			local function greetHead(name)
				local tableTime = os.date '*t'
				local hour = tableTime.hour
				local greetingsTable = {
					[1] = ' Sleep Well',
					[2] = ' Good Morning',
					[3] = ' Good Afternoon',
					[4] = ' Good Evening',
					[5] = '望Good Night',
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

			local userName = 'f.korpsvart 󰙊'
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

		-- Footer
		local function getFooter()
			local stats = require('lazy').stats()
			local total = '󰏗 Total.' .. stats.count
			local load = 'Load.' .. stats.loaded .. ' 󰞑'
			local date = os.date '%a.%d.%b 󰸗'
			local vers = ' ' .. vim.version().major .. '.' .. vim.version().minor
			local info_string = vers .. ' | ' .. total .. ' | ' .. load .. ' | ' .. date

			return {
				type = 'text',
				val = info_string,
				opts = { hl = color_pick, position = 'center' },
			}
		end

		local section = {
			header = getHeader(),
			greetHeading = getGreeting(),
			buttons = getButtons(),
			footer = getFooter(),
		}

		local opts = {
			layout = {
				{ type = 'padding', val = 2 },
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
	end,
}
