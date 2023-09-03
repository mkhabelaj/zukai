local utils = require("zukai.utils")
return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons",
		"ThePrimeagen/harpoon",
		"rmagatti/auto-session",
	},
	config = function()
		local telescope = require("telescope")

		-- import telescope actions safely
		local actions = require("telescope.actions")

		-- import telescope-ui-select safely
		local themes = require("telescope.themes")
		telescope.setup({
			-- configure custom mappings
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
						["<C-f>"] = actions.preview_scrolling_down,
						["<C-b>"] = actions.preview_scrolling_up,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					themes.get_dropdown({}),
				},
			},
		})

		utils.map("n", "<leader>tb", "<cmd>Telescope git_branches<cr>", "Checkout branch")
		utils.map("n", "<leader>tc", "<cmd>Telescope colorscheme<cr>", "Colorscheme")
		utils.map("n", "<leader>th", "<cmd>Telescope help_tags<cr>", "Find Help")
		utils.map("n", "<leader>tr", "<cmd>Telescope oldfiles<cr>", "Open Recent File")
		utils.map("n", "<leader>tR", "<cmd>Telescope registers<cr>", "Registers")
		utils.map("n", "<leader>tk", "<cmd>Telescope keymaps<cr>", "Keymaps")
		utils.map("n", "<leader>tC", "<cmd>Telescope commands<cr>", "Commands")

		telescope.load_extension("fzf")
		telescope.load_extension("harpoon")
		telescope.load_extension("session-lens")
	end,
}
