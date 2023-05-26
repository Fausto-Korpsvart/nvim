return {
	-- https://github.com/petertriho/nvim-scrollbar
	'petertriho/nvim-scrollbar',
	event = 'VeryLazy',
	dependencies = {
		-- https://github.com/kevinhwang91/nvim-hlslens
		'kevinhwang91/nvim-hlslens',
		keys = {
			vim.keymap.set('n', 'thl', '<CMD>HlSearchLensToggle<CR>'),
		},
		config = function()
			require('hlslens').setup {
				nearest_only = true,
				nearest_float_when = 'never', -- auto|always|never
				float_shadow_blend = 0,
				virt_priority = 0,
				build_position_cb = function(plist, _, _, _)
					require('scrollbar.handlers.search').handler.show(plist.start_pos)
				end,
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
						chunks = { { ' ', 'Ignore' }, { text, 'HlSearchLensNear' } }
					else
						text = ('[%s %d]'):format(indicator, idx)
						chunks = { { ' ', 'Ignore' }, { text, 'HlSearchLens' } }
					end
					render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
				end,
			}
		end,
	},
	config = function()
		require('scrollbar').setup {
			handlers = {
				cursor = false,
				gitsigns = true,
				search = true,
				diagnostic = true,
			},
			handle = { blend = 50, color = '#565f89' },
			marks = {
				cursor = { text = '•', color = '#ff007c' },
				Search = { text = { '│', '' }, color = '#0db9d7' },
				Error = { text = { '│', '' }, color = '#ff757f' },
				Warn = { text = { '│', '' }, color = '#ff966c' },
				Info = { text = { '│', '' }, color = '#7aa2f7' },
				Hint = { text = { '│', '' }, color = '#bb9af7' },
				Misc = { text = { '🢒', '🢐' }, color = '#3d59a1' },
				GitAdd = { text = '│', color = '#4fd6be' },
				GitDelete = { text = '│', color = '#f7768e' },
				GitChange = { text = '│', color = '#c3e88d' },
			},
			excluded_buftypes = {
				'terminal',
			},
			excluded_filetypes = {
				'alpha',
				'noice',
				'lazy',
				'prompt',
				'TelescopePrompt',
			},
		}
	end,
}
