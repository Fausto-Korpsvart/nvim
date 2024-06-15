local function text_format(symbol)
	local res = {}

	if symbol.references then
		local usage = symbol.references <= 1 and 'usage' or 'usages'
		local num = symbol.references == 0 and 'no' or symbol.references
		table.insert(res, { '󰌹 ', 'SymbolUsageRef' })
		table.insert(res, { ('%s %s'):format(num, usage), 'SymbolUsageContent' })
	end

	if symbol.definition then
		if #res > 0 then table.insert(res, { ' ', 'NonText' }) end
		table.insert(res, { '󰳽 ', 'SymbolUsageDef' })
		table.insert(res, { symbol.definition .. ' defs', 'SymbolUsageContent' })
	end

	if symbol.implementation then
		if #res > 0 then table.insert(res, { ' ', 'NonText' }) end
		table.insert(res, { '󰡱 ', 'SymbolUsageImpl' })
		table.insert(res, { symbol.implementation .. ' impls', 'SymbolUsageContent' })
	end

	return res
end

require('symbol-usage').setup {
	text_format = text_format,
	vt_position = 'end_of_line',
}
