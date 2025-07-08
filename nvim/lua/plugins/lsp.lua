return {
	"neovim/nvim-lspconfig",
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
	end,
}
