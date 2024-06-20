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

local lint = false
local toggle_lint = function()
	if lint == true then
		lint = false
		vim.diagnostic.reset(nil, 0)
	else
		lint = true
		require('lint').try_lint()
	end
end
vim.keymap.set({ 'n' }, '<Leader>lt', toggle_lint, { noremap = true, desc = 'Lint' })

-- vim.keymap.set('n', '<Leader>lti', function() require('lint').try_lint() end)
