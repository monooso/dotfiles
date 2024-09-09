local wezterm = require 'wezterm'
local mux = wezterm.mux

-- Always maximise the window when the GUI is attached.
wezterm.on('gui-attached', function(_)
  local workspace = mux.get_active_workspace()
  for _, window in ipairs(mux.all_windows()) do
    if window:get_workspace() == workspace then
      window:gui_window():maximize()
    end
  end
end)

-- Define some "known good" colour schemes, so I'm not faffing about every time I fancy a change.
local color_schemes = {
  dark = {
    black_metal = 'Black Metal (Bathory) (base16)',
    fahrenheit = 'Fahrenheit',
    tokyo = 'Tokyo Night',
  },
  light = {
    alabaster = 'Alabaster',
    atelier = 'Atelier Estuary Light (base16)',
    ayu = 'Ayu Light (Gogh)',
    dawnfox = 'dawnfox',
    papercolor = 'PaperColor Light (base16)',
    tokyo = 'Tokyo Night Day',
  }
}

-- Configure Wezterm.
local config = wezterm.config_builder()

config.check_for_updates = false
config.color_scheme = color_schemes.light.tokyo
config.default_cursor_style = 'BlinkingBar'

-- Use Fish shell, always. Act as though it's the login shell.
config.default_prog = { '/opt/homebrew/bin/fish', '--login' }

-- Font. Wezterm bundles and uses JetBrains Mono by default.
-- @see https://wezfurlong.org/wezterm/config/fonts.html
config.font_size = 15
config.line_height = 1.75
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' } -- Disable ligatures.

-- Chrome.
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = 'RESIZE'

return config
