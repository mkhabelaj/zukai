local utils = require("zukai.utils")
return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		utils.make_lazy_key("<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", "Mark file with harpoon"),
		utils.make_lazy_key("<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Go to next harpoon mark"),
		utils.make_lazy_key(
			"<leader>hk",
			"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
			"Go to previous harpoon mark"
		),
		utils.make_lazy_key("<leader>hj", "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Go to next harpoon mark"),
		utils.make_lazy_key("<leader>hq", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Quick Menu"),
		utils.make_lazy_key("<leader>hs", "<cmd>Telescope harpoon marks<cr>", "Show marks"),
	},
}

-- m = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Mark file with harpoon" },
-- r = { "<cmd>lua require('harpoon.mark').rm_file()<cr>", "Remove file from harpoon" },
-- n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Go to next harpoon mark" },
-- p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Go to previous harpoon mark" },
-- s = { "<cmd>Telescope harpoon marks<cr>", "Show marks" },
-- q = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Quick Menu" },
