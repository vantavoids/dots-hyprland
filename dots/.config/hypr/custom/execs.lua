-- Personal autostart (former exec-once)

hl.on("hyprland.start", function()
    -- Session target: pulls in graphical-session.target so xdg-desktop-portal
    -- can start (needed for vesktop screenshare)
    hl.exec_cmd("systemctl --user start hyprland-session.target")

    -- Fedora: polkit authentication agent
    hl.exec_cmd("/usr/libexec/kf6/polkit-kde-authentication-agent-1")

    -- Vesktop: delay a few seconds so the bar's system-tray host is up first,
    -- otherwise vesktop's tray icon registers too early and never appears.
    -- Workspace-4 placement is handled by a window rule in custom/rules.lua.
    hl.exec_cmd("sleep 4 && vesktop")

    -- Steam: start silently to the system tray (no window, tray icon available)
    hl.exec_cmd("steam -silent")

    -- Force a neutral screen temperature at login (hyprsunset's default baseline
    -- is a slightly-warm 6000K; 6500K is true neutral). Runs after the shell has
    -- launched hyprsunset.
    hl.exec_cmd("sleep 6 && hyprctl hyprsunset temperature 6500")
end)
