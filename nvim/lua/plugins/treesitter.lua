return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			-- Core
			"lua",
			"vim",
			"vimdoc",
			"query",

			-- System
			"c",
			"cpp",
			"rust",

			-- Scripting
			"bash",
			"python",
			"fish",

			-- Web
			"html",
			"css",
			"javascript",
			"typescript",
			"json",

			-- Data & config
			"yaml",
			"toml",
			"markdown",
			"markdown_inline",

			-- Build tools / Git
			"regex",
			"make",
			"cmake",
			"git_config",
			"gitcommit",
			"gitattributes",

			-- Extras
			"latex",
		},
		auto_install = true,
		highlight = {
			enable = true,
		},
	},
}
