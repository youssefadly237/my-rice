return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	config = function()
		require("lsp_lines").setup()
		vim.diagnostic.config({
			update_in_insert = true,
			virtual_lines = true,
			virtual_text = false,
		})

		vim.keymap.set("", "<Leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
	end,
}
