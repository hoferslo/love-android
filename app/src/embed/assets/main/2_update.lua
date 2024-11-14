function love.update(dt) -- the code is set, so that the game always runs at SettingsDt["game_tick"] ticks a second. unless slower of course...
    DM:update()
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


    end
end
