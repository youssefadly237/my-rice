return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  config = function()
    require("lsp_lines").setup()
    vim.diagnostic.config({
      virtual_lines = true,
      virtual_text = false,
    })
  end,
}

