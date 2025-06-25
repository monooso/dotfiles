-- <Space> is my leader.
-- This must be configured before any plugins are loaded.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Configure options.
require 'monooso.options'

-- Configure providers.
require 'monooso.providers'

-- Configure common key bindings.
-- Refer to individual plugin files for plugin-specific key bindings.
require 'monooso.keys'

-- Install and configure plugins using Lazy.
require 'monooso.lazy'

-- Configure diagnostic messages.
require 'monooso.diagnostic'
