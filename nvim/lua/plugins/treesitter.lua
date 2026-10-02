return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		lazy = vim.fn.argc(-1) == 0,
		config = function()
			-- 		local configs = require("nvim-treesitter.configs")

			-- 		configs.setup({
			-- 			ensure_installed = { "lua", "vim", "vimdoc", "query", "go", "c" },
			-- 			sync_install = false,
			-- 			highlight = { enable = true },
			-- 			indent = { enable = true },
			-- 		})
		end
	},
}
