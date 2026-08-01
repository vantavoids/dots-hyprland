hl.bind("CTRL+SUPER+ALT+Slash", hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.lua"), {description = "Edit user keybinds"} )

-- Override Super+Shift+L: lock fully first, then suspend. Upstream binds it
-- straight to `systemctl suspend`, which races the pre-sleep lock and resumes
-- onto an unlocked desktop. See custom/scripts/lock-and-suspend.sh.
hl.unbind("SUPER + SHIFT + L")
hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd("$HOME/.config/hypr/custom/scripts/lock-and-suspend.sh"),
    { locked = true, description = "Session: Lock & sleep" })
