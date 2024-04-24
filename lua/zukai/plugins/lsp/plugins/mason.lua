return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		-- import mason plugin safely
		local mason = require("mason")

		-- import mason-lspconfig plugin safely
		local mason_lspconfig = require("mason-lspconfig")

		-- import mason-null-ls plugin safely
		local mason_null_ls = require("mason-null-ls")

		-- enable mason
		mason.setup()

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = require("zukai.plugins.lsp.config.servers"),
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_null_ls.setup({
			-- list of formatters & linters for mason to install
			ensure_installed = {
				"prettier",
				"stylua",
				"black",
				"clang-format",
				"jdtls",
				-- php linting and formatting
				"phpcs",
				"phpcbf",
				-- For debugging
				"debugpy",
				"codelldb",
				"java-debug-adapter",
				"java-test",
				"google-java-format",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true,
		})
	end,
}
