-- Configures Neovim options.
local o = vim.opt

o.mouse = 'a'              -- Enable mouse mode, because TJ said it was okay.

o.cursorline = true        -- Highlight the current line...
o.cursorlineopt = 'number' -- ...but just the line number.

o.number = true            -- Show line numbers.
o.relativenumber = true    -- Make them relative.
o.signcolumn = 'yes:2'     -- Show the sign column. Allow two cells for diagnostics.

o.expandtab = true         -- Tabs are the devil's plaything.
o.shiftwidth = 2           -- Set a sensible default indentation...
o.softtabstop = 2          -- ...and again...
o.tabstop = 2              -- ...and once more.

-- o.wrap = false               -- Only savages wrap lines.
o.breakindent = true -- Indent wrapped lines.
o.smartindent = true -- Be smart about indenting.

o.undofile = true    -- Save undo history.

o.ignorecase = true  -- Use case-insensitive searching...
o.smartcase = true   -- ...unless we use `\C` or the search term contains capitals.

o.list = true        -- Show invisible characters.
o.listchars = 'tab:▸ ,trail:•'

o.foldenable = false -- Disable folding; I never use it.
o.visualbell = true  -- Stop beeping me, dammit.
o.timeoutlen = 300   -- Don't wait around for keymappings to complete.

o.splitbelow = true  -- Open new splits below the current split.
o.splitright = true  -- Open new splits to the right of the current split.

o.laststatus = 3     -- Use the global status line.
o.cmdheight = 1      -- Keep the command line small.
o.shortmess = 'I'    -- Don't show the intro message on startup.
o.showmode = false   -- Don't show the mode; it's already in the status line.
o.scrolloff = 10     -- Minimum number of lines to show above and below cursor.
o.confirm = true     -- Ask if I want to save unsaved changes on `:q`.

-- Configure the built-in auto-complete menu.
-- - Always show the menu, even if there is only one item.
-- - Automatically select the first item.
-- - Do not automatically insert the first item, that way madness lies.
-- - Enable fuzzy matching.
o.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy' }

-- Improve the appearance of window splits.
vim.cmd [[highlight WinSeparator guifg=#908caa guibg=None]]

-- Sync the Neovim and OS clipboards.
-- Schdule the setting after `UiEnter`, as it can increase startup time.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Highlight text when yanking.
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight the yanked (copied) text',
  group = vim.api.nvim_create_augroup('monooso-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
