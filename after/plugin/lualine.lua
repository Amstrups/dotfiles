local colors = {
  active_orange =    '#d94e18',
  inactive_orange =  '#70270a',
  inactive_fg_grey = '#e0e0e0',
}
local custom_catppuccin = require'lualine.themes.catppuccin'

custom_catppuccin.inactive.c.bg = colors.inactive_orange
custom_catppuccin.inactive.c.fg = colors.inactive_fg_grey
custom_catppuccin.normal.c.bg = colors.active_orange
custom_catppuccin.normal.c.fg = colors.inactive_fg_grey


require('lualine').setup {
  options = { theme = custom_catppuccin },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
      }
    }
  }
}
