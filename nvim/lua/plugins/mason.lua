return {
	"williamboman/mason.nvim",
	opts = {
		ensure_installed = {
			-- LSPs
			"pyright",
			"clangd",
			"typescript-language-server",
			"eslint-lsp",
			"lua-language-server",

			-- Formatters
			"black",
			"clang-format",
			"stylua",
			"prettier",

			-- Linters
			"pylint",
			"markdownlint",
		},
	},
}
