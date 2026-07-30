-- Personal environment variables

-- Terminal
hl.env("TERMINAL", "ghostty")

-- XWayland display
hl.env("DISPLAY", ":0")

-- NVIDIA
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GL_GSYNC_ALLOWED", "1")
hl.env("__GL_VRR_ALLOWED", "1")
hl.env("NVD_BACKEND", "direct")
