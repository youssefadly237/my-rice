return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		null_ls.setup({
			sources = {
				-- C/C++
				formatting.clang_format,
				-- Python
				formatting.black,
				-- Lua
				formatting.stylua,
				-- JavaScript/TypeScript
				formatting.prettier,
				-- Markdown
				require("none-ls.diagnostics.eslint_d").with({
					condition = function(utils)
						return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
					end,
				}),
				formatting.prettier.with({
					filetypes = { "markdown", "md" },
				}),
				diagnostics.markdownlint,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ timeout_ms = 2000 })
						end,
					})
				end
			end,
		})
	end,
}
