return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim", -- required by telescope
		"MunifTanjim/nui.nvim",

		-- optional
		"nvim-treesitter/nvim-treesitter",
		"rcarriga/nvim-notify",
		"nvim-tree/nvim-web-devicons",
	},
	-- opts = {
	-- 	-- configuration goes here
	-- 	lang = "java",
	-- },
	config = function()
		-- import which-key plugin and add leetcode keybindings
		local wk = require("which-key")
		wk.register({
			["<leader>l"] = {
				name = "leetcode",
				l = { "<cmd>Leet list<cr>", "list" },
				s = { "<cmd>Leet submit<cr>", "submit" },
				t = { "<cmd>Leet test<cr>", "test" },
				r = { "<cmd>Leet run<cr>", "run" },
				d = { "<cmd>Leet debug<cr>", "debug" },
				c = { "<cmd>Leet clean<cr>", "clean" },
				u = { "<cmd>Leet update<cr>", "update" },
				x = { "<cmd>Leet exit<cr>", "exit" },
			},
		}, { prefix = "<leader>" })

		local leetcode = require("leetcode")
		leetcode.setup({
			lang = "java",
		}) -- configuration goes here
	end,
	event = "VeryLazy",
}
