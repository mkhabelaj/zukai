local utils = require("zukai.utils")
-- Define a function to set the keybindings for LSP on attach hook
local on_attach_keymaps = function(_, bufnr) -- client, bufnr
	local opts = { noremap = true, silent = true, buffer = bufnr }
	-- keybindings options
	-- A function to simplify setting the keymaps  and takes into account for variations above

	utils.map("n", "gF", "<cmd>Lspsaga finder<CR>", "Show LSP references", opts)
	utils.map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions", opts)
	utils.map("n", "gl", "<cmd>Lspsaga peek_definition<CR>", "Show LSP peek definition", opts)
	utils.map("n", "gD", vim.lsp.buf.declaration, "LSP go to declaration", opts)
	utils.map("n", "gI", vim.lsp.buf.implementation, "LSP go to implementation", opts)
	utils.map("n", "gt", "<cmd>Telescope lsp_type_definitions()<CR>", "Show LSP type definitions", opts)
	utils.map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, "LSP code action", opts)
	-- show documentation for the symbol under the cursor
	utils.map("n", "K", vim.lsp.buf.hover, "LSP show hover documentation", opts)

	utils.map("n", "<leader>la", vim.lsp.buf.code_action, "LSP code action", opts)
	utils.map("n", "<leader>lr", vim.lsp.buf.rename, "LSP rename", opts)
	utils.map("n", "<leader>ll", vim.diagnostic.open_float, "LSP show line diagnostics", opts)
	utils.map("n", "<leader>lw", "<cmd>Telescope diagnostics<CR>", "Show Telescope diagnostics", opts)
	utils.map(
		"n",
		"<leader>lk",
		"<cmd>lua vim.diagnostic.goto_prev({buf=0})<CR>",
		"LSP go to previous diagnostics",
		opts
	)
	utils.map("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buf=0})<CR>", "LSP go to next diagnostics", opts)
	utils.map("n", "<leader>lb", ":LspRestart<CR>", "LSP restart", opts)
	utils.map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "LSP format", opts)
	utils.map("n", "<leader>lq", vim.diagnostic.setloclist, "LSP set loclist", opts)
	utils.map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", "LSP show document symbols", opts)
	utils.map("n", "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<CR>", "LSP show workspace symbols", opts)
	utils.map("n", "<leader>lR", "<cmd>Telescope lsp_references<CR>", "Show LSP references Telescope", opts)
	utils.map("n", "<leader>lp", vim.lsp.buf.signature_help, "LSP show signature help", opts)
	utils.map("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", "LSP Show code outline", opts)
	-- lsp info
	utils.map("n", "<leader>li", "<cmd>LspInfo<CR>", "LSP Show info", opts)
end

-- make_capabilities function
local function lsp_default_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	-- Include folder supoort for lsp
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
	return capabilities
end

return {
	on_attach_keymaps = on_attach_keymaps,
	lsp_default_capabilities = lsp_default_capabilities,
}
