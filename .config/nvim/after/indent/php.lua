-- *setlocal* buffer options
local o = vim.bo

-- Fix broken autoindentation
-- @see https://github.com/nvim-treesitter/nvim-treesitter/issues/462#issuecomment-700278736
o.indentexpr = ''
o.smartindent = true
o.syntax = 'on'
