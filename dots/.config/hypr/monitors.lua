-- Monitor configuration (Lua equivalent of the old monitors.conf).
-- nwg-displays can overwrite this file if you use it.
-- vrr is left at the upstream default of 0 (off), which matches your previous setting.

hl.monitor({
    output = "DP-1",
    mode = "1920x1080@144",
    position = "0x0",
    scale = 1
})
hl.monitor({
    output = "DP-2",
    mode = "1920x1080@144",
    position = "auto-right",
    scale = 1
})
