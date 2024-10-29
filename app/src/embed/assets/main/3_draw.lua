function love.draw()

    love.graphics.clear(love.graphics.getBackgroundColor())

    love.graphics.setCanvas(Canvas)

    -- Clear the canvas
    love.graphics.clear()

    LM:draw()

    -- Draw your content on the canvas

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

    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("line", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    love.graphics.setColor(1, 1, 1, 1)
    --love.graphics.print(#LM:getCollection("playerProj"), love.graphics.getWidth() - 100, 20)
    love.graphics.setBlendMode(SettingsData.blendMode)
    love.graphics.print(string.format("%.2f", SettingsInfo["FPS"]), love.graphics.getWidth() - 50, 5)

    DM:draw()
    
    love.graphics.setBlendMode(SettingsData.blendMode, SettingsData.blendModeAlpha)
end
