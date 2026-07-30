-- Personal autostart (former exec-once)

hl.on("hyprland.start", function()
    -- Session target: pulls in graphical-session.target so xdg-desktop-portal
    -- can start (needed for vesktop screenshare)
    hl.exec_cmd("systemctl --user start hyprland-session.target")

    -- Fedora: polkit authentication agent
    hl.exec_cmd("/usr/libexec/kf6/polkit-kde-authentication-agent-1")

    -- Autostart apps on specific workspaces
    hl.exec_cmd("[workspace 4] vesktop")
    -- hl.exec_cmd("[workspace 5] steam")
end)
