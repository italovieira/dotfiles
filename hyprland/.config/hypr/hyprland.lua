-- edited from default config https://github.com/hyprwm/Hyprland/blob/a065b481f32f4297596a9cd9c538794fd4669b1a/example/hyprland.conf

hl.monitor({ output = "", mode = "preferred", position = "0x0", scale = "auto" })
hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "1920x0", scale = "auto" })

-- Execute on startup
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaybg --image ~/Pictures/wallpapers/.default")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("wl-paste --watch cliphist store")
end)

-- Some default env vars.
hl.env("XCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct") -- change to qt6ct if you have that

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 15,
        border_size = 2,
        col = {
            active_border = "rgba(33ccffee)",
            inactive_border = "rgba(595959aa)",
        },
        layout = "dwindle",
        -- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false,
    },

    decoration = {
        rounding = 7,
        blur = {
            enabled = false,
        },
        shadow = {
            enabled = true,
            color = 0xee1a1a1a,
        },
        active_opacity = 0.98,
        inactive_opacity = 0.98,
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        -- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        preserve_split = true, -- you probably want this
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    },

    input = {
        kb_layout = "eu",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
        touchpad = {
            natural_scroll = false,
        },
    },
})

-- Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
hl.curve("myBezier", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

-- Example per-device config
-- See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })

require("windowrules")
require("binds")
