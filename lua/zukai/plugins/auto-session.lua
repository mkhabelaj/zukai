local utils = require("zukai.utils")
return {
	"rmagatti/auto-session",
	event = "VimEnter",
	keys = {
		utils.make_lazy_key("<leader>Sr", "<cmd>SessionRestore<CR>", "Restore last session"),
		utils.make_lazy_key("<leader>Ss", "<cmd>SessionSave<CR>", "Save session"),
		utils.make_lazy_key("<leader>Sd", "<cmd>SessionDelete<CR>", "Delete session"),
		utils.make_lazy_key("<leader>Sl", "<cmd>Telescope session-lens<CR>", "List sessions"),
	},
	opts = {
		log_level = "info",
		auto_restore_enabled = false,
		auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
		pre_save_cmds = { "NvimTreeClose" },
	},
}
