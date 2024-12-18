function love.draw()

    love.graphics.clear(love.graphics.getBackgroundColor())

    love.graphics.setCanvas(Canvas)

    -- Clear the canvas
    love.graphics.clear()

    LM:draw()
    --love.graphics.setShader(shader)
    --love.graphics.setCanvas({ LightCanvas, stencil = true})
    -- Draw your content on the canvas
    --love.graphics.setBlendMode(SettingsData.blendMode, SettingsData.blendModeAlpha)

    --love.graphics.setShader()
 
    

    love.graphics.setBlendMode(SettingsData.blendMode, SettingsData.blendModeAlpha)

    -- Reset the rendering target to the screen
    love.graphics.setCanvas()

    -- Draw the canvas on the screen
    love.graphics.draw(Canvas, 0, 0, 0, SettingsScale["x"], SettingsScale["y"])
    for _, touch in pairs(Touches) do
        love.graphics.circle("fill", touch.xDraw, touch.yDraw, 10)
    end

    if HasSomeTimePassed then
        SettingsInfo["FPS"] = SettingsDt["game_tick"] / (Dt * SettingsDt["game_tick"])
        HasSomeTimePassed = false
    end

    love.graphics.setColor(1, 1, 1, 1)
    --love.graphics.print(#LM:getCollection("playerProj"), love.graphics.getWidth() - 100, 20)
    love.graphics.setBlendMode(SettingsData.blendMode)
    if SettingsInfo["showFps"] then
        love.graphics.print(string.format("%.2f", SettingsInfo["FPS"]), love.graphics.getWidth() - 50, 5)
    end
    if SettingsInfo["debug"] then
        DM:draw()
    end
    
    love.graphics.setBlendMode(SettingsData.blendMode, SettingsData.blendModeAlpha)
end
