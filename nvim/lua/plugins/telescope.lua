return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    telescope.setup()

    -- Keymaps
    vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
  end,
}
