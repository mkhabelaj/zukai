local status, highlight_colors = pcall(require, "nvim-highlight-colors")
if not status then
	return
end
highlight_colors.setup({})
