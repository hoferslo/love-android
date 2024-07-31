function love.update(dt)
    Dt = dt
    SettingsDt["game_dt_since_last_tick"] = SettingsDt["game_dt_since_last_tick"] + dt
    if love.mouse.isDown(1) then
        local fakeTouchID = 999  -- Use the same unique ID used for the fake touch event
        local x, y = love.mouse.getPosition()
        love.touchmoved(fakeTouchID, x, y, 0, 0, 1)
    end
    if math.floor(love.graphics.getWidth() / SettingsScale["x"]) ~= Screen.xhit or math.floor(love.graphics.getHeight() / SettingsScale["y"]) ~= Screen.yhit then
        Canvas = love.graphics.newCanvas(math.floor(love.graphics.getWidth() / SettingsScale["x"]), math.floor(love.graphics.getHeight() / SettingsScale["y"]), SettingsCanvas)

        Screen.xhit = Canvas:getWidth()
        Screen.yhit = Canvas:getHeight()
        followObject(mc)
        print("Recreating Screen and Canvas")
    end

    if 1 / SettingsDt["game_tick"] < SettingsDt["game_dt_since_last_tick"] then
        HasSomeTimePassedCounter = HasSomeTimePassedCounter + Dt
        if (HasSomeTimePassedCounter > 0.05) then
            HasSomeTimePassedCounter = 0
            HasSomeTimePassed = true
        end
        SettingsDt["game_dt_since_last_tick"] = 0
        SettingsDt["do_draw"] = 1

        --tileGeneratorInst:fun()
        ForLoop(Collections["tiles"])
        ForLoop(Collections["buttons"])
        ForLoop(Collections["enemies"])

        for i = #Collections["playerProj"], 1, -1 do
            if Collections["playerProj"][i]:fun() then
                table.remove(Collections["playerProj"], i)
            else
                for c = #Collections["enemies"], 1, -1 do
                    if Collections["playerProj"][i]:hasCollided(Collections["enemies"][c]) then
                        if Collections["playerProj"][i]:hit(Collections["enemies"][c]) then
                            table.remove(Collections["playerProj"], i)
                            break
                        end
                    end
                end
            end
        end

        ForLoop(Collections["enemyProj"])

        ForLoop(Collections["strings"])
        ForLoop(Collections["gores"])
        ForLoop(Collections["enemiesDead"])
        ForLoop(Collections["hud"])
        ForLoop(Collections["borders"])
        ForLoop(Collections["enviorment"])
        ForLoop(Collections["enviormentCollide"])
        ForLoop(Collections["itemsOnGround"])
        if mc ~= null then
            ForLoop({ mc })
            followObject(mc, { ["hud"] = true })
        end

        if math.random(1, 120) == 1 then
            local enemy = TestEnemy(math.random(Screen.x + Screen.xhit * 0.1, Screen.x + Screen.xhit * 0.1 + Screen.xhit * 0.9), 1)

            table.insert(Collections["enemies"], enemy)
        end
    end
end
