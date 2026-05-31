-- Configure the Rose Pine colour scheme.
--
-- @see https://github.com/rose-pine/neovim

require('rose-pine').setup({
  styles = { italic = false },
})

vim.cmd.colorscheme('rose-pine')
