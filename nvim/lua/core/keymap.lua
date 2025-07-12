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
vim.keymap.set("n", "<leader>cc", function()
	local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
	if #diagnostics == 0 then
		vim.notify("No diagnostics on this line", vim.log.levels.WARN)
		return
	end

	local messages = {}
	-- reverse iteration
	for i = #diagnostics, 1, -1 do
		table.insert(messages, diagnostics[i].message)
	end

	local text = table.concat(messages, "\n")
	vim.fn.setreg("+", text)
	vim.notify("Copied diagnostic(s) to clipboard")
end, { desc = "Copy diagnostics on line (preserve order)", silent = true })
