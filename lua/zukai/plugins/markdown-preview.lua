local utils = require("zukai.utils")
return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	keys = {
		utils.make_lazy_key("<leader>mp", ":MarkdownPreview<CR>", "Markdown Preview"),
		utils.make_lazy_key("<leader>ms", ":MarkdownPreviewStop<CR>", "Markdown Preview Stop"),
		utils.make_lazy_key("<leader>mt", ":MarkdownPreviewToggle<CR>", "Markdown Preview Toggle"),
	},
}
