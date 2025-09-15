local ok, catppuccin = pcall(require, "catppuccin")
if not ok then
  vim.notify("Catppuccin theme not found, falling back to default", vim.log.levels.WARN)
  vim.cmd.colorscheme("default")
  return
end

catppuccin.setup({
  flavour = "mocha",
  background = {
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false,
  show_end_of_buffer = false,
  term_colors = false,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  no_italic = false,
  no_bold = false,
  no_underline = false,
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    telescope = {
      enabled = true,
    },
    mason = true,
    which_key = true,
  },
})

-- Apply the colorscheme
local set_colorscheme_ok = pcall(vim.cmd.colorscheme, "catppuccin")
if not set_colorscheme_ok then
  vim.notify("Failed to set catppuccin colorscheme, using default", vim.log.levels.ERROR)
  vim.cmd.colorscheme("default")
end
