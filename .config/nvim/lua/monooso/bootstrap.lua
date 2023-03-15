local M = {}
local is_bootstrap = false

M.setup = function()
  -- Install packer
  local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.cmd [[packadd packer.nvim]]
  end

  -- Plugin list
  require('packer').startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Use `gc` to comment or uncomment visual regions or lines
    use 'numToStr/Comment.nvim'

    -- I'm losing track of all the keybindings. Make life easier with WhichKey.
    use { 'folke/which-key.nvim' }

    -- Use Fern as a better netrw.
    use 'lambdalisue/fern.vim'

    -- Harpoon makes jumping between commonly-accessed files much easier.
    use { 'ThePrimeagen/harpoon', requires = { 'nvim-lua/plenary.nvim' } }

    -- Use Telescope for fuzzy finding files.
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    -- Use toggleterm for, you know, toggling terminals
    use { 'akinsho/toggleterm.nvim', tag = '2.3.0' }

    -- Tree sitter takes care of highlighting and indentation (and other things, such as code folding, that I don't use).
    -- It also helps with code navigation, within the current file.
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- LSP, snippets, and autocompletion.
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'

    -- Manage LSP servers.
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- Completion sources.
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp'
    use 'saadparwaiz1/cmp_luasnip'

    -- Snippets.
    use 'L3MON4D3/LuaSnip'

    -- Welcome our new robot overlords
    use { 'zbirenbaum/copilot.lua',
      event = 'VimEnter',
      config = function()
        vim.defer_fn(function()
          require('copilot').setup()
        end, 100)
      end
    }

    use { 'zbirenbaum/copilot-cmp',
      after = { 'copilot.lua', 'nvim-cmp' },
      config = function()
        require('copilot_cmp').setup()
      end
    }

    -- Vim Sleuth figures out the tabstop and shiftwidth settings for the current file automatically.
    -- It also honours the EditorConfig file, if present.
    use 'tpope/vim-sleuth'

    -- Make everything moderately pretty.
    use 'ishan9299/nvim-solarized-lua'
    use { 'rose-pine/neovim', as = 'rose-pine', tag = 'v1.*' }

    -- Quickly run tests.
    use 'vim-test/vim-test'

    if is_bootstrap then
      require('packer').sync()
    end
  end)
end

M.bootstrapping = function()
  return is_bootstrap
end

return M
