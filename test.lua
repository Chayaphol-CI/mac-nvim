local utils = {}

function utils.define_augroups(definition)
	for group_name, definition in pairs(definitions) do
		vim.cmd("augroup" .. group_name)
	end
end

return utils
