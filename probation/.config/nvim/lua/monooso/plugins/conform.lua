-- Install Conform, a lightweight formatter plugin.
--
-- @see https://github.com/stevearc/conform.nvim

return {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' }
}
