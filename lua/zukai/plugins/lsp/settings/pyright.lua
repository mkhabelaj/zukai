return {
	pyright = {
		settings = {
			python = {
				analysis = {
					autoImportCompletions = true,
					typeCheckingMode = "on",
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
					diagnosticMode = "workspace", -- "openFilesOnly",
				},
			},
		},
	},
}
