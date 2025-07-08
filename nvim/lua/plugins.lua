require("lazy").setup({
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ import = "plugins.cmp" },
	{ import = "plugins.lsp" },
	{ import = "plugins.treesitter" },
	{ import = "plugins.mason" },
	{ import = "plugins.lsp_lines" },
	{ import = "plugins.formatters" },
	{ import = "plugins.autopairs" },
})
