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

		local telescopeConfig = require("telescope.config")
		-- Clone the default Telescope configuration
		local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

		-- I want to search in hidden/dot files.
		table.insert(vimgrep_arguments, "--hidden")
		-- I don't want to search in the `.git` directory.
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/.git/*")

		-- import telescope actions safely
		local actions = require("telescope.actions")

		-- import telescope-ui-select safely
		local themes = require("telescope.themes")
		telescope.setup({
			-- configure custom mappings
			defaults = {
				-- `hidden` = true is not supported in text grep commands.
				vimgrep_arguments = vimgrep_arguments,
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-f>"] = actions.preview_scrolling_down,
						["<C-b>"] = actions.preview_scrolling_up,
					},
				},
			},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
			extensions = {
				["ui-select"] = {
					themes.get_dropdown({}),
				},
			},
		})

		utils.map("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>", "Colorscheme")
		utils.map("n", "<leader>fC", "<cmd>Telescope commands<cr>", "Commands")
		utils.map(
			"n",
			"<leader>ff",
			"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"Find Files"
		)
		utils.map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", "Find Help")
		utils.map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", "Keymaps")
		utils.map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", "Open Recent File")
		utils.map("n", "<leader>fR", "<cmd>Telescope registers<cr>", "Registers")
		utils.map("n", "<leader>fs", "<cmd>Telescope grep_string<cr>", "Find String")
		utils.map("n", "<leader>ft", "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text")

		-- git
		utils.map("n", "<leader>gc", "<cmd>Telescope git_branches<cr>", "Checkout branch")
		utils.map("n", "<leader>gC", "<cmd>Telescope git_commits<cr>", "Checkout commit")
		utils.map("n", "<leader>gb", "<cmd>Telescope git_bcommits<cr>", "Checkout commit (buffer)")
		utils.map("n", "<leader>go", "<cmd>Telescope git_status<cr>", "Git Status")

		telescope.load_extension("fzf")
		telescope.load_extension("harpoon")
		telescope.load_extension("session-lens")
	end,
}
