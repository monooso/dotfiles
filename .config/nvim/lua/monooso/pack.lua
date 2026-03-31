-- Plugin management via Neovim 0.12's built-in vim.pack.

-- Treesitter: re-run TSUpdate whenever the plugin is updated.
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.kind ~= 'delete' and ev.data.spec.name == 'nvim-treesitter' then
      -- Ensure the plugin is active before running TSUpdate.
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('TSUpdate')
    end
  end,
})

-- Install all core plugins.
vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.nvim',       version = vim.version.range('*') },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/saghen/blink.cmp',          version = vim.version.range('1.x') },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/folke/tokyonight.nvim' },
  { src = 'https://github.com/lambdalisue/vim-fern' },
  { src = 'https://github.com/akinsho/toggleterm.nvim' },
  { src = 'https://github.com/CRAG666/code_runner.nvim' },
  { src = 'https://github.com/tpope/vim-sleuth' },
  { src = 'https://github.com/vim-test/vim-test' },
})

-- conform.nvim: loaded lazily on first write or on explicit command.
-- This avoids paying the startup cost when no formatting is needed.

local function load_conform()
  vim.pack.add({ { src = 'https://github.com/stevearc/conform.nvim' } })
  require('conform').setup({
    notify_on_error = false,
    format_on_save = {
      lsp_format = 'fallback',
      timeout_ms = 500,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
    },
  })
end

-- Load conform on the first BufWritePre, then re-fire the event so the
-- initial save is still formatted.
vim.api.nvim_create_autocmd('BufWritePre', {
  once = true,
  callback = function()
    local ok, err = pcall(load_conform)
    if ok then
      vim.api.nvim_exec_autocmds('BufWritePre', { buffer = 0 })
    else
      vim.notify('conform.nvim failed to load: ' .. tostring(err), vim.log.levels.WARN)
    end
  end,
})

-- Expose ConformInfo without requiring conform to be loaded first.
vim.api.nvim_create_user_command('ConformInfo', function()
  local ok, err = pcall(load_conform)
  if ok then
    vim.cmd('ConformInfo')
  else
    vim.notify('conform.nvim failed to load: ' .. tostring(err), vim.log.levels.WARN)
  end
end, {})
