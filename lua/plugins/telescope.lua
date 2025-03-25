return {
	'nvim-telescope/telescope.nvim',
	config = function ()
		local builtin = require('telescope.builtin')

		vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
		vim.keymap.set('n', '<leader>pb', function()
			builtin.buffers()
		end, {})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
		vim.keymap.set('n', '<leader>a', builtin.marks, {})
		vim.keymap.set('n', '<leader>kk', builtin.keymaps, {})
	end,
}
