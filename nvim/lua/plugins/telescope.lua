return {
	'nvim-telescope/telescope.nvim',
	config = function()
		local builtin = require('telescope.builtin')


		vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
		vim.keymap.set('n', '<leader>pb', function()
			builtin.buffers {
				attach_mappings = function(_, map)
					map({ "n", "i" }, "<C-t>", function(_prompt_bufnr)
						require('telescope.actions').delete_buffer(_prompt_bufnr)
					end)
					return true
				end
			}
		end, {})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
		vim.keymap.set('n', '<leader>a', builtin.marks, {})
		vim.keymap.set('n', '<leader>kk', builtin.keymaps, {})
		vim.keymap.set('n', '<leader>w', builtin.spell_suggest, {})

		-- ToLearnList
		local cmds = require('config.tolearn').commands
		local finders = require('telescope.finders')
		local pickers = require('telescope.pickers')

		local tl_cmds = pickers.new({
			finder = finders.new_table(cmds)
		})

		vim.keymap.set('n', '<leader>tl', function()
			tl_cmds:find()
		end)
	end,
}
