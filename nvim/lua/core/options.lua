vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

vim.o.list = true
vim.o.listchars = "tab:→ ,space:·"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.spell = true
vim.opt.spelllang = { "en" }

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python", "lua", "javascript", "c", "cpp", "rust" },
	callback = function()
		vim.wo.spell = true
	end,
})
