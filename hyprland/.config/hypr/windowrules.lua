hl.window_rule({
    name = "opacity",
    match = { float = true, fullscreen = false },
    border_color = "rgba(33ccffee) rgba(595959aa)",
    opacity = "0.90",
})

hl.window_rule({
    name = "float-volume-control",
    match = { title = "^Volume Control$" },
    float = true,
})

hl.window_rule({
    name = "float-bluetooth",
    match = { title = "^Bluetooth Devices$" },
    float = true,
})

hl.window_rule({
    name = "float-firefox-pip",
    match = { class = "^firefox$", title = "^Picture-in-Picture$" },
    float = true,
})
