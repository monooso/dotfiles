-- Configure the Tokyo Night colour scheme.
--
-- @see https://github.com/folke/tokyonight.nvim

require('tokyonight').setup({
  on_highlights = function(hl, colors)
    -- Improve the appearance of window splits.
    hl.WinSeparator = { bg = colors.none, fg = colors.yellow }
  end,
  style = 'moon',
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
  },
})

vim.cmd.colorscheme('tokyonight')
