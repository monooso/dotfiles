-- Note: the `lazy` and `priority` options must be applied to the current theme.
-- lazy: false
-- priority: 1000
return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      bold_vert_split = true,
      dark_variant = "moon",
      disable_italics = true,
      highlight_groups = {
        -- Make tabs and trailing whitespace less obnoxious.
        Whitespace = { fg = "overlay" },
      }
    },
  },
  {
    "nordtheme/vim",
    name = "nord",
    config = function()
      vim.g.nord_cursor_line_number_background = true
    end,
  }
}
