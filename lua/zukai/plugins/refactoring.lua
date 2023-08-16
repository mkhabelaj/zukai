local setup, refactoring = pcall(require, "refactoring")

if not setup then
	return
end

refactoring.setup()
