-- Ensure everything is installed before proceeding.
require('monooso.bootstrap').setup()

if require('monooso.bootstrap').bootstrapping() then
  print 'Plugins are being installed. Wait until Packer completes, then restart Neovim.'
  return
end

-- Configure everything. Keymaps must come first, so the `<Leader>` key is set.
require('monooso.keymaps').setup()
require('monooso.settings').setup()
require('monooso.treesitter').setup()
require('monooso.lsp').setup()
