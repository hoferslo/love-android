function love.update(dt)
    Dt = dt
    SettingsDt["game_dt_since_last_tick"] = SettingsDt["game_dt_since_last_tick"] + dt
    if love.mouse.isDown(1) then
        local fakeTouchID = 999  -- Use the same unique ID used for the fake touch event
        local x, y = love.mouse.getPosition()
        love.touchmoved(fakeTouchID, x, y, 0, 0, 1)
    end

    if 1 / SettingsDt["game_tick"] < SettingsDt["game_dt_since_last_tick"] then
        HasSomeTimePassedCounter = HasSomeTimePassedCounter + Dt
        if (HasSomeTimePassedCounter > 0.05) then
            HasSomeTimePassedCounter = 0
            HasSomeTimePassed = true
        end
        SettingsDt["game_dt_since_last_tick"] = 0
        SettingsDt["do_draw"] = 1

        --tileGeneratorInst:update()
        LM:update()

        if math.random(1, 120) == 1 then
            local enemy = TestEnemy(math.random(Screen.x + Screen.width * 0.1, Screen.x + Screen.width * 0.1 + Screen.width * 0.9), 1)

            LM:insertObject(enemy, "enemies")
        end
    end
end
