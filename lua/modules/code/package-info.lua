require('package-info').setup {
	colors = {
		up_to_date = '#3C4048',
		outdated = '#d19a66',
	},
	icons = {
		enable = true,
		style = {
			up_to_date = '|  ',
			outdated = '|  ',
		},
	},
	autostart = true,
	hide_up_to_date = false,
	hide_unstable_versions = false,
	package_manager = 'npm',
}

vim.keymap.set(
	{ 'n' },
	'<Leader>ns',
	require('package-info').show,
	{ silent = true, noremap = true }
)

vim.keymap.set(
	{ 'n' },
	'<Leader>nc',
	require('package-info').hide,
	{ silent = true, noremap = true }
)

vim.keymap.set(
	{ 'n' },
	'<Leader>nt',
	require('package-info').toggle,
	{ silent = true, noremap = true }
)

vim.keymap.set(
	{ 'n' },
	'<Leader>nu',
	require('package-info').update,
	{ silent = true, noremap = true }
)

vim.keymap.set(
	{ 'n' },
	'<Leader>nd',
	require('package-info').delete,
	{ silent = true, noremap = true }
)

vim.keymap.set(
	{ 'n' },
	'<Leader>ni',
	require('package-info').install,
	{ silent = true, noremap = true }
)

vim.keymap.set(
	{ 'n' },
	'<Leader>np',
	require('package-info').change_version,
	{ silent = true, noremap = true }
)
