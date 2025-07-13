return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
				section_separators = "",
				component_separators = "",
			},
			sections = {
				lualine_x = {
					function()
						local venv = os.getenv("VIRTUAL_ENV")
						if venv then
							local parent = vim.fn.fnamemodify(venv, ":h:t") -- parent directory
							local name = vim.fn.fnamemodify(venv, ":t") -- venv name
							return " " .. parent .. "/" .. name
						end
						return ""
					end,
					"encoding",
					"fileformat",
					"filetype",
				},
			},
		})
	end,
}
