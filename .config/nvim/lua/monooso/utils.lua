local wk = require('which-key')
local M = {}

-- Keep it simple to start with, and assume everything uses the `<leader>` prefix.
-- We also assume which key is installed, but there is the option to check for this in the future.
M.register_keymap = function(modes, group_prefix, mappings)
  for _index, mode in ipairs(modes) do
    wk.register({ [group_prefix] = mappings }, { mode = mode, prefix = '<leader>' })
  end
end

return M
