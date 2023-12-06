return {
  {
    "ishan9299/nvim-solarized-lua",
    name = "solarized",
    config = function()
      vim.g.solarized_italics = false
      vim.g.solarized_visibility = "low"

      -- Remove the godawful line number background colour.
      local colorscheme_group = vim.api.nvim_create_augroup("SolarizedTweaks", { clear = true })

      vim.api.nvim_create_autocmd("ColorScheme", {
        command = "highlight LineNr ctermbg=none guibg=none",
        group = colorscheme_group,
        pattern = "solarized"
      })
    end
  },
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
  },
  {
    -- Note the `lazy` and `priority` settings. This ensures my preferred colour scheme
    -- is loaded before all other plugins.
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
  }
}
