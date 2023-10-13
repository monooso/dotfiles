local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  hidden = true,
  direction = "tab",
  on_open = function(term)
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = true, silent = true })
  end,
})

function toggle_lazygit()
  lazygit:toggle()
end

-- [L]aunch [L]azygit
vim.keymap.set("n", "<leader>ll", toggle_lazygit, { silent = true })
