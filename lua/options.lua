-- disable netrw at the very start of your init.lua (strongly advised)
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

local options = {
	clipboard = "unnamedplus",
	splitbelow = true,
	splitright = true,
	cursorline = true,
	number 	   = true,
	tabstop    = 2,
	softtabstop = 2,
	shiftwidth = 2,
	mouse = "a",
	ignorecase = true,
	smartindent = true,
	signcolumn = "yes",
	showmode = false,
	expandtab = true,
	updatetime = 300,
	termguicolors = true, -- To enable highlight groups
	relativenumber = true,
}


for k,v in pairs(options) do
	vim.opt[k] = v
end
-- Sets colors to line numbers Above, Current and Below  in this order
function LineNumberColors()
	vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#51B3EC', bold=true })
	vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
	vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })
end
