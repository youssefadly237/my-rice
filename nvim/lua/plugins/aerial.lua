return {
  "stevearc/aerial.nvim",
  lazy = true,
  cmd = { "AerialToggle", "AerialOpen", "AerialNavToggle" },
  keys = {
    { "<leader>o", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial outline" },
  },
  opts = {
    backends = { "lsp", "treesitter", "markdown" },
    layout = {
      max_width = { 40 },
      min_width = 20,
      default_direction = "prefer_right",
    },
    show_guides = true,
    filter_kind = false,
    highlight_on_hover = true,
    autojump = false,
    on_attach = function(bufnr)
      local map = function(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { buffer = bufnr, noremap = true, silent = true, desc = desc })
      end
      map("zO", "<cmd>AerialOpenAll<CR>", "Expand all symbols")
      map("zC", "<cmd>AerialCloseAll<CR>", "Collapse all symbols")
      map("]]", "<cmd>AerialNext<CR>", "Next symbol")
      map("[[", "<cmd>AerialPrev<CR>", "Previous symbol")
    end,
  },
}
