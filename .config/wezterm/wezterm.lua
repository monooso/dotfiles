-- Reasonable colour schemes, I think. I'm still not sure how to get Neovim
-- to inherit the terminal colour scheme. Pretty sure it has *something* to do
-- with the "truecolors" and `vim.o.termguicolors`.
local color_schemes = {
  dark = {
    black_metal = "Black Metal (Bathory) (base16)",
  },
  light = {
    alabaster = "Alabaster",
    atelier = "Atelier Estuary Light (base16)",
    ayu = "Ayu Light (Gogh)",
    dawnfox = "dawnfox",
    papercolor = "PaperColor Light (base16)",
  }
}


return {
  check_for_updates = false,
  color_scheme = color_schemes.light.atelier,
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
