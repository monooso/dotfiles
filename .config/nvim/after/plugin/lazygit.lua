local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  hidden = true,
  direction = "tab",
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
})

function toggle_lazygit()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>sl", "<cmd>lua toggle_lazygit()<CR>", { noremap = true, silent = true })
