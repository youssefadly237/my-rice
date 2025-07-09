-- Go to next spelling mistake
vim.keymap.set("n", "]s", "]s", { desc = "Next spelling mistake" })

-- Go to previous spelling mistake
vim.keymap.set("n", "[s", "[s", { desc = "Previous spelling mistake" })

-- Show suggestions for misspelled word and replace it
vim.keymap.set("n", "z=", "z=", { desc = "Suggest spelling corrections" })

-- Add word to dictionary (good word)
vim.keymap.set("n", "zg", "zg", { desc = "Mark word as correct" })

-- Mark word as wrong (add to bad list)
vim.keymap.set("n", "zw", "zw", { desc = "Mark word as incorrect" })
