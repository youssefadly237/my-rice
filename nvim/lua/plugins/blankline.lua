return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  opts = function()
    local hooks = require("ibl.hooks")
    local colors = {
      "#3b5f7f", -- dark muted blue
      "#7f4f5f", -- dark muted red/pink
      "#4f7f5f", -- dark muted green
    }

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "IblIndentBase", { fg = "#3b4261" })

      for i, color in ipairs(colors) do
        vim.api.nvim_set_hl(0, "IblIndent" .. i, { fg = color })
      end
    end)

    local highlight = {}
    for i = 1, #colors do
      table.insert(highlight, "IblIndent" .. i)
      table.insert(highlight, "IblIndentBase")
    end

    return {
      indent = {
        char = "",
      },
      whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
      },
      scope = {
        enabled = false,
      },
    }
  end,
}
