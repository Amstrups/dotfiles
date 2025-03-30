return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	lazy = vim.fn.argc(-1) == 0,
	config = function ()
		require("lualine").setup()
	end,
}
