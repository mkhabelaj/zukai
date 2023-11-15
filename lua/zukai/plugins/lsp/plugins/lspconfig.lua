return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		"jose-elias-alvarez/typescript.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{
			"smjonas/inc-rename.nvim",
			config = true,
		},
	},
	config = function()
		local lspconfig = require("lspconfig")
		local settings = require("zukai.plugins.lsp.settings")
		local lsp_helpers = require("zukai.plugins.lsp.helpers")

		-- enable keybinds only for when lsp server available
		local on_attach = function(client, bufnr)
			lsp_helpers.on_attach_keymaps(client, bufnr)
		end

		local capabilities = lsp_helpers.lsp_default_capabilities()

		local setup = {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		-- merge lsp settings function
		local function merge_settings(setup_setting, lsp_settings, lsp_name)
			return vim.tbl_deep_extend("keep", setup_setting, lsp_settings[lsp_name] or {})
		end

		for _, lsp_name in ipairs(require("zukai.plugins.lsp.config.servers")) do
			lspconfig[lsp_name].setup(merge_settings(setup, settings, lsp_name))
		end
	end,
}
