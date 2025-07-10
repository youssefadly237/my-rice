return {
	"williamboman/mason.nvim",
	opts = {
		ensure_installed = {
			-- LSPs
			"pyright",
			"clangd",
			"typescript-language-server",
			"eslint-lsp",

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
