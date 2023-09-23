local M = {}

M.setup = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

  if not vim.loop.fs_stat(lazypath) then
    -- Install the latest stable release of lazy.nvim
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end

  -- Add lazy.nvim to the path
  vim.opt.rtp:prepend(lazypath)

  -- Set up lazy.nvim
  -- Plugins are automatically loaded from the files in ~/.config/nvim/lua/plugins/*.lua
  require("lazy").setup("plugins")
end

return M
