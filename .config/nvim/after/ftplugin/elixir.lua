-- Elixir-specific settings
vim.keymap.set("i", "<C-|>", "|>", { buffer = true, remap = false, silent = true })
vim.keymap.set("i", "<C-~>", "=~", { buffer = true, remap = false, silent = true })

-- The standard wrapping width used by `mix format` is 98 characters.
vim.opt_local.colorcolumn = { 99 }

-- `mix format` does not apply to comments or docblocks. As a workaround, select
-- the comments to format, and type `gq`.
vim.opt_local.textwidth = 98
vim.opt_local.formatoptions = { 'q' }
