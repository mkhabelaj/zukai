local utils = require("zukai.utils")
return {
	"ellisonleao/glow.nvim",
	config = true,
	cmd = "Glow",
	keys = { utils.make_lazy_key("<leader>G", ":Glow<CR>", "Preview Dot Files") },
	ft = { "md" },
}
