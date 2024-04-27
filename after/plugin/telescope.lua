local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>rf', function()
  print("NYI")
  builtin.lsp_references()
end, {})
vim.keymap.set('n', '<leader>ts', function()
  print("tst")
  builtin.lsp_outgoing_calls()
end, {})


--for key,value in pairs(builtin) do
--    print("found member " .. key);
--end

require('telescope').setup {
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  }
}
