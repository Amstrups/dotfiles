local terminal    = "foot"
local fileManager = "nautilus"
local menu        = "rofi -show drun -theme ~/.config/rofi/launcher.rasi -hover-select -modes drun,window,ssh"

------------------
---- MONITORS ----
------------------
local monitors    = {
	main = {
		output   = "DP-2",
		mode     = "preferred",
		position = "auto-right",
		scale    = "auto",
	},
	secondary = {
		output   = "HDMI-A-2",
		mode     = "preferred",
		position = "auto-left",
		scale    = "auto",
	}
}

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor(monitors.main)
hl.monitor(monitors.secondary)

-------------------
----- IMPORTS -----
-------------------

local colors = require("themes/lava")

require("iobindings")
require("dwindle")
require("xdgopen")

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

local uniform_margin = 1

hl.config({
	general = {
		gaps_in          = uniform_margin / 2,
		gaps_out         = {
			top = 2,
			right = uniform_margin,
			bottom = uniform_margin,
			left = uniform_margin
		},

		border_size      = 2,

		col              = {
			active_border   = colors.main,
			inactive_border = colors.sec,
		},

		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing    = false,
	},


	decoration = {
		rounding       = 0,
		rounding_power = 0,

		shadow         = {
			enabled      = false,
			range        = 20,
			render_power = 6,
			color        = "0xee0f0f0f",
		},
	},

	animations = {
		enabled = false, -- most important
	},

	input      = {
		accel_profile =
		"custom 0.23 0.000 0.194 0.388 0.583 0.777 1.046 1.338 1.630 1.922 2.214 2.507 2.799 3.091 3.488 3.932 4.375 4.819 5.263 5.707 6.150 6.594 7.038 7.481 7.925 8.369 8.812 9.256 9.700 10.143 10.587 11.031 11.474 11.918 12.362 12.805 13.249 13.693 14.137 14.580 15.497",
		kb_layout     = "us",
		-- kb_variant    = "dvorak",
		kb_model      = "",
		kb_options    = "ctrl:nocaps",
		kb_rules      = "",

		follow_mouse  = 1,

		sensitivity   = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad      = {
			natural_scroll = false
		},
	},

	misc       = {
		background_color         = colors.bg,
		-- force_default_wallpaper = -1,  -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo    = true, -- If true disables the random hyprland logo / anime girl background. :(
		disable_splash_rendering = true
	},
})

-- nobody knows if you have fingers on a desktop
-- hl.gesture({
--     fingers = 3,
--     direction = "horizontal",
--     action = "workspace"
-- })
---------------------
---- KEYBINDINGS ----
---------------------

-- Move focus with mainMod + arrow keys
hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }), { description = "Move left" })
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))

hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))

hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))

hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

-- Custom shortcuts
hl.bind("SUPER + SHIFT + P", hl.dsp.window.resize({ x = 1300, y = 700, "exact" }))

-------------------------------------------
---- WINDOWS AND WORKSPACES(+KEYBINDS) ----
-------------------------------------------
---@param i integer
---@param monitor string
local function add_workspace(i, monitor)
	if i < 0 or i > 9 then
		error("cannot create workspace outside of interval [0-9]")
	end

	hl.workspace_rule({ workspace = "" .. i .. "", monitor = monitor })
	hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i, }))
	hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

add_workspace(1, monitors.main.output)
add_workspace(2, monitors.main.output)
add_workspace(3, monitors.main.output)
add_workspace(4, monitors.secondary.output)
add_workspace(5, monitors.secondary.output)

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind("SUPER + C", hl.dsp.window.close())

hl.bind("SUPER + Q", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + space", hl.dsp.exec_cmd(menu))
-- hl.bind("SUPER + SHIFT + space", hl.dsp.exec_cmd(windows))
hl.bind("SUPER + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + P", hl.dsp.window.pseudo())

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	-- authors note: I really didn't
	name           = "suppress-maximize-events",
	match          = { class = ".*" },

	suppress_event = "maximize",
})

suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name     = "fix-xwayland-drags",
	match    = {
		class      = "^$",
		title      = "^$",
		xwayland   = true,
		float      = true,
		fullscreen = false,
		pin        = false,
	},

	no_focus = true,
})
