
love.graphics.setDefaultFilter("nearest", "nearest")
jit.on( )


function Reset_settings()

    SettingsData = {
      dpi = 3,
      saveSettings = 0,  -- Set to 1 if settings were changed
      vSync = 1,
      useParticles = 1,
      particlesLimitMax = 10000,
      particlesLimitMin = 100,
      useOptimizedParticles = 1,
      usePerformanceInformation = 1,
      displayOrientation = 0,  -- 0 = landscape, 1 = portrait
      itemsOnGroundLimitMax = 60
  }
end

SettingsCanvas = {
    format = "normal",  -- The pixel format of the canvas ("normal" or "hdr")
    msaa = 0,           -- The number of antialiasing samples
    dpiscale = 1,       -- The DPI scale factor of the canvas
    --mipmaps = true,     -- Whether to generate mipmaps for the canvas
}

SettingsScale = {
  x = 2, --number for scaling the canvas, higher the number less pixels will the canvas have
  y = 2, 
  x_images = 2, -- number for scaling the images, higher the number, bigger the images
  y_images = 2,
}

SettingsDt = {
  game_tick = 125,
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
  vsync = 1,
  msaa = 0,
}

SettingsInfo = {
  FPS = 0
}