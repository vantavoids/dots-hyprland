#!/usr/bin/env bash
# Lock the session, wait until the lock is actually confirmed, then suspend.
#
# Why: relying on hypridle's before_sleep_cmd to lock during suspend-prep races
# logind's InhibitDelayMaxSec (5s). The async quickshell lock doesn't render in
# time, logind force-breaks the inhibitor, and the machine suspends still
# unlocked -> you resume onto an unlocked desktop. Locking fully BEFORE we ask
# for suspend removes the race entirely (normal locking works fine; only the
# suspend-prep path was failing).

loginctl lock-session

# Wait for logind to report the session locked (locker sets LockedHint), so we
# don't suspend before the lock surface is up. Cap at ~2s in case the locker
# never sets the hint, by which point it has rendered anyway.
sid="${XDG_SESSION_ID:-$(loginctl list-sessions --no-legend 2>/dev/null | awk -v u="$USER" '$3==u {print $1; exit}')}"
for _ in $(seq 1 20); do
    [ "$(loginctl show-session "$sid" -p LockedHint --value 2>/dev/null)" = "yes" ] && break
    sleep 0.1
done
sleep 0.3

systemctl suspend || loginctl suspend
