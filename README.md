# my-rice

> I'm just saving some configs so I don't have to redo everything later.
> Not perfect, but works.

---

## Philosophy

This is a personal rice setup. It's not a dotfiles framework.
I keep my setup minimal, portable, and easy to restore.

---

## Includes

### Neovim

- Plugin manager: [lazy.nvim](https://github.com/folke/lazy.nvim)
- Colorscheme: [catppuccin](https://github.com/catppuccin/nvim)
- LSPs: `pyright`, `clangd`, `ts-ls`, `rust-analyzer`, `lua-ls`, `bashls`
- Formatters: `black`, `clang-format`, `stylua`, `prettier`
- Linters:
  - `pylint` automatically uses the active Python virtual environment's `pylint` binary if available (that is much better than global (it wont be aware of your venv), just install pylint locally with dev flag); falls back to global `pylint`

- Autopairs, Treesitter, basic completion (not AI)
- Extras:
  - `autopairs`
  - `treesitter`
  - `comment.lua`
  - `explorer.lua` (file explorer)
  - `gitsigns.lua` (Git integration)
  - `lsp_lines.lua` (LSP UI improvements)
  - `lualine.lua` (statusline)
  - `luasnip.lua` (snippets)
  - `mason.lua` (LSP installer)
  - `telescope.lua` (fuzzy finder)
  - `whichkey.lua` (keybinding helper)

> See `nvim/lua/` for modular plugin setup.

To use:

```sh
ln -sf my-rice/nvim ~/.config/nvim
```

---

### Xournal++

- Custom palettes: `Adly.gpl`, `Adly2.gpl` # TODO rename them later
- Toolbar layout

To use:

```sh
ln -sf my-rice/xournalpp ~/.config/xournalpp
```

---

### Starship Prompt

Just a simple prompt setup for bash/zsh/fish:

```sh
ln -sf my-rice/starship/starship.toml ~/.config/starship.toml
```

---

### tmux

simple tmux config with `tpm`

```sh
ln -sf my-rice/tmux/tmux.conf ~/.tmux.conf
```

---

## Installation Script?

Not yet. For now, just symlink manually. I might add `setup.sh` or `dotbot` later.

---

## License

MIT — use it, fork it, break it, fix it.
