local function goto_terminal(terminal_index)
  return function()
    vim.cmd(terminal_index .. ' ToggleTerm')
  end
end

require('toggleterm').setup({ direction = 'float' })

require('monooso.utils').register_keymap({ 'n' }, 'm', {
  name = 'Terminal',

  -- Navigate to the first four Harpooned files using the four right-hand home-row fingers.
  t = { goto_terminal(1), 'First terminal' },
  s = { goto_terminal(2), 'Second terminal' },
  r = { goto_terminal(3), 'Third terminal' },
  a = { goto_terminal(4), 'Fourth terminal' },
})
