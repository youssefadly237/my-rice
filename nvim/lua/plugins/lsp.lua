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
					checkOnSave = {
						command = "clippy", -- optional, adds linting on save
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
						default_config = {
							indent_style = "tab",
						},
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
	end,
}
