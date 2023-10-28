local utils = require("zukai.utils")
return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = true,
	keys = {
		utils.make_lazy_key("<leader>gs", "<cmd>lua require('gitsigns').stage_hunk()<CR>", "Stage hunk"),
		utils.make_lazy_key("<leader>gu", "<cmd>lua require('gitsigns').undo_stage_hunk()<CR>", "Undo stage hunk"),
		utils.make_lazy_key("<leader>gr", "<cmd>lua require('gitsigns').reset_hunk()<CR>", "Reset hunk"),
		utils.make_lazy_key("<leader>gR", "<cmd>lua require('gitsigns').reset_buffer()<CR>", "Reset buffer"),
		utils.make_lazy_key("<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<CR>", "Preview hunk"),
		utils.make_lazy_key("<leader>gl", "<cmd>lua require('gitsigns').blame_line()<CR>", "Blame line"),
		utils.make_lazy_key("<leader>gS", "<cmd>lua require('gitsigns').stage_buffer()<CR>", "Stage buffer"),
		utils.make_lazy_key("<leader>gd", "<cmd>Gitsigns diffthis HEAD<CR>", "Diff this"),
		utils.make_lazy_key("<leader>gn", "<cmd>lua require('gitsigns').next_hunk()<CR>", "Next hunk"),
		utils.make_lazy_key("<leader>gp", "<cmd>lua require('gitsigns').prev_hunk()<CR>", "Prev hunk"),
		utils.make_lazy_key("<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<CR>", "Toggle blame"),
	},
}
