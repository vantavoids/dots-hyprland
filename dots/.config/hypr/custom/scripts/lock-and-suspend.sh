#!/usr/bin/env bash
# Lock the session, wait until the lock surface is up, then suspend.
#
# Why: locking during suspend-prep (hypridle before_sleep_cmd) races logind's 5s
# inhibitor window and the machine suspends still unlocked. Locking fully BEFORE
# asking for suspend removes the race.
#
# Note: under the Lua config, `hyprctl dispatch global quickshell:lock` is parsed
# as Lua and errors out, so we drive quickshell's lock via its IPC instead.

log="$HOME/.cache/lock-and-suspend.log"
echo "[$(date '+%F %T')] triggered (via ${1:-unknown})" >> "$log"

# Engage quickshell's WlSessionLock via its IPC (falls back to hyprlock).
qs -c "${qsConfig:-ii}" ipc call lock activate >> "$log" 2>&1 || { pidof hyprlock || hyprlock; } >> "$log" 2>&1
# Keep logind's session state consistent too (harmless if the relay is slow).
loginctl lock-session

# Give the lock surface time to actually map before we sleep.
sleep 1.5

echo "[$(date '+%F %T')] suspending now" >> "$log"
systemctl suspend || loginctl suspend
echo "[$(date '+%F %T')] resumed" >> "$log"
