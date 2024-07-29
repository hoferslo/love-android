function CheckCollision(rect1, rect2)
    return rect1.x < rect2.x + rect2.xhit and
            rect1.x + rect1.xhit > rect2.x and
            rect1.y < rect2.y + rect2.yhit and
            rect1.y + rect1.yhit > rect2.y
end

function followObject(object, ignore)
    if ignore == nil then
        ignore = {}
    end
    local diffX, diffY = (Screen.xhit * 0.5 - object.x - object.xhit * 0.5), (Screen.yhit * 0.5 - object.y - object.yhit * 0.5)

    -- Iterate over Collections
    for name, collection in pairs(Collections) do
        -- Check if the current collection's name should be ignored
        if not ignore[name] then
            for _, item in ipairs(collection) do
                -- Update item coordinates
                item.x = item.x + diffX
                item.y = item.y + diffY
            end
        end
    end
end


