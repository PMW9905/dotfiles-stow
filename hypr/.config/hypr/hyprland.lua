-- #######################################################################################
-- HYPRLAND CONFIG - Converted to Lua for v0.55
-- #######################################################################################
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/
-- The config is located at ~/.config/hypr/hyprland.lua
-- Split configs into separate files with: require("myfile")
----------------
-- MONITORS   --
----------------
-- See https://wiki.hypr.land/Configuring/Monitors/
hl.monitor({ output = "DP-1", mode = "3440x1440@240", position = "0x0", scale = 1 })
hl.monitor({ output = "DP-2", mode = "3440x1440@240", position = "0x0", scale = 1 })
hl.monitor({ output = "DP-3", mode = "3440x1440@240", position = "0x0", scale = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "3840x2160@120", position = "0x0", scale = 1 })

-----------------
-- MY PROGRAMS --
-----------------
local terminal = "kitty"
local menu     = "wofi --show drun --width 400 --height 300"

---------------
-- AUTOSTART --
---------------
-- exec-once equivalents: wrap in hl.on("hyprland.start", ...) so they run only once at boot
hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpaper &")
	-- hl.exec_cmd("hyprlock &")
	hl.exec_cmd("waybar &")
	hl.exec_cmd(terminal .. " --hold -T NeoFetchSplash fastfetch")
	hl.exec_cmd(os.getenv("HOME") .. "/.config/hypr/display_setup_handling.sh")
end)

------------------------
-- ENVIRONMENT VARIABLES
------------------------
-- See https://wiki.hypr.land/Configuring/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")

-----------------------
-- LOOK AND FEEL      --
-----------------------
-- See https://wiki.hypr.land/Configuring/Variables/

hl.config({
	general = {
		gaps_in          = 20,
		gaps_out         = { left = 40, right = 40, top = 30, bottom = 40 },
		border_size      = 0,
		-- https://wiki.hypr.land/Configuring/Variables/#variable-types for info about colors
		col              = {
			active_border   = "rgba(dbbc7faa)",
			inactive_border = "rgba(595959aa)",
		},
		resize_on_border = false,
		allow_tearing    = false,
		layout           = "dwindle",
	},
})

hl.config({
	cursor = {
		inactive_timeout = 3,
	}
})


hl.config({
	decoration = {
		rounding         = 10,
		rounding_power   = 2,
		active_opacity   = 1.0,
		inactive_opacity = 0.8,
		shadow           = {
			enabled      = true,
			range        = 4,
			render_power = 3,
			color        = "rgba(1a1a1aee)",
		},
		blur             = {
			enabled  = true,
			size     = 3,
			passes   = 1,
			vibrancy = 0.1696,
		},
	},
})

----------------
-- ANIMATIONS  --
----------------
-- See https://wiki.hypr.land/Configuring/Animations/
hl.config({
	animations = {
		enabled = true,
	},
})

--        NAME             X0     Y0     X1    Y1
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

--            LEAF              ENABLED  SPEED   BEZIER          [STYLE]
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

----------------
-- WORKSPACES  --
----------------
-- See https://wiki.hypr.land/Configuring/Workspace-Rules/
hl.workspace_rule({ workspace = "1", persistent = true })
hl.workspace_rule({ workspace = "2", persistent = true })
hl.workspace_rule({ workspace = "3", persistent = true })
hl.workspace_rule({ workspace = "4", persistent = true })

-- "Smart gaps" / "No gaps when only" — uncomment to enable:
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-----------------
-- LAYOUTS      --
-----------------
-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
hl.config({
	master = {
		new_status = "master",
	},
})

---------
-- MISC --
---------
hl.config({
	misc = {
		font_family             = "UbuntuMono Nerd Font",
		force_default_wallpaper = 1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
	},
})

-----------
-- INPUT  --
-----------
-- See https://wiki.hypr.land/Configuring/Variables/#input
hl.config({
	input = {
		kb_layout    = "us",
		kb_variant   = "",
		kb_model     = "",
		kb_options   = "",
		kb_rules     = "",

		follow_mouse = 1,
		sensitivity  = -0.7, -- -1.0 - 1.0, 0 means no modification.

		touchpad     = {
			natural_scroll = false,
		},

		repeat_rate  = 50,
		repeat_delay = 200,
	},
})

-- See https://wiki.hypr.land/Configuring/Gestures/
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/
hl.device({
	name        = "epic-mouse-v1",
	sensitivity = -0.5,
})

------------------
-- KEYBINDINGS   --
------------------
-- See https://wiki.hypr.land/Configuring/Basics/Binds/
local mainMod = "SUPER"

-- Screenshots
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprshot -m region"))

-- Applications
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(terminal .. [[ sh -c "fastfetch; exec $SHELL"]]))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal .. " --hold -T NeoFetchSplash fastfetch"))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + TAB", hl.dsp.window.pseudo())     -- dwindle
hl.bind(mainMod .. " + O", hl.dsp.layout("togglesplit")) -- dwindle

-- Move focus with mainMod + HJKL (vim-style)
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Scroll through existing workspaces with mainMod + ctrl + arrow
hl.bind(mainMod .. " + CTRL + H", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.focus({ workspace = "e+1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-----------------------------
-- WINDOWS AND WORKSPACES  --
-----------------------------
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Custom window rule for NeoFetchSplash
hl.window_rule({
	name  = "neofetch-splash",
	match = { title = "^(NeoFetchSplash)$" },
	float = true,
	size  = { "800", "300" },
	move  = { "monitor_w*0.5-400", "monitor_h*0.5-150" },
})

-- Ignore maximize requests from all apps
hl.window_rule({
	name           = "suppress-maximize-events",
	match          = { class = ".*" },
	suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
	name     = "fix-xwayland-drags",
	match    = { class = "", title = "", xwayland = true, float = true, fullscreen = false, pin = false },
	no_focus = true,
})

-- Discord
hl.window_rule({
	name    = "Discord",
	match   = { class = "discord" },
	opacity = "0.9 override",
})

-- Picture-in-Picture
hl.window_rule({
	name              = "picture-in-picture",
	match             = { title = "^(Picture-in-Picture)$" },
	float             = true,
	pin               = true,
	keep_aspect_ratio = true,
	move              = { "monitor_w*0.72", "monitor_h*0.07" },
	size              = { "monitor_w*0.25", "monitor_h*0.25" },
	opacity           = "1.0 override",
})

-- Discord Popout (PiP style)
hl.window_rule({
	name              = "discord-pip",
	match             = { title = "^(Discord Popout)$" },
	float             = true,
	pin               = true,
	keep_aspect_ratio = true,
	move              = { "monitor_w*0.72", "monitor_h*0.07" },
	size              = { "monitor_w*0.25", "monitor_h*0.25" },
	opacity           = "1.0 override",
})

-- Steam games → special:magic workspace, fullscreen
hl.window_rule({
	name       = "steam-games",
	match      = { class = "^(steam_app_.*)$" },
	workspace  = "special:magic",
	fullscreen = true,
})

-- wofi layer rules (uncomment to enable)
-- hl.layer_rule({ layer = "wofi", ignorezero = true })
-- hl.layer_rule({ layer = "wofi", blur = true })

-- waybar layer rules (uncomment to enable)
-- hl.layer_rule({ layer = "waybar", no_anim = true })
