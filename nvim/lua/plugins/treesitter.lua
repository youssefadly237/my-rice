return {
	"nvim-treesitter/nvim-treesitter",
	-- btw do not use gcc on windows, just install clang
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
			"latex", -- depends on tree-sitter-cli
		},
		auto_install = true,
		highlight = {
			enable = true,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)

		vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
			callback = function()
				local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
				if lang and require("nvim-treesitter.parsers").has_parser(lang) then
					vim.cmd("TSBufEnable highlight")
				end
			end,
		})
	end,
}
