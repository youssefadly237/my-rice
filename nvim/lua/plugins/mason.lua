return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "eslint",
        "lua_ls",
        "pyright",
        "ts_ls",
        "bashls",
        "html",
        "cssls",
        "taplo",
        "texlab",
      },
      automatic_installation = true,
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "black",
        "clang-format",
        "prettier",
        "stylua",
        "markdownlint",
        "pylint",
        "sql-formatter",
        "shfmt",
        "taplo",
        "latexindent",
      },
      auto_update = false,
      run_on_start = true,
    },
  },
}
