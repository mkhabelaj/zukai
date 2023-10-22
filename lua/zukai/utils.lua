-- returns a table for the keys table in the lazy vim setup
local utils = {}

local keymap = vim.keymap -- for conciseness
utils.make_lazy_key = function(keys, comand, desc, mode)
	if mode == nil then
		return { keys, comand, desc = desc }
	end
	return { keys, comand, mode = mode, desc = desc }
end
utils.map = function(mode, key, result, desc, default_opts)
	local description = { desc = desc }
	if default_opts == nil then
		default_opts = {}
	end
	keymap.set(mode, key, result, vim.tbl_extend("keep", default_opts, description))
end

-- is empty
utils.is_empty = function(s)
	return s == nil or s == ""
end

return utils
