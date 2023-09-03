-- returns a table for the keys table in the lazy vim setup
local utils = {}

utils.make_lazy_key = function(keys, comand, desc)
	return { keys, comand, desc = desc }
end

return utils
