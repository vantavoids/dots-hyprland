-- Personal general/decoration/input overrides

hl.config({
    general = {
        -- NOTE: the upstream base defaults this to true so the `immediate` window
        -- rule (see custom/rules.lua) can actually tear. Kept false to match your
        -- previous config; set to true if you want tearing for Steam games.
        allow_tearing = false
    },
    decoration = {
        blur = {
            -- Personal preference. Only has a visible effect when blur is enabled;
            -- the upstream base disables blur globally by default.
            passes = 2
        }
    },
    input = {
        -- Compose key for accents and special characters
        kb_options = "compose:rctrl"
    }
})
