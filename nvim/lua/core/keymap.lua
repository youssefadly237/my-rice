local map = vim.keymap.set

-- Toggle spell check
map("n", "<C-s>", ":set spell!<CR>", { desc = "Toggle spell check", silent = true })
map("i", "<C-s>", "<C-O>:set spell!<CR>", { desc = "Toggle spell check", silent = true })

-- Navigate spelling mistakes
map("n", "]s", "]s", { desc = "Next spelling mistake" })
map("n", "[s", "[s", { desc = "Previous spelling mistake" })

-- Suggest and manage dictionary
map("n", "z=", "z=", { desc = "Suggest spelling corrections" })
map("n", "zg", "zg", { desc = "Mark word as correct" })
map("n", "zw", "zw", { desc = "Mark word as incorrect" })

-- LSP Code Action
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action", silent = true })

-- Diagnostic panel
vim.keymap.set("n", "<leader>dp", "<cmd>Telescope diagnostics<CR>", { desc = "Open Diagnostics Panel" })

-- Copy Diagnostics
vim.keymap.set({ "n", "v" }, "<leader>cc", function()
	local start_line, end_line

	if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
		start_line = vim.fn.line("v")
		end_line = vim.fn.line(".")
		if start_line > end_line then
			start_line, end_line = end_line, start_line
		end
	else
		start_line = vim.fn.line(".")
		end_line = start_line
	end

	local severity_names = {
		[vim.diagnostic.severity.ERROR] = "Error",
		[vim.diagnostic.severity.WARN] = "Warning",
		[vim.diagnostic.severity.INFO] = "Info",
		[vim.diagnostic.severity.HINT] = "Hint",
	}

	local diagnostics = vim.diagnostic.get(0)
	local lines_with_issues = {}

	for _, d in ipairs(diagnostics) do
		local lnum = d.lnum + 1
		if lnum >= start_line and lnum <= end_line then
			local line_text = vim.api.nvim_buf_get_lines(0, d.lnum, d.lnum + 1, false)[1]
			local severity = severity_names[d.severity] or "Unknown"
			local message = ("[%d] %s\n%s: %s"):format(lnum, line_text, severity, d.message)
			table.insert(lines_with_issues, message)
		end
	end

	if #lines_with_issues == 0 then
		vim.notify("No diagnostics in selected range", vim.log.levels.WARN)
		return
	end

	local final = table.concat(lines_with_issues, "\n\n")
	vim.fn.setreg("+", final)
	vim.notify("Copied diagnostics with severity to clipboard")
end, { desc = "Copy diagnostics (with severity) on line or selection" })
