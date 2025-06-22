-- <Space> is my leader.
-- This must be configured before any plugins are loaded.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Configure options.
require 'monooso.options'

-- Configure common key bindings.
-- Refer to individual plugin files for plugin-specific key bindings.
require 'monooso.keys'

-- Configure providers.
require 'monooso.providers'

-- Install and configure plugins using Lazy.
require 'monooso.lazy'

-- Configure and enable language servers.
require 'monooso.lsp'

-- Configure diagnostic messages.
require 'monooso.diagnostic'
