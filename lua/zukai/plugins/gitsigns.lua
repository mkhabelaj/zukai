local utils = require("zukai.utils")
return {
	"lewis6991/gitsigns.nvim",
	keys = {
		utils.make_lazy_key("<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk"),
		utils.make_lazy_key("<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk"),
		utils.make_lazy_key("<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame line"),
		utils.make_lazy_key("<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk"),
		utils.make_lazy_key("<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk"),
		utils.make_lazy_key("<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer"),
		utils.make_lazy_key("<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk"),
		utils.make_lazy_key("<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk"),
		utils.make_lazy_key("<leader>go", "<cmd>Telescope git_status<cr>", "Open changed file"),
		utils.make_lazy_key("<leader>gb", "<cmd>Telescope git_branches<cr>", "Checkout branch"),
		utils.make_lazy_key("<leader>gc", "<cmd>Telescope git_commits<cr>", "Checkout commit"),
		utils.make_lazy_key("<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", "Diff"),
	},
	event = { "BufReadPre", "BufNewFile" },
	config = true,
}
