-- Personal window/layer rules

-- Allow tearing (immediate) for Steam games.
-- Requires general.allow_tearing = true to actually tear (see custom/general.lua).
hl.window_rule({ match = { class = "^(steam_app_.*)$" }, immediate = true })
