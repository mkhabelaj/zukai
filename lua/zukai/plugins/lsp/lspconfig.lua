local function extend(tab1, tab2)
	for _, value in ipairs(tab2 or {}) do
		table.insert(tab1, value)
	end
	return tab1
end

local utils = require("zukai.utils")

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
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- import typescript plugin safely
		local typescript = require("typescript")

		-- enable keybinds only for when lsp server available
		local on_attach = function(client, bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }
			-- keybind options
			-- A function to simplify setting the keymap. and takes into account for variations above

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
			utils.map(
				"n",
				"<leader>lj",
				"<cmd>lua vim.diagnostic.goto_next({buf=0})<CR>",
				"LSP go to next diagnostics",
				opts
			)
			utils.map("n", "<leader>lR", ":LspRestart<CR>", "LSP restart", opts)
			utils.map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "LSP format", opts)
			utils.map("n", "<leader>lq", vim.diagnostic.setloclist, "LSP set loclist", opts)
			utils.map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", "LSP show document symbols", opts)
			utils.map("n", "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<CR>", "LSP show workspace symbols", opts)
			utils.map("n", "<leader>lR", "<cmd>Telescope lsp_references<CR>", "Show LSP references Telescope", opts)
			utils.map("n", "<leader>lp", vim.lsp.buf.signature_help, "LSP show signature help", opts)
			utils.map("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", "LSP Show code outline", opts)
		end

		local vim_opt = vim.o
		vim_opt.foldcolumn = "1" -- '0' is not bad
		vim_opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim_opt.foldlevelstart = 99
		vim_opt.foldenable = true

		-- make_capabilites function
		local function make_capabilities()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			-- Include folder supoort for lsp
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}
			capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
			return capabilities
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = make_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		-- local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
		-- for type, icon in pairs(signs) do
		--   local hl = "DiagnosticSign" .. type
		--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		-- end

		lspconfig["angularls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure typescript server with plugin
		typescript.setup({
			server = {
				capabilities = capabilities,
				on_attach = on_attach,
			},
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure tailwindcss server
		-- lspconfig["tailwindcss"].setup({
		--   capabilities = capabilities,
		--   on_attach = on_attach,
		-- })

		-- configure emmet language server
		--
		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		-- configure python server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = {
							"vim",
							"require",
						},
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		})

		-- configure jsonls server
		-- Todo move this into its own file

		local default_schemas = nil
		local status_ok, jsonls_settings = pcall(require, "nlspsettings.jsonls")
		if status_ok then
			default_schemas = jsonls_settings.get_default_schemas()
		end

		-- Find more schemas here: https://www.schemastore.org/json/
		local schemas = {
			{
				description = "TypeScript compiler configuration file",
				fileMatch = {
					"tsconfig.json",
					"tsconfig.*.json",
				},
				url = "https://json.schemastore.org/tsconfig.json",
			},
			{
				description = "Lerna config",
				fileMatch = { "lerna.json" },
				url = "https://json.schemastore.org/lerna.json",
			},
			{
				description = "Babel configuration",
				fileMatch = {
					".babelrc.json",
					".babelrc",
					"babel.config.json",
				},
				url = "https://json.schemastore.org/babelrc.json",
			},
			{
				description = "ESLint config",
				fileMatch = {
					".eslintrc.json",
					".eslintrc",
				},
				url = "https://json.schemastore.org/eslintrc.json",
			},
			{
				description = "Bucklescript config",
				fileMatch = { "bsconfig.json" },
				url = "https://raw.githubusercontent.com/rescript-lang/rescript-compiler/8.2.0/docs/docson/build-schema.json",
			},
			{
				description = "Prettier config",
				fileMatch = {
					".prettierrc",
					".prettierrc.json",
					"prettier.config.json",
				},
				url = "https://json.schemastore.org/prettierrc",
			},
			{
				description = "Vercel Now config",
				fileMatch = { "now.json" },
				url = "https://json.schemastore.org/now",
			},
			{
				description = "Stylelint config",
				fileMatch = {
					".stylelintrc",
					".stylelintrc.json",
					"stylelint.config.json",
				},
				url = "https://json.schemastore.org/stylelintrc",
			},
			{
				description = "A JSON schema for the ASP.NET LaunchSettings.json files",
				fileMatch = { "launchsettings.json" },
				url = "https://json.schemastore.org/launchsettings.json",
			},
			{
				description = "Schema for CMake Presets",
				fileMatch = {
					"CMakePresets.json",
					"CMakeUserPresets.json",
				},
				url = "https://raw.githubusercontent.com/Kitware/CMake/master/Help/manual/presets/schema.json",
			},
			{
				description = "Configuration file as an alternative for configuring your repository in the settings page.",
				fileMatch = {
					".codeclimate.json",
				},
				url = "https://json.schemastore.org/codeclimate.json",
			},
			{
				description = "LLVM compilation database",
				fileMatch = {
					"compile_commands.json",
				},
				url = "https://json.schemastore.org/compile-commands.json",
			},
			{
				description = "Config file for Command Task Runner",
				fileMatch = {
					"commands.json",
				},
				url = "https://json.schemastore.org/commands.json",
			},
			{
				description = "AWS CloudFormation provides a common language for you to describe and provision all the infrastructure resources in your cloud environment.",
				fileMatch = {
					"*.cf.json",
					"cloudformation.json",
				},
				url = "https://raw.githubusercontent.com/awslabs/goformation/v5.2.9/schema/cloudformation.schema.json",
			},
			{
				description = "The AWS Serverless Application Model (AWS SAM, previously known as Project Flourish) extends AWS CloudFormation to provide a simplified way of defining the Amazon API Gateway APIs, AWS Lambda functions, and Amazon DynamoDB tables needed by your serverless application.",
				fileMatch = {
					"serverless.template",
					"*.sam.json",
					"sam.json",
				},
				url = "https://raw.githubusercontent.com/awslabs/goformation/v5.2.9/schema/sam.schema.json",
			},
			{
				description = "Json schema for properties json file for a GitHub Workflow template",
				fileMatch = {
					".github/workflow-templates/**.properties.json",
				},
				url = "https://json.schemastore.org/github-workflow-template-properties.json",
			},
			{
				description = "golangci-lint configuration file",
				fileMatch = {
					".golangci.toml",
					".golangci.json",
				},
				url = "https://json.schemastore.org/golangci-lint.json",
			},
			{
				description = "JSON schema for the JSON Feed format",
				fileMatch = {
					"feed.json",
				},
				url = "https://json.schemastore.org/feed.json",
				versions = {
					["1"] = "https://json.schemastore.org/feed-1.json",
					["1.1"] = "https://json.schemastore.org/feed.json",
				},
			},
			{
				description = "Packer template JSON configuration",
				fileMatch = {
					"packer.json",
				},
				url = "https://json.schemastore.org/packer.json",
			},
			{
				description = "NPM configuration file",
				fileMatch = {
					"package.json",
				},
				url = "https://json.schemastore.org/package.json",
			},
			{
				description = "JSON schema for Visual Studio component configuration files",
				fileMatch = {
					"*.vsconfig",
				},
				url = "https://json.schemastore.org/vsconfig.json",
			},
			{
				description = "Resume json",
				fileMatch = { "resume.json" },
				url = "https://raw.githubusercontent.com/jsonresume/resume-schema/v1.0.0/schema.json",
			},
		}

		lspconfig["jsonls"].setup({
			capabilities = capabilities,
			settings = {
				json = {
					schemas = extend(schemas, default_schemas),
				},
			},
			setup = {
				commands = {
					Format = {
						function()
							vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
						end,
					},
				},
			},
		})
	end,
}
