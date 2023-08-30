-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- configure nvim-tree
nvimtree.setup({
	-- change folder arrow icons
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
	-- disable window_picker for
	-- explorer to work well with
	-- window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	-- 	git = {
	-- 		ignore = false,
	-- 	},
})

-- Switch to file on buffer enter
-- local function auto_update_path()
-- 	local nerd_tree_buffer = 1
-- 	local buf = vim.api.nvim_get_current_buf()
--
-- 	-- Skip nerd tree buffer for the command
-- 	-- if buf == nerd_tree_buffer then
-- 	-- 	return
-- 	-- end
--
-- 	local bufname = vim.api.nvim_buf_get_name(buf)
-- 	if vim.fn.isdirectory(bufname) or vim.fn.isfile(bufname) then
-- 		require("nvim-tree.api").tree.find_file(vim.fn.expand("%:p"))
-- 	end
-- end
--
-- vim.api.nvim_create_autocmd("BufEnter", { callback = auto_update_path })
