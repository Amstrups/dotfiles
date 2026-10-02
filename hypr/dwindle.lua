hl.config({
	general = {
		layout = "dwindle"
	},
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

hl.bind("SUPER + J", hl.dsp.layout("togglesplit")) -- dwindle only
