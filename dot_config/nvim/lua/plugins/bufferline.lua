return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        numbers = "none",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator = {
          style = "icon",
          icon = "▎",
        },
        buffer_close_icon = "󰅖",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = "thin",
        enforce_regular_tabs = false,
        always_show_bufferline = false,
        sort_by = "insert_after_current",
      },
    })

    -- Keymaps
    local map = vim.keymap.set
    map("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer", silent = true })
    map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer", silent = true })
    map("n", "<leader>x", ":bdelete<CR>", { desc = "Close buffer", silent = true })
    map("n", "<leader>X", ":BufferLineCloseOthers<CR>", { desc = "Close other buffers", silent = true })
    map("n", "<leader>bp", ":BufferLinePick<CR>", { desc = "Pick buffer", silent = true })
  end,
}
