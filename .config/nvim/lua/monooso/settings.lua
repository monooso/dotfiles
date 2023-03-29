local M = {}

M.setup = function()
  local g = vim.g
  local o = vim.o

  -- Highlight the current line number, so we know where we are.
  o.cursorline = true
  o.cursorlineopt = 'number'

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
  o.listchars = 'tab:▸ ,trail:•'

  -- Disable folding.
  o.foldenable = false

  -- Don't wrap lines, you savage.
  o.wrap = false

  -- Stop beeping me, dammit.
  o.visualbell = true

  -- Set the position of new splits. The defaults confuse me, every time.
  o.splitbelow = true
  o.splitright = true

  -- Use the global status line, and set the content.
  o.laststatus = 3
  o.statusline = ' %(%<%f%m %)%=%( %l:%c %)'

  -- Now that we have a global status line, improve the appearance of window splits.
  vim.cmd [[highlight WinSeparator guifg=#908caa guibg=None]]

  -- Use case-insensitive searching, unless we use `/C`, or the search term contains a capital letter.
  o.ignorecase = true
  o.smartcase = true

  -- Hide the command line when not in use.
  -- @since Neovim 0.8
  o.cmdheight = false

  -- Set the colour scheme. Encapsulate everything in functions because I inevitably switch.
  o.background = 'dark'
  o.termguicolors = true

  -- Set colour scheme to Solarized Light.
  -- local function solarized_light()
  --   g.solarized_italics = false
  --   g.solarized_visibility = 'low'
  --
  --   -- Remove the godawful line number background colour.
  --   local colorscheme_group = vim.api.nvim_create_augroup('SolarizedTweaks', { clear = true })
  --
  --   vim.api.nvim_create_autocmd('ColorScheme', {
  --     command = 'highlight LineNr ctermbg=none guibg=none',
  --     group = colorscheme_group,
  --     pattern = 'solarized'
  --   })
  --
  --   vim.cmd [[colorscheme solarized]]
  -- end

  -- Set colour scheme to Rosé Pine. Automatically handles light or dark background.
  local function rose_pine()
    require('rose-pine').setup({
      bold_vert_split = true,
      dark_variant = 'moon',
      highlight_groups = {
        -- Add highlight groups for nvim-cmp.
        CmpItemAbbrMatch = { fg = 'pine' },
        CmpItemAbbrMatchFuzzy = { fg = 'pine' },

        CmpItemKindFunction = { fg = 'gold' },
        CmpItemKindMethod = { fg = 'gold' },

        CmpItemKindKeyword = { fg = 'iris' },
        CmpItemKindProperty = { fg = 'iris' },
        CmpItemKindUnit = { fg = 'iris' },

        CmpItemKindInterface = { fg = 'rose' },
        CmpItemKindText = { fg = 'rose' },
        CmpItemKindVariable = { fg = 'rose' },
      }
    })

    vim.cmd [[colorscheme rose-pine]]
  end

  rose_pine()

  -- Highlight text when yanking. Surprisingly helpful, and no longer requires a plugin.
  local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

  vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
  })

  -- Do not rely on any external dependencies; Lua or Vimscript only
  g.loaded_perl_provider = 0
  g.loaded_python_provider = 0
  g.loaded_python3_provider = 0
  g.loaded_node_provider = 0
  g.loaded_ruby_provider = 0
end

return M
