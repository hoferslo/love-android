
function love.draw()

        love.graphics.clear(love.graphics.getBackgroundColor())



        love.graphics.setCanvas(Canvas)
        
        -- Clear the canvas
        love.graphics.clear()
        ForDraw(Collections["tiles"])
        ForDraw(Collections["buttons"])
        ForDraw(Collections["enemies"])
        ForDraw(Collections["enemyProj"])
        ForDraw(Collections["playerProj"])
        ForDraw(Collections["strings"])
        ForDraw(Collections["gores"])
        ForDraw(Collections["enemiesDead"])
        ForDraw(Collections["hud"])
        ForDrawDict(Collections["borders"])
        ForDraw(Collections["enviorment"])
        ForDraw(Collections["enviormentCollide"])
        ForDraw(Collections["itemsOnGround"])
        if mc ~= null then
            ForDraw({mc})
        end
        -- Draw your content on the canvas

        -- Reset the rendering target to the screen
        love.graphics.setCanvas()

        -- Draw the canvas on the screen
        love.graphics.draw(Canvas, 0, 0, 0, SettingsScale["x"], SettingsScale["y"])
        for _, touch in pairs(Touches) do
            love.graphics.circle("fill", touch.xDraw, touch.yDraw, 10)
        end
        
        if HasSomeTimePassed then
            SettingsInfo["FPS"] = SettingsDt["game_tick"]/(Dt*SettingsDt["game_tick"])
            HasSomeTimePassed = false
        end
        love.graphics.rectangle("line", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
        love.graphics.print(love.graphics.getDPIScale(), love.graphics.getWidth()-100, 20)
        love.graphics.print(string.format("%.2f", SettingsInfo["FPS"]), love.graphics.getWidth()-50, 5)
    
end
