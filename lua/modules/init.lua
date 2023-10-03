return {
	-- Always Needed{{{
	{ 'nvim-lua/plenary.nvim' },
	{ 'kyazdani42/nvim-web-devicons' },
	-- }}}

	-- LS Protocol{{{
	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = { 'b0o/schemastore.nvim' },
		config = function()
			require 'modules.lsp.lsp-config'
		end,
	},

	{
		'williamboman/mason.nvim',
		event = 'LspAttach',
		cmd = {
			'MasonInstall',
			'MasonUninstall',
			'Mason',
			'MasonUninstallAll',
			'MasonLog',
		},
		dependencies = {
			{ 'williamboman/mason-lspconfig.nvim' },
		},
		config = function()
			require 'modules.lsp.lsp-mason'
		end,
	},

	{
		'glepnir/lspsaga.nvim',
		event = 'LspAttach',
		config = function()
			require 'modules.lsp.lsp-saga'
		end,
	},

	{
		'RRethy/vim-illuminate',
		event = 'LspAttach',
		config = function()
			require 'modules.lsp.lsp-lumos'
		end,
	},
	-- }}}

	-- Lint & Format{{{
	{
		'jose-elias-alvarez/null-ls.nvim',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'jay-babu/mason-null-ls.nvim' },
		},
		config = function()
			require 'modules.lsp.lsp-null'
		end,
	},
	-- }}}

	-- Completion{{{
	{
		'hrsh7th/nvim-cmp',
		event = { 'InsertEnter', 'CmdlineEnter' },
		dependencies = {
			{ 'FelipeLema/cmp-async-path' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-cmdline' },
			{
				'dcampos/cmp-emmet-vim',
				dependencies = { 'mattn/emmet-vim' },
			},
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'lukas-reineke/cmp-rg' },
			{
				'Jezda1337/nvim-html-css',
				event = { 'BufReadPost', 'BufNewFile' },
				dependencies = {
					'nvim-treesitter/nvim-treesitter',
					'nvim-lua/plenary.nvim',
				},
				config = function()
					require('html-css'):setup()
				end,
			},
		},
		config = function()
			require 'modules.lsp.cmp-main'
		end,
	},

	{
		'L3MON4D3/LuaSnip',
		build = 'make install_jsregexp',
		dependencies = {
			'rafamadriz/friendly-snippets',
			config = function()
				require('luasnip.loaders.from_vscode').lazy_load()
			end,
		},
		config = function()
			require 'modules.lsp.cmp-snips'
		end,
	},

	{
		'tzachar/cmp-tabnine',
		build = './install.sh',
		lazy = true,
		event = { 'InsertEnter' },
		config = function()
			require 'modules.lsp.cmp-tab9'
		end,
	},
	-- }}}

	-- Treesitter{{{
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		event = { 'BufReadPost', 'BufNewFile' },
		dependencies = {
			{ 'windwp/nvim-ts-autotag' },
			{ 'JoosepAlviste/nvim-ts-context-commentstring' },
			{ 'nvim-treesitter/nvim-treesitter-textobjects' },
		},
		config = function()
			require 'modules.lsp.ts-syntax-hl'
		end,
	},

	{
		'nvim-treesitter/nvim-treesitter-context',
		event = { 'BufReadPost', 'BufNewFile' },
		config = function()
			require 'modules.lsp.ts-context'
		end,
	},

	{
		'HiPhish/rainbow-delimiters.nvim',
		event = { 'BufReadPost', 'BufNewFile' },
		config = function()
			require 'modules.lsp.ts-rain-del'
		end,
	},
	-- }}}

	-- Code Utilities{{{
	{
		'altermo/ultimate-autopair.nvim',
		event = { 'InsertEnter', 'CmdlineEnter' },
		branch = 'v0.6',
		opts = {},
	},

	{
		'ojroques/nvim-bufdel',
		event = 'VeryLazy',
		config = function()
			require 'modules.code.bufdelete'
		end,
	},

	{
		'metakirby5/codi.vim',
		event = 'VeryLazy',
		config = function()
			require 'modules.code.codi'
		end,
	},

	{
		'NvChad/nvim-colorizer.lua',
		event = 'BufReadPre',
		config = function()
			require 'modules.code.colorizer'
		end,
	},

	{
		'numToStr/Comment.nvim',
		event = 'VeryLazy',
		config = function()
			require 'modules.code.comment'
		end,
	},

	{
		'kqito/vim-easy-replace',
		event = 'BufEnter',
		config = function()
			require 'modules.code.easy-replace'
		end,
	},

	{
		'editorconfig/editorconfig-vim',
		event = 'BufReadPre',
		config = function()
			require 'modules.code.editor-conf'
		end,
	},

	{
		'ellisonleao/glow.nvim',
		event = 'VeryLazy',
		config = function()
			require 'modules.code.glow'
		end,
	},

	{
		'kevinhwang91/nvim-hlslens',
		event = 'VeryLazy',
		keys = {
			vim.keymap.set('n', 'thl', '<CMD>HlSearchLensToggle<CR>'),
		},
		config = function()
			require 'modules.code.hlslens'
		end,
	},

	{
		'smoka7/hop.nvim',
		event = 'VeryLazy',
		config = function()
			require 'modules.code.hop'
		end,
	},

	{
		'Vigemus/iron.nvim',
		event = 'VeryLazy',
		config = function()
			require 'modules.code.iron'
		end,
	},

	{
		'iamcco/markdown-preview.nvim',
		lazy = 'true',
		build = function()
			vim.fn['mkdp#util#install']()
		end,
		ft = 'markdown',
		config = function()
			require 'modules.code.markdown-prev'
		end,
	},

	{
		'andymass/vim-matchup',
		branch = 'master',
		event = { 'BufReadPre', 'BufNewFile' },
		config = function()
			require 'modules.code.matchup'
		end,
	},

	{
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v2.x',
		event = 'VeryLazy',
		dependencies = {
			'MunifTanjim/nui.nvim',
			-- 'mrbjarksen/neo-tree-diagnostics.nvim',
			{
				's1n7ax/nvim-window-picker',
				event = 'VeryLazy',
				config = function()
					require 'modules.ui.win-pick'
				end,
			},
		},
		config = function()
			require 'modules.ui.neotree'
		end,
	},

	{
		'tyru/open-browser.vim',
		event = 'VeryLazy',
		config = function()
			require 'modules.code.open-browser'
		end,
	},

	{
		'vuki656/package-info.nvim',
		event = 'BufEnter',
		dependencies = { 'MunifTanjim/nui.nvim' },
		config = function()
			require 'modules.code.package-info'
		end,
	},

	{
		'MunifTanjim/prettier.nvim',
		event = 'BufModifiedSet',
		config = function()
			require 'modules.code.prettier'
		end,
	},

	{ 'christoomey/vim-tmux-navigator' },

	{
		'michaelb/sniprun',
		event = 'VeryLazy',
		build = 'sh install.sh',
		config = function()
			require 'modules.code.sniprun'
		end,
	},

	{
		'mg979/vim-visual-multi',
		branch = 'master',
		event = 'BufEnter',
		init = function()
			require 'modules.code.visual-multi'
		end,
	},
	-- }}}

	-- Git Integration{{{
	{
		'sindrets/diffview.nvim',
		event = 'VeryLazy',
		config = function()
			require 'modules.code.git-diffv'
		end,
	},

	{
		'lewis6991/gitsigns.nvim',
		event = { 'BufReadPre', 'BufNewFile' },
		config = function()
			require 'modules.code.git-signs'
		end,
	},

	{
		'NeogitOrg/neogit',
		event = 'VeryLazy',
		config = function()
			require 'modules.code.git-neo'
		end,
	},
	-- }}}

	-- Mini Plugins{{{
	{
		'echasnovski/mini.indentscope',
		version = false,
		event = 'BufReadPre',
		config = function()
			require 'modules.ui.indentscope'
		end,
	},

	{
		'echasnovski/mini.move',
		version = false,
		event = 'VeryLazy',
		config = function()
			require 'modules.code.move'
		end,
	},

	{
		'echasnovski/mini.splitjoin',
		version = false,
		event = 'VeryLazy',
		config = function()
			require 'modules.code.splitjoin'
		end,
	},

	{
		'echasnovski/mini.surround',
		version = false,
		lazy = true,
		event = 'VeryLazy',
		config = function()
			require 'modules.code.surround'
		end,
	},
	-- }}}

	-- User Interface{{{
	{
		'goolord/alpha-nvim',
		event = 'VimEnter',
		config = function()
			require 'modules.ui.alpha'
		end,
	},

	{
		'stevearc/dressing.nvim',
		event = 'VeryLazy',
		config = function()
			require('dressing').setup {
				input = { title_pos = 'center', border = 'single' },
			}
		end,
	},

	{
		'j-hui/fidget.nvim',
		tag = 'legacy',
		event = 'BufReadPre',
		config = function()
			require 'modules.ui.fidget'
		end,
	},

	{
		'shellRaining/hlchunk.nvim',
		event = { 'UIEnter' },
		config = function()
			require 'modules.ui.hlchunk'
		end,
	},

	{
		'b0o/incline.nvim',
		event = 'BufReadPre',
		config = function()
			require 'modules.ui.incline'
		end,
	},

	{
		'aurum77/live-server.nvim',
		event = 'VeryLazy',
		config = function()
			require 'modules.ui.live-server'
		end,
	},

	{
		'nvim-lualine/lualine.nvim',
		event = 'VimEnter',
		dependencies = { 'sherlock5512/lualine-spell-status' },
		config = function()
			require 'modules.ui.lualine'
		end,
	},

	{
		'AckslD/muren.nvim',
		event = 'VeryLazy',
		config = function()
			require 'modules.ui.muren'
		end,
	},

	{
		'vigoux/notifier.nvim',
		event = 'VimEnter',
		config = function()
			require 'modules.ui.notifier'
		end,
	},

	{
		'anuvyklack/pretty-fold.nvim',
		event = 'BufReadPost',
		config = function()
			require 'modules.ui.prettyfold'
		end,
	},

	{
		'dstein64/nvim-scrollview',
		event = 'VeryLazy',
		init = function()
			require 'modules.ui.scrollview'
		end,
	},

	{
		'windwp/nvim-spectre',
		event = 'VeryLazy',
		config = function()
			require 'modules.ui.spectre'
		end,
	},

	{
		'luukvbaal/statuscol.nvim',
		event = 'VimEnter',
		config = function()
			require 'modules.ui.statuscol'
		end,
	},

	{
		'simrat39/symbols-outline.nvim',
		event = 'VeryLazy',
		config = function()
			require 'modules.ui.outline'
		end,
	},

	{
		'nvim-telescope/telescope.nvim',
		event = 'VeryLazy',
		dependencies = {
			{ 'nvim-telescope/telescope-file-browser.nvim' },
			{ 'tsakirist/telescope-lazy.nvim' },
			{ 'nvim-telescope/telescope-project.nvim' },
		},
		config = function()
			require 'modules.ui.telescope'
		end,
	},

	{
		'folke/todo-comments.nvim',
		event = 'VeryLazy',
		config = function()
			require 'modules.ui.todocomment'
		end,
	},

	{
		'folke/trouble.nvim',
		event = 'VeryLazy',
		config = function()
			require 'modules.ui.trouble'
		end,
	},

	{
		'akinsho/toggleterm.nvim',
		version = '*',
		event = 'VeryLazy',
		opts = {
			open_mapping = [[<Leader>tt]],
			size = 15,
			direction = 'horizontal',
		},
	},

	{
		'anuvyklack/windows.nvim',
		event = 'VeryLazy',
		dependencies = {
			'anuvyklack/middleclass',
			'anuvyklack/animation.nvim',
		},
		config = function()
			require 'modules.ui.win-resize'
		end,
	},

	{
		'folke/zen-mode.nvim',
		event = 'VeryLazy',
		keys = { vim.keymap.set('n', 'nz', '<CMD>ZenMode<CR>') },
		config = function()
			require('zen-mode').setup {}
		end,
	},
	-- }}}

	-- Colorschemes{{{
	{ 'catppuccin/nvim' },
	{ 'sainnhe/everforest' },
	{ 'sainnhe/gruvbox-material' },
	{ 'rebelot/kanagawa.nvim' },
	{ 'marko-cerovac/material.nvim' },
	{ 'EdenEast/nightfox.nvim' },
	{ 'rose-pine/neovim' },
	{ 'folke/tokyonight.nvim' },
	-- }}}
}
