local tolearn = {
	"':bd': close current buffer",
	"':marks': list current marks",
}

function spit()
	for _,v in pairs(tolearn) do
		print(v)
	end
end 

spit()


vim.keymap.set('n', '<leader>tl', spit)
