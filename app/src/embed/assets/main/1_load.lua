function love.load()
    DM = DebugManager()
    SettingsInfo["OS"] = love.system.getOS()
    shader = love.graphics.newShader("initialization-engine/libraries/customBlendMode.glsl")
    shader:send("blendFactor", {0.5, 0.5, 0.5, 0.5})
    if SettingsInfo["OS"] == "Windows" then
        love.window.updateMode(0, 0, { fullscreen = false, vsync = SettingsDisplay["vsync"] })
    else
        love.window.updateMode(0, 0, { fullscreen = SettingsDisplay["fullscreen"], vsync = SettingsDisplay["vsync"] })--, usedpiscale=false
    end
    love.graphics.setBlendMode(SettingsData.blendMode, SettingsData.blendModeAlpha)
    Canvas = love.graphics.newCanvas(love.graphics.getWidth() / SettingsScale["x"], love.graphics.getHeight() / SettingsScale["y"], SettingsCanvas)
    LightCanvas = love.graphics.newCanvas(Canvas:getWidth(), Canvas:getHeight(), SettingsCanvas)
    Screen = BasicObject(0, 0, Canvas:getWidth(), Canvas:getHeight())
    Screen.width = Canvas:getWidth()
    Screen.height = Canvas:getHeight()

    HasSomeTimePassed = false
    HasSomeTimePassedCounter = 0

    love.graphics.setBackgroundColor(25 / 255, 60 / 255, 62 / 255)

    LM = LayerManager()

    for _, layer in ipairs(LM.layers) do
        layer:load()
    end
end
