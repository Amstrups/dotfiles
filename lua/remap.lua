local esc_term = '<C-\\><C-n>'
local window_switch = '<C-w><C-w>'
local window_close = '<C-w><C-q>'
vim.keymap.set('n', '<leader>pr', vim.cmd.Ex)
vim.keymap.set('t', '<Esc>',esc_term)
vim.keymap.set('t', window_switch, esc_term..window_switch)
vim.keymap.set('t', window_close, esc_term..window_close)
vim.keymap.set('v', '<c-i>', 'c*<c-r>"*<Esc>')
vim.keymap.set('v', '<c-b>', 'c**<c-r>"**<Esc>')
