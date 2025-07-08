# my-rice

> I’m just saving some configs so I don’t have to redo everything later.
> Not perfect, but works.

---

## Philosophy

This is a personal rice setup. It’s not a dotfiles framework.
I keep my setup minimal, portable, and easy to restore.

---

## Includes

### Neovim

- Plugin manager: [lazy.nvim](https://github.com/folke/lazy.nvim)
- Colorscheme: [catppuccin](https://github.com/catppuccin/nvim)
- LSPs: `pyright`, `clangd`
- Formatters: `black`, `clang-format`, `stylua`, `prettier`
- Autopairs, Treesitter, basic completion (not AI)
- Extras:
  - `comment.lua`
  - `explorer.lua` (file explorer)
  - `gitsigns.lua` (git integration),
  - `lsp_lines.lua` (LSP UI)
  - `lualine.lua` (statusline)
  - `luasnip.lua` (snippets)
  - `mason.lua` (LSP installer)
  - `telescope.lua` (fuzzy finder)
  - `whichkey.lua` (keybindings helper)

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

## Installation Script?

Not yet. For now, just symlink manually. I might add `setup.sh` or `dotbot` later.

---

## License

MIT — use it, fork it, break it, fix it.
