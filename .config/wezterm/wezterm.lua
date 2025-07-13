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
    tokyo = 'Tokyo Night Moon',
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
config.default_cursor_style = 'BlinkingBar'

-- Font. Wezterm bundles and uses JetBrains Mono by default.
-- @see https://wezfurlong.org/wezterm/config/fonts.html
--
-- Font size on Wayland is all over the place. Thankfully I no longer need to worry
-- about this working consistently across Linux and macOS.
config.font_size = 12
config.line_height = 1.75
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' } -- Disable ligatures.

-- Colours.
config.color_scheme = color_schemes.dark.tokyo

-- Tabs.
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = true

config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = 'transparent',
      fg_color = '#FFFFFF',
      intensity = 'Bold',
    },
  }
}

-- Chrome.
config.window_decorations = 'NONE'

return config
