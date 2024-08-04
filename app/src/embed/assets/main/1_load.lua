function love.load()
    SettingsInfo["OS"] = love.system.getOS()

    if SettingsInfo["OS"] == "Windows" then
        love.window.updateMode(love.graphics.getWidth(), love.graphics.getHeight(), { fullscreen = false, vsync = SettingsDisplay["vsync"] })
    else
        love.window.updateMode(love.graphics.getWidth(), love.graphics.getHeight(), { fullscreen = SettingsDisplay["fullscreen"], vsync = SettingsDisplay["vsync"] })--, usedpiscale=false
    end

    Canvas = love.graphics.newCanvas(love.graphics.getWidth() / SettingsScale["x"], love.graphics.getHeight() / SettingsScale["y"], SettingsCanvas)
    Screen = BasicObject(0, 0, Canvas:getWidth(), Canvas:getHeight())

    HasSomeTimePassed = false
    HasSomeTimePassedCounter = 0

    LM = LayerManager()
end
