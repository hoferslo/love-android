love.graphics.setDefaultFilter("nearest", "nearest")
jit.on()

function Reset_settings()

    SettingsData = {
        --dpi = 3,
        saveSettings = 0, -- Set to 1 if settings were changed
        vSync = 0,
        useParticles = 1,
        particlesLimitMax = 10000,
        particlesLimitMin = 100,
        useOptimizedParticles = 1,
        usePerformanceInformation = 1,
        displayOrientation = 0, -- 0 = landscape, 1 = portrait
        itemsOnGroundLimitMax = 60,
        blendMode = "alpha",
        blendModeAlpha = "premultiplied"
    }
end
Reset_settings()
SettingsCanvas = {
    format = "normal", -- The pixel format of the canvas ("normal" or "hdr")
    msaa = 0, -- The number of antialiasing samples
    --dpiscale = 3, -- The DPI scale factor of the canvas   
    --mipmaps = true,     -- Whether to generate mipmaps for the canvas
}

SettingsScale = {
    x = 1, --number for scaling the canvas, higher the number less pixels will the canvas have
    y = 1,
    x_images = 2, -- number for scaling the images, higher the number, bigger the images
    y_images = 2,
}

SettingsDt = {
    game_tick = 60,
    game_dt_since_last_tick = 0,
    do_draw = 0
}

SettingsDisplay = {
    fullscreen = true,
    --fullscreenType = "desktop",
    --orientation = "portrait",
    resizable = true,
    borderless = false,
    minwidth = 0,
    minheight = 0,
    --highdpi = false,
    --srgb = false,
    vsync = 0,
    msaa = 0,
}

SettingsInfo = {
    FPS = 0,
    showFps = true,
    debug = true
}