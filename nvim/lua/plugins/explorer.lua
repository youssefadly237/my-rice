return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      filters = {
        git_ignored = true,
        dotfiles = true,
      },
      renderer = {
        highlight_hidden = "name",
      },
    })
    vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
  end,
}
