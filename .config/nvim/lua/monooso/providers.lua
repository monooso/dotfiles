-- @todo Consider conditionally disabling providers, according to existence of binaries.
local g = vim.g

-- Do not rely on any external dependencies; Lua or Vimscript only.
g.loaded_perl_provider = 0
g.loaded_python_provider = 0
g.loaded_python3_provider = 0
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0

