

function love.touchpressed(id, x, y, dx, dy, pressure)
    -- Store touch information in the table
    Touches[id] = BasicTouch(x, y, id, nil)

end


function love.touchmoved(id, x, y, dx, dy, pressure)
    -- Update touch information in the table
    if Touches[id] ~= nil then
        Touches[id].x = x
        Touches[id].y = y
    end
    Touches[id]:CalcScale()
end


function love.touchreleased(id, x, y, dx, dy, pressure)
    -- Remove touch information from the table when a touch is released
    if Touches[id].bind ~= nil then
        Touches[id].bind:OnLetGo()
    end
    Touches[id] = nil
end

function love.keypressed(key, scancode, isrepeat)
    -- key: The key that was pressed (as a string)
    -- scancode: The scancode representing the key
    -- isrepeat: Whether this keypress is a repeat event
    if key == "escape" then
        love.event.quit() -- Quit the game if the 'Escape' key is pressed
    elseif key == "space" then
        -- Handle space keypress
    elseif key == "a" then
        -- Handle 'A' keypress
    end
end

function love.keyreleased(key)
    -- Handle key release if needed
end

function love.mousepressed(x, y, button, istouch, presses)
    -- Simulate a touch press when the left mouse button is clicked
    if button == 1 then
        local fakeTouchID = 999  -- Use a unique ID for the fake touch event
        love.touchpressed(fakeTouchID, x, y, 0, 0, 1)
    end
end

function love.mousereleased(x, y, button, istouch, presses)
    -- Simulate a touch release when the left mouse button is released
    if button == 1 then
        local fakeTouchID = 999  -- Use the same unique ID used for the fake touch event
        love.touchreleased(fakeTouchID, x, y, 0, 0, 0)
    end
end
