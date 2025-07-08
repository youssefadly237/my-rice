return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "c", "python", "lua" },
		highlight = { enable = true },
	},
}
