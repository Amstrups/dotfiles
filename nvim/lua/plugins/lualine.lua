return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	lazy = vim.fn.argc(-1) == 0,
	config = function()
		local custom_catppuccin = require 'lualine.themes.catppuccin'
		local lualine = require('config.palette').lualine

		custom_catppuccin.inactive.c.bg = lualine.inactive_orange
		custom_catppuccin.inactive.c.fg = lualine.inactive_fg_grey
		custom_catppuccin.normal.c.bg = lualine.active_orange
		custom_catppuccin.normal.c.fg = lualine.inactive_fg_grey


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
	end,
}
