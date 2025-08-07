return {
	"akinsho/git-conflict.nvim",
	version = "*",
	config = function()
		require("git-conflict").setup()

		-- Adjust colors to match catppuccin-mocha theme
		vim.api.nvim_set_hl(0, "GitConflictCurrent", { bg = "#313244" }) -- a bit darker
		vim.api.nvim_set_hl(0, "GitConflictIncoming", { bg = "#45475a" }) -- medium
		vim.api.nvim_set_hl(0, "GitConflictAncestor", { bg = "#585b70" }) -- lightest

		-- Optional: Clear foreground text color if you want to keep theme's default
		vim.api.nvim_set_hl(0, "GitConflictCurrentLabel", { fg = "#cba6f7", bold = true })
		vim.api.nvim_set_hl(0, "GitConflictIncomingLabel", { fg = "#94e2d5", bold = true })
	end,
}
