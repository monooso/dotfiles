local M = {}

M.setup = function()
    local g = vim.g
    local o = vim.o

    -- Highlight the current line number, so we know where we are.
    o.cursorline = true
    o.cursorlineopt = "number"

    -- Enable relative line numbers.
    o.number = true
    o.relativenumber = true

    -- Default to spaces.
    o.expandtab = true
    o.shiftwidth = 2
    o.softtabstop = 2
    o.tabstop = 2

    -- Be smart about indenting.
    o.smartindent = true

    -- Show invisible characters.
    o.list = true
    o.listchars = "tab:▸ ,trail:•"

    -- Disable folding.
    o.foldenable = false

    -- Don"t wrap lines, you savage.
    o.wrap = false

    -- Stop beeping me, dammit.
    o.visualbell = true

    -- Don't wait around for keymappings to complete.
    o.timeoutlen = 500

    -- Set the position of new splits. The defaults confuse me, every time.
    o.splitbelow = true
    o.splitright = true

    -- Use the global status line.
    o.laststatus = 3

    -- Now that we have a global status line, improve the appearance of window splits.
    vim.cmd [[highlight WinSeparator guifg=#908caa guibg=None]]

    -- Use case-insensitive searching, unless we use `/C`, or the search term contains a capital letter.
    o.ignorecase = true
    o.smartcase = true

    -- Keep the command line small.
    o.cmdheight = 1

    -- Don't show the intro message when starting Neovim.
    o.shortmess = 'I'

    -- Don't display a "short message" when switching mode; it's already in the status line.
    o.showmode = false

    -- Highlight text when yanking. Surprisingly helpful, and no longer requires a plugin.
    local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

    vim.api.nvim_create_autocmd("TextYankPost", {
        callback = function()
            vim.highlight.on_yank()
        end,
        group = highlight_group,
        pattern = "*",
    })

    -- Do not rely on any external dependencies; Lua or Vimscript only
    g.loaded_perl_provider = 0
    g.loaded_python_provider = 0
    g.loaded_python3_provider = 0
    g.loaded_node_provider = 0
    g.loaded_ruby_provider = 0
end

return M
