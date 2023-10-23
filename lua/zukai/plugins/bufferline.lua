return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
	version = "*",
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("bufferline").setup({
			---@diagnostic disable-next-line: missing-fields
			options = {
				mode = "buffers", -- set to "tabs" to only show tabpages instead
				numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
				close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
				right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
				left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
				middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
				indicator_icon = nil,
				indicator = { style = "icon", icon = "▎" },
				-- buffer_close_icon = "",
				buffer_close_icon = "",
				modified_icon = "●",
				close_icon = "",
				-- close_icon = '',
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 30,
				max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
				tab_size = 21,
				diagnostics = false, -- | "nvim_lsp" | "coc",
				diagnostics_update_in_insert = false,
				offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
				separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
				enforce_regular_tabs = true,
				always_show_bufferline = true,
				highlights = require("catppuccin.groups.integrations.bufferline").get(),
			},
		})
	end,
}
