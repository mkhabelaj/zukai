local utils = require("zukai.utils")
return {
	"szw/vim-maximizer",
	keys = {
		utils.make_lazy_key("<leader>sm", "<cmd>MaximizerToggle<CR>", "Maximize/minimize a split"),
	},
}
