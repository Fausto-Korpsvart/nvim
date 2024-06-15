require('lint').linters.eslint.cmd = '/home/fausto/.npm-packages/bin/eslint'
require('lint').linters.eslint.cmd = '/home/fausto/node_modules/.bin/eslint_d'

require('lint').linters_by_ft = {
	css = { 'eslint_d' },
	html = { 'tidy' },
	javascript = { 'eslint_d' },
	json = { 'jsonlint' },
	lua = { 'luacheck' },
	markdown = { 'markdownlint' },
	python = { 'flake8' },
	sass = { 'eslint_d' },
	scss = { 'eslint_d' },
	sh = { 'shellcheck' },
	typescript = { 'eslint_d' },
	yaml = { 'yamllint' },
}

-- vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
	callback = function() require('lint').try_lint() end,
})

vim.keymap.set('n', 'tl', function() require('lint').try_lint() end)
