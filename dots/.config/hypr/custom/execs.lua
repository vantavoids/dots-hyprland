-- Personal autostart (former exec-once)

hl.on("hyprland.start", function()
    -- Session target: pulls in graphical-session.target so xdg-desktop-portal
    -- can start (needed for vesktop screenshare)
    hl.exec_cmd("systemctl --user start hyprland-session.target")

    -- Fedora: polkit authentication agent
    hl.exec_cmd("/usr/libexec/kf6/polkit-kde-authentication-agent-1")

    -- Vesktop: normal window on workspace 4 (tray icon via its own minimizeToTray setting)
    hl.exec_cmd("[workspace 4] vesktop")

    -- Steam: start silently to the system tray (no window, tray icon available)
    hl.exec_cmd("steam -silent")
end)
