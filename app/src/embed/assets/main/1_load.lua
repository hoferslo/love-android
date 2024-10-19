function love.load()
    DM = DebugManager()
    SettingsInfo["OS"] = love.system.getOS()

    if SettingsInfo["OS"] == "Windows" then
        love.window.updateMode(0, 0, { fullscreen = false, vsync = SettingsDisplay["vsync"] })
    else
        love.window.updateMode(0, 0, { fullscreen = SettingsDisplay["fullscreen"], vsync = SettingsDisplay["vsync"] })--, usedpiscale=false
    end
    love.graphics.setBlendMode(SettingsData.blendMode, SettingsData.blendModeAlpha)
    Canvas = love.graphics.newCanvas(love.graphics.getWidth() / SettingsScale["x"], love.graphics.getHeight() / SettingsScale["y"], SettingsCanvas)
    Screen = BasicObject(0, 0, Canvas:getWidth(), Canvas:getHeight())

    HasSomeTimePassed = false
    HasSomeTimePassedCounter = 0

    LM = LayerManager()

    for _, layer in ipairs(LM.layers) do
        layer:load()
    end
end
