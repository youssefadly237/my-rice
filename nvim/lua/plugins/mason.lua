return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- LSPs
      "clangd",
      "eslint-lsp",
      "lua-language-server",
      "pyright",
      "typescript-language-server",
      "bash-language-server",

      -- Linters
      "eslint_d",
      "markdownlint",
      "pylint",

      -- Formatters
      "black",
      "clang-format",
      "prettier",
      "stylua",
      "sql-formatter",
      "shrmt",
    },
  },
}
