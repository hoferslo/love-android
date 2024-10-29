function checkCollision(rect1, rect2)
    return rect1.x < rect2.x + rect2.width and
            rect1.x + rect1.width > rect2.x and
            rect1.y < rect2.y + rect2.height and
            rect1.y + rect1.height > rect2.y
end

function followObject(object, ignore)
    if ignore == nil then
        ignore = {}
    end
    local diffX, diffY = (Screen.width * 0.5 - object.x - object.width * 0.5), (Screen.height * 0.5 - object.y - object.height * 0.5)

    -- Iterate over Collections
    for name, collection in pairs(LM:getCollections()) do
        -- Check if the current collection's name should be ignored
        if not ignore[name] then
            for _, item in ipairs(collection) do
                -- Update item coordinates
                item:followObject(diffX, diffY)
            end
        end
    end
end

function RecreateScreen()
    Canvas = love.graphics.newCanvas(math.floor(love.graphics.getWidth() / SettingsScale["x"]), math.floor(love.graphics.getHeight() / SettingsScale["y"]), SettingsCanvas)

    Screen.width = Canvas:getWidth()
    Screen.height = Canvas:getHeight()
    followObject(LM:getMC())
    print("Recreating Screen and Canvas")
end

