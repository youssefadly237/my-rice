vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
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

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = false

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.foldmethod = "indent"
  end,
})

vim.g.neovide_scale_factor = 0.75
