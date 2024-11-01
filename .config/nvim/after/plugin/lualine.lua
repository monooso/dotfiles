-- Utility function to extend a table with another table.
local function extend_table(defaults, overrides)
  return vim.tbl_extend('force', defaults, overrides or {})
end

-- Make the Lualine theme a little less shouty.
local colors = require('tokyonight.colors').setup()
local default_section_colors = { bg = colors.bg, fg = colors.comment }

local function extend_mode_colors(mode_colors)
  local default_mode_colors = {
    a = default_section_colors,
    b = default_section_colors,
    c = default_section_colors,
    x = default_section_colors,
    y = default_section_colors,
    z = default_section_colors
  }

  return extend_table(default_mode_colors, mode_colors)
end

local theme = {
  normal = extend_mode_colors({ a = { bg = colors.blue, fg = colors.bg } }),
  insert = extend_mode_colors({ a = { bg = colors.green, fg = colors.bg } }),
  visual = extend_mode_colors({ a = { bg = colors.magenta, fg = colors.bg } }),
  replace = extend_mode_colors({ a = { bg = colors.orange, fg = colors.bg } }),
  command = extend_mode_colors({ a = { bg = colors.yellow, fg = colors.bg } }),
  inactive = extend_mode_colors(),
}

-- Configure Lualine.
local function extend_section_config(config)
  return { extend_table({ padding = 2 }, config) }
end

require('lualine').setup({
  global_status = true,
  options = {
    section_separators = '',
    theme = theme
  },
  sections = {
    lualine_a = extend_section_config({ 'mode' }),
    lualine_b = extend_section_config({ 'branch', 'diff' }),
    lualine_c = extend_section_config({
      'diagnostics',
      sources = { 'nvim_lsp' },
      sections = { 'error', 'warn' },
    }),
    lualine_x = extend_section_config({ 'filename' }),
    lualine_y = extend_section_config({
      "(vim.bo.expandtab and '␠' or '⇥') .. ' ' .. vim.bo.shiftwidth",
    }),
    lualine_z = extend_section_config({ 'encoding' }),
  }
})
