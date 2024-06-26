local wezterm = require('wezterm')

return {
  check_for_updates = false,
  color_scheme = 'PaperColor Light (base16)',
  -- color_scheme = 'Black Metal (Bathory) (base16)',
  default_cursor_style = 'BlinkingBar',

  -- Font. Wezterm bundles and uses JetBrains Mono by default.
  -- @see https://wezfurlong.org/wezterm/config/fonts.html
  font_size = 15,
  line_height = 1.75,
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, -- Disable ligatures.

  -- Chrome.
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  window_decorations = 'RESIZE'
}
