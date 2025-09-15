return {
  "neovim/nvim-lspconfig",
  version = false,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- Needed to bridge LSP and nvim-cmp
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Python LSP
    lspconfig.pyright.setup({
      capabilities = capabilities,
    })

    -- C/C++ LSP
    lspconfig.clangd.setup({
      capabilities = capabilities,
    })

    -- TypeScript/JavaScript LSP
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
    })

    -- Rust
    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          diagnostics = {
            enable = true,
            experimental = {
              enable = true,
            },
          },
          check = {
            command = "clippy",
          },
          rustfmt = {
            rangeFormatting = {
              enable = true,
            },
          },
          formatting = {
            enable = true,
          },
        },
      },
    })

    -- Lua LSP (for Neovim config/dev)
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          format = {
            enable = true,
          },
          indent = {
            style = "space",
            size = 2,
          },
          runtime = {
            version = "LuaJIT", -- for Neovim
          },
          diagnostics = {
            globals = { "vim" }, -- no undefined 'vim'
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })

    -- Bash LSP
    lspconfig.bashls.setup({
      capabilities = capabilities,
    })

    -- TOML LSP (Taplo)
    lspconfig.taplo.setup({
      capabilities = capabilities,
    })
  end,
}
