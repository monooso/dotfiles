local wezterm = require('wezterm')
-- local colors = require('lua/rose-pine-moon').colors()

return {
  check_for_updates = false,
  color_scheme = 'Black Metal (Bathory) (base16)',
  -- colors = colors,
  default_cursor_style = 'BlinkingBar',

  -- Font. Wezterm bundles and uses JetBrains Mono by default.
  -- @see https://wezfurlong.org/wezterm/config/fonts.html
  font_size = 15,
  line_height = 1.75,
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, -- Disable ligatures.

  -- Chrome.
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true
}
