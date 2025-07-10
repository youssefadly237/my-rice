local map = vim.keymap.set
local opts = { silent = true }

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
