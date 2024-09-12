-- Local buffer options
local o = vim.bo

o.expandtab = true
o.shiftwidth = 4
o.softtabstop = 4
o.tabstop = 4

-- Use the Sail PHP executable, if it exists
if vim.fn.executable('sail') then
    vim.g['test#php#pest#executable'] = 'sail artisan test'
    vim.g['test#php#phpunit#executable'] = 'sail artisan test'
end
