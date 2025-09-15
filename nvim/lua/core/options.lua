-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Indentation
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true

-- Search
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Clipboard
vim.o.clipboard = "unnamedplus"

-- Mouse
vim.o.mouse = "a"

-- Backup and swap
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.undofile = true

-- UI improvements
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.wrap = false
vim.o.cursorline = true
vim.o.signcolumn = "yes"

-- Completion
vim.o.wildmenu = true
vim.o.wildmode = "longest:full,full"
vim.o.completeopt = "menu,menuone,noselect"

-- Performance
vim.o.updatetime = 300
vim.o.timeoutlen = 500

vim.o.list = true
vim.o.listchars = "tab:→ ,space:·"

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Spell checking
vim.opt.spell = true
vim.opt.spelllang = { "en" }

-- Folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = false

-- Python-specific folding override
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.foldmethod = "indent"
  end,
})

vim.g.neovide_scale_factor = 0.75
