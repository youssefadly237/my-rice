local map = vim.keymap.set
local opts = { silent = true }

-- Toggle spell check
map("n", "<C-s>", ":set spell!<CR>", { desc = "Toggle spell check", silent = true })
map("i", "<C-s>", "<C-O>:set spell!<CR>", { desc = "Toggle spell check", silent = true })

-- Fix last spelling mistake in Insert mode
map("i", "<C-f>", function()
	local badword = vim.fn.spellbadword()[1] -- Get the misspelled word under/after cursor
	if badword == "" then
		vim.notify("No spelling error found", vim.log.levels.INFO)
		return
	end

	local suggestions = vim.fn.spellsuggest(badword)
	if #suggestions == 0 then
		vim.notify("No suggestions", vim.log.levels.INFO)
		return
	end

	-- Show the suggestions in the completion menu
	vim.schedule(function()
		vim.fn.complete(vim.fn.col("."), suggestions)
	end)
end, { desc = "Show spelling suggestions as popup" })

-- Navigate spelling mistakes
map("n", "]s", "]s", { desc = "Next spelling mistake" })
map("n", "[s", "[s", { desc = "Previous spelling mistake" })

-- Suggest and manage dictionary
map("n", "z=", "z=", { desc = "Suggest spelling corrections" })
map("n", "zg", "zg", { desc = "Mark word as correct" })
map("n", "zw", "zw", { desc = "Mark word as incorrect" })
