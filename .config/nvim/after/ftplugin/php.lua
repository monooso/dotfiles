-- Local buffer options
local o = vim.bo

o.expandtab = true
o.shiftwidth = 4
o.softtabstop = 4
o.tabstop = 4

-- We use Sail on Linux.
if vim.uv.os_uname().sysname == 'Linux' then
    vim.g['test#php#pest#executable'] = 'sail artisan test'
    vim.g['test#php#phpunit#executable'] = 'sail artisan test'
end
