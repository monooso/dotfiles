-- Configure the many modules of Mini.
--
-- @see https://github.com/echasnovski/mini.nvim

-- mini.ai
-- Extend and create a/i text objects.
--
-- Examples:
--  va)  - [V]isually select [A]round [)]paren
--  yinq - [Y]ank [I]nside [N]ext [Q]uote
--  ci'  - [C]hange [I]nside [']quote
require('mini.ai').setup()

-- mini.files
-- Navigate and manipulate the file system.
require('mini.files').setup({
  windows = {
    preview = true,
    width_focus = 25,
    width_nofocus = 25,
    width_preview = 50
  }
})
vim.keymap.set({ 'n' }, '<Leader>ge', MiniFiles.open)

-- mini.icons
-- Icon provider.
require('mini.icons').setup()

-- mini.notify
-- Fancy-pants notifications UI.
require('mini.notify').setup()

-- mini.splitjoin
-- Split and join arguments using `gS`.
require('mini.splitjoin').setup()

-- mini.surround
-- Add, delete, and replace surrounding characters (brackets, quotes, etc.).
require('mini.surround').setup()

-- mini.statusline
-- Minimal, fast, and opinionated statusline.
require('mini.statusline').setup()
