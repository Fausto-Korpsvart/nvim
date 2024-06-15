local prettier = require 'conform.formatters.prettier'
local prettierd = require 'conform.formatters.prettierd'
local util = require 'conform.util'

require('conform').setup {
	-- On Save{{{
	-- format_on_save = {
	-- 	lsp_fallback = true,
	--  async = false,
	-- 	timeout_ms = 500,
	-- },

	-- format_after_save = {
	-- 	lsp_fallback = true,
	-- },
	-- }}}

	notify_on_error = true,
	log_level = vim.log.levels.ERROR,

	formatters = {
		markdownlint = {
			command = 'markdownlint',
			args = { '--fix', '$FILENAME' },
			exit_codes = { 0, 1 },
			stdin = false,
		},

		prettier = vim.tbl_deep_extend('force', prettier, {
			args = util.extend_args(prettier.args, { '--single-quote', '--tab-width', '4' }),
			range_args = util.extend_args(
				prettier.range_args,
				{ '--single-quote', '--tab-width', '4' }
			),
			stdin = true,
		}),

		prettierd = {
			command = 'prettierd',
			stdin = true,
			args = util.extend_args(prettier.args, { '--single-quote' }),
			range_args = util.extend_args(prettier.range_args, { '--single-quote' }),
		},

		injected = { options = { ignore_errors = true } },
	},

	formatters_by_ft = {
		css = { { 'prettier', 'prettierd' } },
		html = { { 'prettier', 'prettier' } },
		javascript = { { 'prettier', 'prettierd' } },
		json = { { 'prettier', 'prettierd' } },
		jsonc = { { 'prettier', 'prettierd' } },
		lua = { 'stylua' },
		markdown = { { 'markdownlint', 'prettier' } },
		python = { 'isort', 'black' },
		scss = { { 'prettier', 'prettierd' } },
		sh = { 'shfmt' },
		svelte = { { 'prettier', 'prettierd' } },
		typescript = { { 'prettier', 'prettierd' } },
		xml = { { 'xmlformat', 'prettier' } },
		yaml = { { 'yamlfmt', 'prettier' } },
		['_'] = { { 'trim_whitespace', 'trim_newlines' } },
	},
}
